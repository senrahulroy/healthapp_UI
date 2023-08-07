import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthlappy_patient/framework/data_provider/global_controller.dart';
import 'package:healthlappy_patient/ui/auth/sign_in_screen.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  ConsumerState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final globalWatch = ref.watch(globalProvider);

    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: EdgeInsets.only(left: 20.h, top: 50.h, bottom: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                try {
                  globalWatch.auth.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignInScreen();
                      },
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  Fluttertoast.showToast(msg: e.message.toString());
                }

                // debugPrint("LoutOutPress");
                Fluttertoast.showToast(msg: "logout successful");
              },
              child: ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: Text(
                  "Logout",
                  style: GoogleFonts.abel(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
