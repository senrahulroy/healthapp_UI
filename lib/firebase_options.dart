// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBMpEsqWwC1IN0Fu3VhUsz-U5W-15ZBJVI',
    appId: '1:801222557943:web:173738cb32712f245a93f2',
    messagingSenderId: '801222557943',
    projectId: 'healthlappy-aab74',
    authDomain: 'healthlappy-aab74.firebaseapp.com',
    storageBucket: 'healthlappy-aab74.appspot.com',
    measurementId: 'G-DRFKTYMZ0F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLzJXTa1pSU8R66ouf0FIYcWqLsQ8St2I',
    appId: '1:801222557943:android:9cc8e256b19444af5a93f2',
    messagingSenderId: '801222557943',
    projectId: 'healthlappy-aab74',
    storageBucket: 'healthlappy-aab74.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfqXjXG75UP5F0lAL7OJEjLpwTN6irhiY',
    appId: '1:801222557943:ios:4b03139cc3f711205a93f2',
    messagingSenderId: '801222557943',
    projectId: 'healthlappy-aab74',
    storageBucket: 'healthlappy-aab74.appspot.com',
    iosClientId: '801222557943-s36md22mmlb8td1nskkut7b4o9fbc1t0.apps.googleusercontent.com',
    iosBundleId: 'app.kt.health.patient.healthlappyPatient',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfqXjXG75UP5F0lAL7OJEjLpwTN6irhiY',
    appId: '1:801222557943:ios:98c770cccb6e05975a93f2',
    messagingSenderId: '801222557943',
    projectId: 'healthlappy-aab74',
    storageBucket: 'healthlappy-aab74.appspot.com',
    iosClientId: '801222557943-b6fr3othn6atuu9r7nissot8mudvmg0k.apps.googleusercontent.com',
    iosBundleId: 'app.kt.health.patient.healthlappyPatient.RunnerTests',
  );
}