import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmtp/xmtp.dart' as xmtp;

import '../../../../utils/namespace.dart';
import '../../../wallet_connect/presentation/wallet_connect_screen.dart';
import '../../data/models/message.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.message,
    required this.isMine,
  });

  final Message message;
  final bool isMine;

  Future<Object> _decode() => message.encoded
      .let(xmtp.EncodedContent.fromBuffer)
      .let(codecs.decode)
      .letAsync((it) => it.content);

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _decode(),
        builder: (context, snapshot) {
          final content = snapshot.data;

          if (content is String) {
            return _TextMessageWidget(
              text: content,
              sentAt: message.sentAt,
              isMine: isMine,
            );
          } // TODO(rhbrunetto): add support to other content types
          return const SizedBox.shrink();
        },
      );
}

class _TextMessageWidget extends StatelessWidget {
  const _TextMessageWidget({
    required this.text,
    required this.sentAt,
    required this.isMine,
  });

  final String text;
  final DateTime sentAt;
  final bool isMine;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BubbleSpecialOne(
          //   text: text,
          //   isSender: isMine,
          //   textStyle: const TextStyle(fontSize: 16,color: Colors.white),
          //   color: Colors.blue,
          // ),
          // Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 10)),
          Container(
            // width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.fromLTRB(17, 0, 17, 5),
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 16, 14, 18),
              decoration: BoxDecoration(
                  color: mainBlue,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(5, 0, 0, 0),
                      offset: Offset(3, 3),
                      blurRadius: 20,
                    )
                  ],
                  // border: Border.all(
                  //   color: borderCopyd,
                  //   width: 1,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(17))),
              child: Text(
                text,
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 18),
          //   child: Align(
          //     alignment: isMine ? Alignment.topRight : Alignment.topLeft,
          //     child: Text(
          //       _formatter.format(sentAt),
          //       style: const TextStyle(fontSize: 8),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 8),
        ],
      );
}

final _formatter = DateFormat.yMd().add_jm();
