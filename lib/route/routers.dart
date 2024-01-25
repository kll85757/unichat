import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'handler.dart';


class Routes {
  static String root = "/";
  static String ContactInfo = '/ContactInfo';
  static String ChatNew = "/ChatNew";
  static String EditProfile = "/EditProfile";
  // static String toSub = "/subPlan";
  // static String home = "/home";
  // static String signIn = "/signIn";
  // static String pay = "/pay";
  // static String ver = "/ver";
  // static String main = "/main";


  static void configureRoutes(FluroRouter router) {
    // router.notFoundHandler = Handler(
    //     handlerFunc:
    //         (BuildContext context, Map<String, List<String>> params) {});
    router.define(ContactInfo, handler: ContactInfoHander);
    router.define(EditProfile, handler: EditProHander);
    router.define(ChatNew, handler: ChatNewHander);
    // router.define(talkToGpt, handler: talkToGptHandler);
    // router.define(toSub, handler: subPlanHandler);
    // router.define(home, handler: homeHandler);
    // router.define(signIn, handler: signInHandler);
    // router.define(pay, handler: payHandler);
    // router.define(ver, handler: verHandler);
    // router.define(main, handler: mainHandler);
    // router.define(deviceList, handler: listHandler);

  }
}
