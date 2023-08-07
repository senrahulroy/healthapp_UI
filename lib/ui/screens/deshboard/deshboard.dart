import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gap/gap.dart';
import 'package:healthlappy_patient/ui/auth/connectivity/internet_check.dart';
import 'package:healthlappy_patient/ui/screens/drawer/drawer_menu.dart';
import 'package:healthlappy_patient/ui/utils/app_string.dart';
import 'package:healthlappy_patient/ui/utils/const.dart';
import 'package:healthlappy_patient/ui/utils/theme_const.dart';
import 'package:healthlappy_patient/ui/utils/widgets/comman_input_search.dart';
import 'package:healthlappy_patient/ui/utils/widgets/comman_input_text.dart';

import '../../../framework/data_provider/global_controller.dart';
import '../drawer/drawer_configure.dart';

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({
    super.key,
  });

  @override
  ConsumerState createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final globalWatch = ref.watch(globalProvider);

    return InternetCheck(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                globalWatch.z.toggle!();
                debugPrint('BtnPress');
              },
            ),
          ),
          body: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainDashboard(),
                        ));
                  },
                  child: const Text('Main')))),
    );
  }
}

class MainDashboard extends ConsumerStatefulWidget {
  const MainDashboard({super.key});

  @override
  ConsumerState createState() => _MainDashboardState();
}

class _MainDashboardState extends ConsumerState<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.person),
          elevation: 1,
        shadowColor: Colors.grey,
        title: const Row(
          children: [
            Text("Dr. Payal Patel"),
            Expanded(child: SizedBox()),
            Icon(Icons.menu)
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start
          ,
          children: [
            welcomeBack(),
            textTitle(TextStrings.strCategories),
            textTitle(TextStrings.strCategories),
          ],
        ),
      ),
    );
  }
}

/// Welcome screen
Widget welcomeBack() {
  return Container(
    // height: 180.h,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Constant().colorContainerBorder,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TextStrings.strWelcomeBack, style: TextStyles.txtSemiBoldCream),
          Text(TextStrings.strFindYourDoctor,
              style: TextStyles.txtExtraLargeBoldWhite),
          Gap(4.h),
          const SearchBarDoctor(hintText: 'Search doctors',suffixIcon: Icon(Icons.search),)
        ],
      ),
    ),
  );
}
/// title TextView
Widget textTitle(String title) => Padding(
    padding:   EdgeInsets.symmetric(vertical: 20.h),
    child: Text(title,style: TextStyles.txtSemiBoldBlack,));

class Categories {
  const Categories({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Categories> categoriesList =   <Categories>[
    Categories(title: 'Artificial', icon: Icons.home),
    Categories(title: 'Cardiology', icon: Icons.home),
    Categories(title: 'General', icon: Icons.home),
    Categories(title: 'Medicine', icon: Icons.home),
    Categories(title: 'Dental', icon: Icons.home),
    Categories(title: 'Neurology', icon: Icons.home),
];

Widget categories(Categories categories){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: Constant().colorContainerBorder
          ),
          borderRadius: BorderRadiusDirectional.circular(20.h)
        ),
        child: Icon(categories.icon),
      ),
        Text(categories.title),
    ],
  );
}

Widget categoriesGrid (){

  return GridView.count(crossAxisCount: 3,
    crossAxisSpacing: 4.0,
    mainAxisSpacing: 8.0,
    children:List.generate(categoriesList.length, (index) {
    return Center();

  }  
  ),
  );
}