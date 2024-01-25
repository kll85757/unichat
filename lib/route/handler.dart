import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// import 'package:MovoLink/views/StockManager.dart';
// import 'package:letsgpt/views/contactInfo.dart';
import '../features/chat/presentation/widgets/contacts_info.dart';
import '../features/chat/presentation/widgets/edit_profile.dart';
import '../features/chat/presentation/widgets/chatViewNew.dart';
import '../features/chat/presentation/widgets/chatViewNew.dart';
// import 'package:uni_chat/features/chat/presentation/widgets/contacts.dart';
// import 'package:letsgpt/views/talkToGpt.dart';
// import 'package:letsgpt/views/subPlan.dart';
// import 'package:letsgpt/views/home.dart';
// import 'package:letsgpt/views/signIn.dart';
// import 'package:letsgpt/views/payMentStatus.dart';
// import 'package:letsgpt/views/ver.dart';
// import 'package:letsgpt/views/mainPage.dart';
// import 'package:MovoLink/views/deviceList.dart';
// import 'package:MovoLink/views/deviceSearch.dart';

var ContactInfoHander = Handler(
  // ignore: non_constant_identifier_names
  handlerFunc: (BuildContext, Map<String, List<String>> params) {
    return ContactInfo();
  },
);
var EditProHander = Handler(
  // ignore: non_constant_identifier_names
  handlerFunc: (BuildContext, Map<String, List<String>> params) {
    return EditProfile();
  },
);
var ChatNewHander = Handler(
  // ignore: non_constant_identifier_names
  handlerFunc: (BuildContext, Map<String, List<String>> params) {
    return ChatNew();
  },
);

// GPT对话页
// var talkToGptHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     return messageWindow();
//   },
// );

// //sqflite数据库
// var subPlanHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     //return SqflitePage();
//     return subPlanWindow();
//   },
// );

// // home
// var homeHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     return homePage();
//   },
// );

// // 用户注册
// var signInHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     return userSignInWindow();
//   },
// );

// // 支付状态
// var payHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     String orderNo =  params['orderNo'] as String;
//     print(orderNo);
//     return payMent(orderNo);
//   },
// );

// // 查看版本
// var verHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     return version();
//   },
// );

// // 主画面
// var mainHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     return mainPage();
//   },
// );

// // 设备详情
// var infoHandler = Handler(
//   handlerFunc: (BuildContext, Map<String, List<String>> params) {
//     //return FileZipDemo();
//     // return DeviceInfo();
//   },
// );
