import 'package:dfunc/dfunc.dart';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatInputWidget extends StatefulWidget {
  const ChatInputWidget({
    super.key,
    required this.onNewMessage,
    required this.child,
  });

  final ValueSetter<String> onNewMessage;
  final Widget child;

  @override
  State<ChatInputWidget> createState() => _State();
}

class _State extends State<ChatInputWidget> {
  TextEditingController _controller = TextEditingController();
  bool _showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
  }

  void _onSubmit() {
    final text = _controller.text;
    print('发送');
    if (text.isEmpty) return;
    widget.onNewMessage(text);
    print(text);
    _controller.clear();
  }

  void _toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
  }

  void _onEmojiSelected(Emoji emoji) {
    setState(() {
      _controller.text = _controller.text + emoji.emoji;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: widget.child,
            ),
          ),
          Material(
            child: Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    // color: Colors.black,
                    border: Border(
                        top: BorderSide(
                            width: 0.5,
                            color: const Color.fromARGB(255, 200, 200, 200)))),
                // padding:
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    ),
                    Container(
                        height: 60,
                        width: MediaQuery.sizeOf(context).width - 70,
                        child: Align(
                          alignment: Alignment.center,
                          child: CupertinoTextField(
                            controller: _controller,
                            autofocus: false,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 241, 241),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            onSubmitted: (_) => _onSubmit(),
                            onEditingComplete: ignore,
                            textInputAction: TextInputAction.send,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            suffix: Container(
                                // alignment: Alignment.center,
                                height: 45,
                                // padding: EdgeInsets.all(5),
                                child: IconButton(
                                  onPressed: () {
                                    _toggleEmojiPicker();
                                  },
                                  icon: Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    // size: 25,
                                  ),
                                )),
                          ),
                        )),
                    Expanded(
                      child: Offstage(
                        offstage: !_showEmojiPicker,
                        child: EmojiPicker(
                          // onEmojiSelected: (Category category, Emoji emoji) {
                          //   _onEmojiSelected(emoji);
                          // },
                          config: Config(
                            columns: 7,
                            // emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                            verticalSpacing: 0,
                            horizontalSpacing: 0,
                            gridPadding: EdgeInsets.zero,
                            initCategory: Category.RECENT,
                            bgColor: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            indicatorColor: CupertinoColors.activeBlue,
                            iconColor: CupertinoColors.systemGrey,
                            iconColorSelected: CupertinoColors.activeBlue,
                            // progressIndicatorColor: CupertinoColors.systemGrey,
                            backspaceColor: CupertinoColors.systemGrey,
                            // showRecentsTab: true,
                            recentsLimit: 28,
                            // noRecentsText: 'No Recents',
                            // noRecentsStyle: const TextStyle(
                            //   fontSize: 20,
                            //   color: CupertinoColors.systemGrey,
                            // ),
                            tabIndicatorAnimDuration: kTabScrollDuration,
                            categoryIcons: const CategoryIcons(),
                            buttonMode: ButtonMode.MATERIAL,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        // padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        child: Container(
                          width: 70,
                          alignment: Alignment.center,
                          child: CupertinoButton(
                              child: Icon(
                                CupertinoIcons.add_circled,
                                color: Color.fromARGB(255, 176, 176, 176),
                              ),
                              onPressed: () => _onSubmit()),
                        ))
                  ],
                )),
          ),
        ],
      );
}
