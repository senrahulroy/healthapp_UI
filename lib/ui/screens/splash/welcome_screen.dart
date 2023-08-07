import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthlappy_patient/ui/auth/auth_screen.dart';
import 'package:lottie/lottie.dart';
import '../../auth/connectivity/internet_check.dart';
import '../../auth/sign_in_screen.dart';
import '../../utils/app_assets.dart';
import '../../utils/const.dart';


class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {

     late Connectivity  connectivity;


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      ///Navigate to Sign In Screen
      Future.delayed(
        const Duration(seconds: 4),
        () {
          try {

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const InternetCheck(child:  AuthScreen()),
                  //InternetCheck(),
                 ),
                (Route<dynamic> route) => false);

          } catch (e) {
            printData("Splash:$e");
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Lottie.asset(AppAssets.welcome),
            ),
          ),
          // Expanded(
          //     flex: 0,
          //     child: AnimatedTextKit(
          //       animatedTexts: [
          //         ScaleAnimatedText('Think'),
          //         ScaleAnimatedText('Build'),
          //       ],
          //     )),
        ],
      ),
    );
  }
}
