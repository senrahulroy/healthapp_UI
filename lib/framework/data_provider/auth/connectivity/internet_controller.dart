import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final internetCheckProvider =
    ChangeNotifierProvider((ref) => InternetCheckController());

class InternetCheckController extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  late bool isConnected;

  Future<void> checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    isConnected = result != ConnectivityResult.none;
  }

  Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged;
}
