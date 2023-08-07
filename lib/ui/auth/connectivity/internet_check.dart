import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../framework/data_provider/auth/connectivity/internet_controller.dart';
import '../../utils/app_assets.dart';

class InternetCheck extends ConsumerStatefulWidget {
  final Widget child;
  const InternetCheck({Key? key, required this.child}) : super(key: key);
  @override
  ConsumerState createState() => _InternetCheckState();
}

class _InternetCheckState extends ConsumerState<InternetCheck> {
  late InternetCheckController _internetCheckController;
  late Stream<ConnectivityResult> _connectivityStream;
  late bool _isConnected;
  late bool _isChecking;

  void initState() {
    super.initState();
    _internetCheckController = ref.read(internetCheckProvider);
    _connectivityStream = _internetCheckController.connectivityStream;
    _isConnected = true;
    _isChecking = true;

    checkInternetConnection();

    _internetCheckController.checkConnectivity();

    _connectivityStream.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          _isConnected = false;
        });
      } else {
        setState(() {
          _isConnected = true;
        });
      }
    });
  }

  Future<void> checkInternetConnection() async {
    await _internetCheckController.checkConnectivity();

    setState(() {
      _isConnected = _internetCheckController.isConnected;
      _isChecking = false;
    });

    _connectivityStream.listen((ConnectivityResult result) {
      setState(() {
        _isConnected = result != ConnectivityResult.none;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

     return _isConnected ? widget.child : const InterChecker();


        // _isChecking ? const Scaffold(
        //   body: Center(child: Expanded(child: Icon(Icons.network_check)),),
        // )  : _isConnected ? widget.child : const InterChecker();
  }
}

class InterChecker extends ConsumerStatefulWidget {
  const InterChecker({super.key});

  @override
  ConsumerState createState() => _InterCheckerState();
}

class _InterCheckerState extends ConsumerState<InterChecker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.h,
              width:  200.h,
              child: Lottie.asset(AppAssets.lossInternet),),
            Gap(10.h,color: Colors.red,),
            const Text(
              'No internet connection',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
