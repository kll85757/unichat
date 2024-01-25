import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import 'package:lottie/lottie.dart';
import '../../../../ui/colors.dart';

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

class ChatNew extends StatefulWidget {
  ChatNew();

  @override
  State<StatefulWidget> createState() => ChatNewState();
}

bool dialogVisable = false;

class ChatNewState extends State<ChatNew> {
  ChatNewState();

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
        resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          
          middle: Text('ChatNew'),
          backgroundColor: Colors.white,
          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 15, 8),
          
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
                            padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [],
                                  ),
                                  Container(
                                    height: 120,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: EdgeInsets.all(17),
                                    decoration: BoxDecoration(
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.systemBackground,
                                          context),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          // height: 10,
                                          decoration: BoxDecoration(
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
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tim Cook',
                                                style: titleText,
                                              ),
                                              Text(
                                                'tim.cook#8541224',
                                                style: tipsText,
                                              ),
                                              Text(
                                                '0x8b76000000000000000002434',
                                                style: tipsText,
                                                overflow:TextOverflow.ellipsis
                                              ),
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
                                  Container(
                                    height: 60,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    decoration: BoxDecoration(
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.systemBackground,
                                          context),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text('Wallet', style: defultTextOther)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    decoration: BoxDecoration(
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.systemBackground,
                                          context),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text('Domain', style: defultTextOther)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    decoration: BoxDecoration(
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.systemBackground,
                                          context),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text('App', style: defultTextOther)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    decoration: BoxDecoration(
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.systemBackground,
                                          context),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text('Logout', style: defultTextOther)
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
