import 'package:dfunc/dfunc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../ui/colors.dart';

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
  final _controller = TextEditingController();

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
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width - 100,
                      child: CupertinoTextField(
                        controller: _controller,
                        autofocus: true,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        onSubmitted: (_) => _onSubmit(),
                        onEditingComplete: ignore,
                        textInputAction: TextInputAction.send,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.all(8),
                      alignment: Alignment.topCenter,
                      height: 60,
                      width: 80,
                      child: CupertinoButton(
                          child: Icon(CupertinoIcons.add_circled),
                          onPressed: () => _onSubmit()),
                    )
                  ],
                )),
          ),
        ],
      );
}
