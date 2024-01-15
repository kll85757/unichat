import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../../ui/fade_in_widget.dart';
import '../../../session/data/session.dart';
import 'package:lottie/lottie.dart';

final tinyFont = const TextStyle(
    fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal);

// TODO(rhbrunetto): For some reason, wallet app might not be launched, so this screen is needed
class XmtpLoadingWidget extends StatelessWidget {
  const XmtpLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 900,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(height: 100),
                Lottie.asset('assets/status/glass.json',
                    // alignment: Alignment(10,0),
                    width: 200,
                    height: 400,
                    repeat: true),
                FadeInWidget(
                  delay: _delay,
                  child: Text(
                    'Connecting to',
                    style: const TextStyle(
                        fontSize: 37,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // const SizedBox(height: 24),
                FadeInWidget(
                  index: 1,
                  delay: _delay,
                  child: Text(
                    'your wallet...',
                    style: const TextStyle(
                        fontSize: 37,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
                FadeInWidget(
                  index: 2,
                  delay: _delay,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   'Enable your Unichat identity',
                      //   style: const TextStyle(
                      //       fontSize: 36), // textAlign: TextAlign.center,
                      // ),
                      const SizedBox(height: 12),
                      Text(
                        'Select a wallet account to use to create',
                        style: tinyFont,
                        // textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'your UniChat Identity. Thenallow this app',
                        style: tinyFont,
                        // textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        ' to connect to the account.',
                        style: tinyFont,
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                      ),
                    ),
                  ),
                  onPressed: () => context.read<Session>().openWallet(),
                  label: Text('Enabling your identity'),
                  icon: const Icon(Icons.open_in_new),
                ),
              ],
            ),
          ),
        ),
      );
}

const _delay = Duration(milliseconds: 600);
