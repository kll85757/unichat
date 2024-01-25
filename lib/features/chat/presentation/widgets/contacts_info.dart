import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';
import '../../../../ui/colors.dart';
import '../../../wallet_connect/presentation/wallet_connect_screen.dart';
import '../../data/models/convo.dart';
import '../../services/chat_service.dart';

import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/refreshable_widget.dart';
import '../../../../core/widgets/retry_widget.dart';
import '../../../../l10n/l10n.dart';
import '../../../../routes.gr.dart';
import '../../../../ui/colors.dart';
import '../../../../utils/extensions.dart';
import '../../../session/services/session_cubit.dart';
import '../../data/models/convo.dart';
import '../../services/chat_service.dart';
import '../widgets/new_chat_dialog.dart';

// import '../widgets/ContactInfo.dart';
import '../../services/xmtp/xmtp_repository.dart';
import 'package:xmtp/xmtp.dart' as xmtp;

TextStyle defultText = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 42, 42, 42),
    fontWeight: FontWeight.normal);
TextStyle defultTextOther = TextStyle(
    fontSize: 20,
    color: Color.fromARGB(255, 145, 145, 145),
    fontWeight: FontWeight.normal);
TextStyle tipsText = TextStyle(
    fontSize: 23,
    color: Color.fromARGB(255, 63, 126, 249),
    fontWeight: FontWeight.normal);
TextStyle titleText = TextStyle(
    fontSize: 23,
    color: Color.fromARGB(255, 42, 42, 42),
    fontWeight: FontWeight.bold);
TextStyle titleTextLg = TextStyle(
    fontSize: 40,
    color: Color.fromARGB(255, 42, 42, 42),
    fontWeight: FontWeight.bold);

class ContactInfo extends StatefulWidget {
  ContactInfo();

  @override
  State<StatefulWidget> createState() => ContactInfoState();
}

bool dialogVisable = false;

class ContactInfoState extends State<ContactInfo> {
  ContactInfoState();
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

  void _toTalk() {
    // Application.routes
    //     .navigateTo(context, 'talkToGpt', transition: TransitionType.fadeIn);
  }

  // void _openChat(String topic) =>
  //     context.router.push(MessageRoute(topic: topic));

  Widget build(BuildContext context) => CupertinoPageScaffold(
        // resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          border: null,
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 15, 8),
          // middle: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text('ContactInfo', style: defultText),
          //     ]),
          leading: GestureDetector(
            onTap: _toTalk,
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
          backgroundColor: infoBg,
          trailing: GestureDetector(
            onTap: _toTalk,
            child: Container(
              child: Text(
                'Edit',
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                ),
              ),
            ),
          ),
        ),
        child: Material(
          color: Colors.transparent,
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
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: const BoxDecoration(
                              color: EthColors.bgColor,
                              // image: DecorationImage(
                              //   image: AssetImage('assets/images/myBg.png'),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            child: Container(
                                // height: MediaQuery.sizeOf(context).height,
                                // padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
                                child: Column(
                              children: [
                                Container(
                                  height: MediaQuery.sizeOf(context).height,
                                  width: MediaQuery.sizeOf(context).width,
                                  // padding: EdgeInsets.all(17),
                                  decoration: BoxDecoration(
                                    color: CupertinoDynamicColor.resolve(
                                        infoBg, context),
                                    // borderRadius: const BorderRadius.all(
                                    //   Radius.circular(25),
                                    // ),
                                  ),
                                  child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: MediaQuery.sizeOf(context).height,
                                      child: ListView(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  // height: 10,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        CupertinoColors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      const Radius.circular(
                                                          255.0),
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            255.0), // 设置圆角的大小
                                                    child: Image.asset(
                                                      'assets/images/tim.png',
                                                      fit: BoxFit
                                                          .cover, // 这将确保图片以合适的方式填充容器
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.all(10)),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.8,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Fuck Tim Cook',
                                                        style: titleTextLg,
                                                      ),
                                                      Text(
                                                          '0x8bcF8AFF8Cb99335CD9f4d9866a40e05E23373ff',
                                                          style:
                                                              defultTextOther,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.all(12)),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            // backgroundColor:
                                            //     const Color.fromARGB(
                                            //         0, 0, 0, 0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20),
                                                  width: (MediaQuery.sizeOf(
                                                                  context)
                                                              .width -
                                                          80) /
                                                      3,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        CupertinoColors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons
                                                            .chat_bubble_fill,
                                                        color: CupertinoColors
                                                            .activeBlue,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 3)),
                                                      Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                          color: CupertinoColors
                                                              .activeBlue,
                                                              fontSize: 16
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20),
                                                  width: (MediaQuery.sizeOf(
                                                                  context)
                                                              .width -
                                                          80) /
                                                      3,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        CupertinoColors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons
                                                            .videocam_fill,
                                                        color: CupertinoColors
                                                            .activeBlue,
                                                        size: 30,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2)),
                                                      Text(
                                                        'Video',
                                                        style: TextStyle(
                                                          color: CupertinoColors
                                                              .activeBlue,
                                                              fontSize: 16
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // margin: EdgeInsets.only(right: 20),
                                                  width: (MediaQuery.sizeOf(
                                                                  context)
                                                              .width -
                                                          80) /
                                                      3,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        CupertinoColors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons
                                                            .money_dollar_circle,
                                                        color: CupertinoColors
                                                            .activeBlue,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 3)),
                                                      Text(
                                                        'Tips',
                                                        style: TextStyle(
                                                          color: CupertinoColors
                                                              .activeBlue,
                                                              fontSize: 16
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          CupertinoListSection.insetGrouped(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      0, 0, 0, 0),
                                              children: [
                                                Container(
                                                  // height: 100,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  padding: EdgeInsets.all(17),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 0.5,
                                                            color: CupertinoColors
                                                                .systemGrey5)),
                                                    color: CupertinoDynamicColor
                                                        .resolve(
                                                            CupertinoColors
                                                                .systemBackground,
                                                            context),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      // Padding(
                                                      //     padding:
                                                      //         EdgeInsets.all(
                                                      //             2)),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.79,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Twitter Handle',
                                                              style: defultText,
                                                            ),
                                                            Text(
                                                              '@TimCook',
                                                              style: tipsText,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                          CupertinoListSection.insetGrouped(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 10, 20, 0),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      0, 0, 0, 0),
                                              children: [
                                                Container(
                                                  // height: 100,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  padding: EdgeInsets.all(17),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 0.5,
                                                            color: CupertinoColors
                                                                .systemGrey5)),
                                                    color: CupertinoDynamicColor
                                                        .resolve(
                                                            CupertinoColors
                                                                .systemBackground,
                                                            context),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      // Padding(
                                                      //     padding:
                                                      //         EdgeInsets.all(
                                                      //             5)),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.79,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Description',
                                                              style: defultText,
                                                            ),
                                                            Text(
                                                              'Tim Cook,the CEO of Apple Inc.',
                                                              style: tipsText,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                          CupertinoButton(
                                              child: Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: CupertinoColors
                                                        .systemRed,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.all(5),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  // width: double.in,

                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 22),
                                                  )),
                                              onPressed: () => {})
                                        ],
                                      )),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
          ),
        ),
      );
}

// class ContactCard extends StatelessWidget {
//   const ContactCard({super.key});

//   @override
//   Widget build(BuildContext context) => 
// }
