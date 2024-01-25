import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:lottie/lottie.dart';
import '../../../../ui/colors.dart';
import '../../../wallet_connect/presentation/wallet_connect_screen.dart';
import '../../data/models/convo.dart';
import '../../services/chat_service.dart';

import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/retry_widget.dart';
import '../../../../l10n/l10n.dart';
import '../../../../routes.gr.dart';
import '../../../../ui/colors.dart';
import '../../../../utils/extensions.dart';
import '../../../session/services/session_cubit.dart';
import '../../data/models/convo.dart';
import '../../services/chat_service.dart';
import '../message_screen.dart';
import '../widgets/new_chat_dialog.dart';
import '../widgets/setting.dart';
import '../widgets/chat.dart';
import '../../services/xmtp/xmtp_repository.dart';
import 'package:xmtp/xmtp.dart' as xmtp;
import 'package:uni_chat/route/application.dart';

TextStyle defultText = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 42, 42, 42),
    fontWeight: FontWeight.bold);
TextStyle defultTextOther = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 121, 121, 121),
    fontWeight: FontWeight.w500);
TextStyle tipsText = TextStyle(
  fontSize: 18,
  color: Color.fromARGB(255, 155, 155, 155),
);
TextStyle titleText = TextStyle(
    fontSize: 23,
    color: Color.fromARGB(255, 42, 42, 42),
    fontWeight: FontWeight.bold);

class Chat extends StatefulWidget {
  Chat();

  @override
  State<StatefulWidget> createState() => ChatState();
}

bool dialogVisable = false;

class ChatState extends State<Chat> {
  ChatState();
  late ChatService _service;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    _service = context.read<ChatService>();
    textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  final _focusNode = FocusNode();

  void _toSubPlan() {
    // Application.routes
    //     .navigateTo(context, 'subPlan', transition: TransitionType.fadeIn);
  }

  void _openChatNew(String topic,String title) {
    print(topic + title);
    // Application.routes
    //     .navigateTo(context, 'ChatNew', transition: TransitionType.cupertino);
    Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => MessageScreen(topic: topic),
            ));
    // context.router.push(MessageRoute(topic: topic));
    // Application.routes
    //     .navigateTo(context, 'ChatNew', transition: TransitionType.cupertino);
  }

  void _openChat(String topic) =>
      context.router.push(MessageRoute(topic: topic));

  Widget build(BuildContext context) => CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
            border: null,
            middle: Container(
              // padding: EdgeInsets.all(5),
              child: Text(
                'Chat',
                style: defultText,
              ),
            ),
            backgroundColor: Colors.white,
            // padding: EdgeInsetsDirectional.fromSTEB(5, 10, 15, 8),
            trailing: Container(
              // padding: EdgeInsets.all(5),
              // margin: EdgeInsets.all(2),
              child: Icon(
                Icons.group_rounded,
                size: 24,
                color: mainBlue,
              ),
              // child: CupertinoButton(
              //     onPressed: () {},
              //     child: Icon(CupertinoIcons.plus_app)
              //     ),
            )
            // leading: Row(
            //   children: [
            //     // CupertinoButton(
            //     //   padding: EdgeInsets.zero,
            //     //   onPressed: _toTalk,
            //     //   child: Container(
            //     //     height: 50,
            //     //     width: 30,
            //     //     child: Icon(
            //     //       CupertinoIcons.chevron_left,
            //     //       color: EthColors.bgColor,
            //     //       size: 18,
            //     //     ),
            //     //   ),
            //     // ),
            //     // CupertinoButton(
            //     //   padding: EdgeInsets.zero,
            //     //   onPressed: _toTalk,
            //     //   child: Container(
            //     //       width: 50,
            //     //       child: Text(
            //     //         '返回',
            //     //         style: TextStyle(
            //     //             fontWeight: FontWeight.bold,
            //     //             color: Colors.black,
            //     //             fontSize: 15),
            //     //       )),
            //     // ),
            //   ],
            // ),
            ),
        child: LayoutBuilder(
          builder: (context, constraint) => SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5,
                                    color: CupertinoColors.systemGrey5)),
                          ),
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 14),
                          width: MediaQuery.sizeOf(context).width,
                          height: 50,
                          child: Container(
                            child: CupertinoSearchTextField(
                              controller: textController,
                              placeholder: 'Search',
                            ),
                          ),
                        )),
                    Positioned(
                        child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: const BoxDecoration(
                            color: EthColors.bgColor,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/myBg.png'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          // height: MediaQuery.sizeOf(context).height,
                          // padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
                          child: Container(
                            // height: 900,
                            width: MediaQuery.sizeOf(context).width,
                            // padding: EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              color: CupertinoDynamicColor.resolve(
                                  CupertinoColors.systemBackground, context),
                              // borderRadius: const BorderRadius.all(
                              //   Radius.circular(25),
                              // ),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height,
                              child: StreamBuilder(
                                stream: _service.watchConversations(),
                                builder: (context, snapshot) {
                                  final conversations = snapshot.data.ifNull(
                                      () => const IListConst<Convo>([]));
                                  if (snapshot.hasError) {
                                    return RetryWidget(
                                      message: context.l10n.chatFailedToLoad,
                                      onRetry: _service.refreshConversations,
                                    );
                                  }
                                  return ListView.separated(
                                    // shrinkWrap: true,
                                    itemCount: conversations.length,
                                    separatorBuilder: (context, _) =>
                                        Container(),
                                    itemBuilder: (context, index) {
                                      final conversation =
                                          conversations.elementAt(index);
                                      return Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 0.5,
                                                  color: CupertinoColors
                                                      .systemGrey5)),
                                        ),
                                        child: ListTile(
                                          leading: Container(
                                            // height: 10,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                const Radius.circular(25.0),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50.0), // 设置圆角的大小
                                              child: Image.asset(
                                                'assets/images/tim.png',
                                                fit: BoxFit
                                                    .cover, // 这将确保图片以合适的方式填充容器
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            conversation.peer,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          subtitle: Text(
                                            context.elapsedTimeFormatted(
                                                conversation.lastOpenedAt),
                                            style: defultTextOther,
                                          ),
                                          onTap: () =>
                                              _openChatNew(conversation.topic,conversation.peer),
                                          // trailing:
                                          //     const Icon(Icons.chevron_right),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              )),
        ),
      );
}
