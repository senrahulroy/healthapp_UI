import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ui/screens/splash/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  //firebase initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Health Lappy',
            // darkTheme: ThemeData.dark(useMaterial3: true),
            theme: ThemeData.light(useMaterial3: true),
            // themeMode: ThemeMode.system,
            home: const WelcomeScreen());
      },
    );
  }
}
