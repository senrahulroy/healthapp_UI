import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthlappy_patient/framework/data_provider/global_controller.dart';
import 'package:healthlappy_patient/ui/auth/connectivity/internet_check.dart';
import 'package:healthlappy_patient/ui/auth/sign_in_screen.dart';


import '../screens/drawer/drawer_configure.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authWatch = ref.watch(globalProvider);
    // final aut`hState = FirebaseAuth.instance.authStateChanges();
    return InternetCheck(
        child: Scaffold(
      body: StreamBuilder<User?>(
        stream:  authWatch.authState,
        builder: (context, snapshot) => snapshot.hasData ? const DrawerSetup() : const SignInScreen()
      ),
    ));
  }
}
