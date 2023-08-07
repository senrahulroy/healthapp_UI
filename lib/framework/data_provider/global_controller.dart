
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_sign_in/google_sign_in.dart';
//
///Global Provider
final globalProvider = ChangeNotifierProvider(
      (ref) => GlobalController(),
);

class GlobalController extends ChangeNotifier {

  /// Firebase instance
  FirebaseAuth auth = FirebaseAuth.instance;

  ///firebase_authState instant
  final authState = FirebaseAuth.instance.authStateChanges();

  /// formGlobal key
   final   GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// ZoomDrawerController Global
   final ZoomDrawerController z = ZoomDrawerController();

  // final GoogleSignIn googleSignIn = GoogleSignIn(
  //     clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);
  GoogleSignInAccount? googleSignInUser;
  OAuthCredential? credentials;


  clearCredentials() {
    credentials = null;
  }
  //
  // Future googleLogin() async {
  //   try {
  //     clearCredentials();
  //     final googleUser = googleSignIn.signIn();
  //     googleSignInUser = await googleUser;
  //     printData("Got User$googleSignInUser");
  //     final googleAuth = await googleSignInUser!.authentication;
  //     printData("Got Auth");
  //     credentials = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //   } catch (e) {
  //     printData(e);
  //   }
  //   notifyListeners();
  // }
}
