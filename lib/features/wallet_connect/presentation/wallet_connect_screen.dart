import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';
import 'package:walletconnect_modal_flutter/walletconnect_modal_flutter.dart';

import '../../../core/widgets/loading_widget.dart';
import '../../../l10n/l10n.dart';
import '../../session/services/session_cubit.dart';
import '../services/wallet_bloc.dart';
import 'widgets/footer_widget.dart';
import 'widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';

final mainBlue = Color(0xFF5B9DFF),
    majorBlue = Color(0xFF5178E1),
    mainBg = Color.fromARGB(255, 241, 241, 244),
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

@RoutePage()
class WalletConnectScreen extends StatefulWidget {
  const WalletConnectScreen({super.key});

  @override
  State<WalletConnectScreen> createState() => _State();
}

class _State extends State<WalletConnectScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(const WalletEvent.initialize());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: BlocBuilder<WalletBloc, WalletState>(
            builder: (context, state) => state.map(
              (wallet) => _WalletConnectScreen(
                service: wallet.modalService,
                client: wallet.app,
              ),
              none: (_) => const LoadingWidget(),
            ),
          ),
        ),
      );
}

class _WalletConnectScreen extends StatefulWidget {
  const _WalletConnectScreen({
    required this.service,
    required this.client,
  });

  final WalletConnectModalService service;
  final Web3App client;

  @override
  State<_WalletConnectScreen> createState() => _WalletConnectScreenState();
}

class _WalletConnectScreenState extends State<_WalletConnectScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.service.isConnected) {
      _onConnect(widget.service.session);
    }
    widget.client.onSessionConnect.subscribe((it) => _onConnect(it?.session));
  }

  void _onConnect(SessionData? session) {
    if (session == null) return;
    context
        .read<SessionCubit>()
        .startSession(widget.client, session, widget.service);
  }

  void submitEmail() {}

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all( 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 500,
              height: 700,
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
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
                      top: 200,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        alignment: Alignment.center,
                        child: Text('Sign in with Wallet', style: defultText),
                      )),
                  Positioned(
                      top: 240,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: WalletConnectModalConnect(
                              service: widget.service),
                        ),
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
                      top: 260,
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
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: Colors.white),
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
                      top: 340,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        alignment: Alignment.center,
                        child: Text(
                          'Sign in with Social',
                          style: defultText,
                        ),
                      )),
                  Positioned(
                      top: 380,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderSide:
                                      BorderSide(color: mainBlue, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)),
                                  borderSide:
                                      BorderSide(color: tipsColor3, width: 1.0),
                                ),
                                label: Container(
                                  width: 190,
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
                      top: 440,
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
              ),
            ),

            Text.rich(
              TextSpan(
                // text: context.l10n.connectCTA1,
                children: [
                  TextSpan(
                    text: '©2022 Capcom Co.,Ltd. All rights reserved.',
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 16),
            //   child: WalletConnectModalConnect(service: widget.service),
            // ),
            // const Spacer(),
            // const FooterWidget(),
          ],
        ),
      );
}
