import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_chat/features/wallet_connect/presentation/wallet_connect_screen.dart';


final mainBlue = Color(0xFF5B9DFF),
    majorBlue = Color(0xFF5178E1),
    majorBlue1 = Color.fromARGB(255, 177, 196, 246),
    luckyYellow = Color(0xFFF6CB47),
    backColor1 = Color(0xFFF8F8F8),
    backColor = Color.fromARGB(255, 245, 245, 247),
    tipsColor = Colors.grey,
    tipsColor2 = Color(0xFF9bb674),
    tipsColor3 = Color(0xFFe0e0e0),
    mainBlack = Color.fromARGB(255, 30, 30, 30),
    lightTips = Color(0xFFF2F2F2),
    lightPink = Color.fromARGB(80, 238, 110, 118),
    luckyPink = Color.fromARGB(255, 239, 78, 124);

final defultText =
    TextStyle(fontSize: 18, color: Color.fromARGB(255, 60, 60, 60));

final defultBtnText =
    TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255));

final myWallet = '';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> with WidgetsBindingObserver {
  // late W3MService _w3mService;



  @override
  void initState() {
    super.initState();
    _initializeW3MService();
  }

  void _initializeW3MService() async {
    // Add your own custom chain to chains presets list to show when using W3MNetworkSelectButton
    // See https://docs.walletconnect.com/web3modal/flutter/custom-chains
    // W3MChainPresets.chains.putIfAbsent('<chainID>', () => <Your W3MChainInfo>);

    // _w3mService = W3MService(
    //   projectId: 'd9651bd9051b7fbcdf6c6963c3c5e129',
    //   metadata: const PairingMetadata(
    //     name: 'Connect to wallet',
    //     description: 'Connect to wallet',
    //     url: 'https://www.walletconnect.com/',
    //     icons: ['https://walletconnect.com/walletconnect-logo.png'],
    //     redirect: Redirect(
    //       native: 'flutterdapp://',
    //       universal: 'https://www.walletconnect.com',
    //     ),
    //   ),
    // );

    // await _w3mService.init();
    // print('我的钱包');
    // print(_w3mService.selectedWallet);
    // await getXmtpKeys(getXmtpKeys);
  }

  void submitEmail() {}

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          // isDarkMode: true,
          // child: MaterialApp(
          title: 'Uni Chat',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color.fromARGB(255, 255, 255, 255),
            textTheme: TextTheme(
                // primaryColor: Color.fromARGB(255, 60, 60, 60),
                // fontFamily: 'Ubuntu',

                ),
          ),
          home: Builder(
            builder: (context) {
              return Scaffold(
                // appBar: AppBar(
                //   title: const Text('UniChat'),
                //   backgroundColor: backColor1,
                //   foregroundColor: mainBlue,
                // ),
                backgroundColor: backColor,
                body: Container(
                    constraints: const BoxConstraints.expand(),
                    // padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 80.sp,
                          child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                child: Image.asset(
                                  'assets/images/uni_logo.png',
                                  width: 100,
                                  height: 45,
                                ),
                              )),
                        ),
                        Positioned(
                            top: 200.sp,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              alignment: Alignment.center,
                              child: Text('Sign in with Wallet',
                                  style: defultText),
                            )),
                        Positioned(
                            top: 240.sp,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              // child: WalletConnectScreen(),
                              // child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: !_w3mService.isConnected
                              //       ? [
                              //           // W3MNetworkSelectButton(
                              //           //     service: _w3mService),
                              //           W3MConnectWalletButton(
                              //               service: _w3mService),
                              //         ]
                              //       : [
                              //           W3MAccountButton(
                              //               service: _w3mService),
                              //         ],
                              // ),
                            )),
                        Positioned(
                            left: 0,
                            top: 260.sp,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 100,
                              padding: EdgeInsets.all(30),
                              alignment: Alignment.center,
                              child: Stack(children: [
                                Positioned(
                                    child: Align(
                                  alignment: Alignment.center,
                                  child: Divider(
                                    height: 1.0,
                                    color: tipsColor3,
                                  ),
                                )),
                                Positioned(
                                    child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: Container(
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: backColor),
                                    child: Text(
                                      'Or',
                                      style: TextStyle(
                                        color: tipsColor3,
                                      ),
                                    ),
                                  ),
                                )),
                              ]),
                            )),
                        Positioned(
                            top: 340.sp,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              alignment: Alignment.center,
                              child: Text(
                                'Sign in with Social',
                                style: defultText,
                              ),
                            )),
                        Positioned(
                            top: 380.sp,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                              width: MediaQuery.sizeOf(context).width,
                              alignment: Alignment.center,
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: TextField(
                                  cursorColor: Colors.amber,
                                  // obscureText: true,
                                  decoration: InputDecoration(
                                      focusColor: Colors.amberAccent,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(17)),
                                        borderSide: BorderSide(
                                            color: mainBlue, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(17)),
                                        borderSide: BorderSide(
                                            color: tipsColor3, width: 1.0),
                                      ),
                                      label: Container(
                                        width: 190.sp,
                                        child: Row(
                                          children: [
                                            Padding(padding: EdgeInsets.all(5)),
                                            Icon(
                                              CupertinoIcons.mail,
                                              color: tipsColor,
                                            ),
                                            Padding(padding: EdgeInsets.all(5)),
                                            Text(
                                              'Continue with Email',
                                              style: TextStyle(
                                                color: tipsColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                      // labelText: ,
                                      ),
                                ),
                              ),
                            )),
                        Positioned(
                            top: 440.sp,
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 130,
                              padding: EdgeInsets.all(30),
                              alignment: Alignment.center,
                              child: FilledButton(
                                  onPressed: submitEmail,
                                  style: ElevatedButton.styleFrom(
                                    primary: mainBlue, // 设置背景颜色
                                    // 可以根据需要自定义其他按钮样式属性，如边框、阴影等
                                  ),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    alignment: Alignment.center,
                                    height: 55,
                                    child: Text(
                                      'Submit',
                                      style: defultBtnText,
                                    ),
                                  )),
                            )),
                      ],
                    )),
              );
            },
          ),
          // ),
        );
      },
    );
}
