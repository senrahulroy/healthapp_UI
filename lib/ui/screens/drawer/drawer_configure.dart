import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:healthlappy_patient/framework/data_provider/global_controller.dart';
import 'package:healthlappy_patient/ui/auth/connectivity/internet_check.dart';
import 'package:healthlappy_patient/ui/screens/deshboard/deshboard.dart';
import 'package:healthlappy_patient/ui/screens/drawer/drawer_menu.dart';

class DrawerSetup extends ConsumerStatefulWidget {
  const DrawerSetup({super.key});

  @override
  ConsumerState createState() => _DrawerSetupState();
}

final ZoomDrawerController z = ZoomDrawerController();

class _DrawerSetupState extends ConsumerState<DrawerSetup> {
  @override
  Widget build(BuildContext context) {
    final globalWatch = ref.watch(globalProvider);

    return ZoomDrawer(
      controller: globalWatch.z,
      showShadow: true,
      // style: DrawerStyle.defaultStyle,
      menuScreen: const DrawerMenu(),
      mainScreen:   DashBoard(key: GlobalController().formKey,),

      duration: const Duration(milliseconds: 900),
      borderRadius: 24.0,
       // angle: 0.0,
      menuBackgroundColor: Colors.orange,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      );

  }
}
