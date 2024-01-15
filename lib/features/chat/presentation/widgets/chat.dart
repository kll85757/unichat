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

TextStyle defultText = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 42, 42, 42),
    fontWeight: FontWeight.bold);
TextStyle defultTextOther = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 121, 121, 121),
    fontWeight: FontWeight.bold);
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

  @override
  void initState() {
    super.initState();

    
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _focusNode = FocusNode();

  void _toSubPlan() {
    // Application.routes
    //     .navigateTo(context, 'subPlan', transition: TransitionType.fadeIn);
  }

  void _toTalk() {
    // Application.routes
    //     .navigateTo(context, 'talkToGpt', transition: TransitionType.fadeIn);
  }

  Widget build(BuildContext context) => CupertinoPageScaffold(
        // resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
            middle: Container(
              // padding: EdgeInsets.all(5),
              child: Text('Chat'),
            ),
            backgroundColor: Colors.white,
            // padding: EdgeInsetsDirectional.fromSTEB(5, 10, 15, 8),
            trailing: Container(
              // padding: EdgeInsets.all(5),
              // margin: EdgeInsets.all(2),
              child: Icon(Icons.group_rounded,size: 24,color: mainBlue,),
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
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Stack(
                  children: [
                    Positioned(
                        child: Column(
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: const BoxDecoration(
                            color: EthColors.bgColor,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/myBg.png'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: ListView(
                            // padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [],
                                  ),
                                  Container(
                                    height: 100,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: EdgeInsets.all(17),
                                    decoration: BoxDecoration(
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.systemBackground,
                                          context),
                                      // borderRadius: const BorderRadius.all(
                                      //   Radius.circular(25),
                                      // ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          // height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              const Radius.circular(25.0),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                50.0), // 设置圆角的大小
                                            child: Image.asset(
                                              'assets/images/avt.png',
                                              fit: BoxFit
                                                  .cover, // 这将确保图片以合适的方式填充容器
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(10)),
                                        Container(
                                          width: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tim Cook',
                                                style: titleText,
                                              ),
                                              Text(
                                                  '0x8b76000000000000000002434',
                                                  style: tipsText,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                        )
                                        // Offstage(
                                        //   offstage: !showPayWaitting,
                                        //   child: Container(
                                        //     child: Lottie.asset(
                                        //         'assets/status/glass.json',
                                        //         alignment: Alignment(10, 0),
                                        //         fit: BoxFit.cover,
                                        //         repeat: true),
                                        //   ),
                                        // ),
                                        // Offstage(
                                        //   offstage: showPayWaitting,
                                        //   child: Container(
                                        //     width: 400,
                                        //     child: Lottie.asset(
                                        //         'assets/status/okMark.json',
                                        //         alignment: Alignment(10, 0),
                                        //         fit: BoxFit.cover,
                                        //         repeat: true),
                                        //   ),
                                        // ),
                                        // Offstage(
                                        //   offstage: !showPayWaitting,
                                        //   child: Container(
                                        //     child: Container(
                                        //       margin: EdgeInsets.fromLTRB(
                                        //           0, 25, 0, 0),
                                        //       child: Text(
                                        //         '支付中 · · ·',
                                        //         style: TextStyle(
                                        //             color: Color.fromARGB(
                                        //                 255, 53, 53, 53),
                                        //             fontSize: 25 ,
                                        //             fontWeight:
                                        //                 FontWeight.bold),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // Offstage(
                                        //   offstage: showPayWaitting,
                                        //   child: Container(
                                        //     child: Container(
                                        //       margin: EdgeInsets.fromLTRB(
                                        //           0, 25, 0, 0),
                                        //       child: Text(
                                        //         '感谢购买',
                                        //         style: TextStyle(
                                        //             color: Color.fromARGB(
                                        //                 255, 53, 53, 53),
                                        //             fontSize: 25 ,
                                        //             fontWeight:
                                        //                 FontWeight.bold),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
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
