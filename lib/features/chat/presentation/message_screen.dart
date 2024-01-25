import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:provider/provider.dart';

import '../../session/data/session.dart';
import '../data/models/message.dart';
import '../services/chat_service.dart';
import 'widgets/chat_input_widget.dart';
import 'widgets/message_widget.dart';

import 'package:intl/intl.dart';
import 'package:xmtp/xmtp.dart' as xmtp;

import '../../../../utils/namespace.dart';
import '../../wallet_connect/presentation/wallet_connect_screen.dart';
import '../data/models/message.dart';

@RoutePage()
class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
    required this.topic,
  });

  final String topic;

  @override
  State<MessageScreen> createState() => _State();
}

class _State extends State<MessageScreen> {
  late final ChatService _service;
  late final Session _session;
  List<Map> msgList = [];

  // xmtp.EncodedContent Function(List<int> i, [ExtensionRegistry r]) _decode(msg) {
  //   final text = xmtp.EncodedContent.fromBuffer;
  //   return text;
  // }

  //   Future<xmtp.EncodedContent> encode(int decoded) async => xmtp.EncodedContent(
  //   type: contentType,
  //   content: Uint8List(8)..buffer.asByteData().setInt64(0, decoded),
  //   fallback: decoded.toString(),
  // );

  @override
  void initState() {
    super.initState();
    _service = context.read<ChatService>();
    _session = context.read<Session>();
    print(widget.topic);
    print('----------------------');
    print(_service.watchMessages(widget.topic).length);
    Future.delayed(Duration(milliseconds: 10), () {
      if (mounted) {
        // 检查当前State对象是否在树中
        setState(() {
          // 更新文本
          msgList = msgList;
        });
      }
    });
    // setState(() {
    //   msgList = msgList;
    // });
  }

  @override
  void dispose() {
    // if (mounted) {
    //   setState(() {
    //     msgList = [];
    //   });
    // }
    // setState(() {
    //   msgList = [];
    // });
    super.dispose();
  }

  void _back() {}

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Tim Cook"),
          leading: Container(
            width: 70,
            child: GestureDetector(
              onTap: () {
                _back();
              },
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      color: CupertinoColors.activeBlue,
                      size: 26,
                    ),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          trailing: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(255.0), // 设置圆角的大小
              child: Image.asset(
                'assets/images/tim.png',
                fit: BoxFit.cover, // 这将确保图片以合适的方式填充容器
              ),
            ),
          ),
          // title: Text(widget.topic),
        ),
        child: Container(
          // onRefresh: () => _service.refreshMessages(widget.topic),
          child: SafeArea(
            child: Material(
              child: ChatInputWidget(
                onNewMessage: (message) => _service.sendMessage(
                  topic: widget.topic,
                  message: message,
                ),
                child: StreamBuilder(
                  stream: _service.watchMessages(widget.topic),
                  builder: (context, snapshot) {
                    final messages = snapshot.data
                        .ifNull(() => const IListConst<Message>([]));

                    //  Object txt = _decode(messages[0]);
                    //  print(txt);
                    // print(messages.length);
                    // Future<int> decode(xmtp.EncodedContent encoded) async =>
                    //     Uint8List.fromList(context as List<int>)
                    //         .buffer
                    //         .asByteData()
                    //         .getInt64(0);
                    // print(messages);
                    // print('txttxttxttxttxttxttxttxttxttxt');
                    // msgList = [];

                    List<Future> decodeFutures = [];

                    for (var item in messages) {
                      Future<Object> _decode() => item.encoded
                          .let(xmtp.EncodedContent.fromBuffer)
                          .let(codecs.decode)
                          .letAsync((it) => it.content);
                      // 处理每一个item
                      decodeFutures.add(_decode().then((value) {
                        msgList.insert(0, {
                          "id": "USER",
                          "msg": value,
                        });
                      }));
                      // _decode().then((value) {
                      //   msgList.insert(0, {
                      //     "id": "USER",
                      //     "msg": value,
                      //   });

                      // });
                    }

                    List realMsgList = [];
                    realMsgList = msgList.reversed.toList();
                    // setState(() {
                    //   // 更新UI
                    //   realMsgList = realMsgList;
                    // });

                    // 等待所有的Future完成
                    // Future.wait(decodeFutures).then((_) {
                    //   setState(() {
                    //     // 更新UI
                    //     msgList = msgList.reversed.toList();
                    //   });
                    // });

                    // msgList.sort((a, b) => b.compareTo(a));
                    // print(realMsgList[0]);
                    // print(msgList[0]);

                    return ListView.builder(
                      reverse: true,
                      itemCount: realMsgList.length,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (context, index) {
                        final message = realMsgList[index]['msg'];
                        // return Text(_decode(message) as String);
                        // return FutureBuilder(
                        //   future: _decode(),
                        //   builder: (context, snapshot) {
                        //     final content = snapshot.data;
                        //     print(content);
                        //     if (content is String) {
                        //       return Text(content);
                        //     } // TODO(rhbrunetto): add support to other content types
                        //     return const SizedBox.shrink();
                        //   },
                        // );
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // width: MediaQuery.sizeOf(context).width,
                            // margin: ,
                            children: [
                              // Padding(padding: EdgeInsets.fromLTRB(17, 0, 17, 5)),
                              Container(
                                constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.8),
                                margin: EdgeInsets.fromLTRB(15, 14, 17, 5),
                                padding: EdgeInsets.fromLTRB(15, 16, 20, 18),
                                decoration: BoxDecoration(
                                    // color: mainBlue,
                                    color: mainBg,
                                    
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Color.fromARGB(5, 0, 0, 0),
                                    //     offset: Offset(3, 3),
                                    //     blurRadius: 20
                                    //   )
                                    // ],
                                    // border: Border.all(
                                    //   color: borderCopyd,
                                    //   width: 1,
                                    // ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(5), 
                                        topRight: Radius.circular(15))),
                                child: Text(
                                  message, 
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ]);

                        // return Text(message as String);

                        // return MessageWidget(
                        //   message: message,
                        //   isMine: message.sender == _session.address,
                        // );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
}
