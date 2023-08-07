import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'const.dart';

class Constant {
  final double infiniteSize = double.infinity;

  final String fontFamily = "Poppins";

  final FontWeight fontWeightThin = FontWeight.w100;
  final FontWeight fontWeightExtraLight = FontWeight.w200;
  final FontWeight fontWeightLight = FontWeight.w300;
  final FontWeight fontWeightRegular = FontWeight.w400;
  final FontWeight fontWeightMedium = FontWeight.w500;
  final FontWeight fontWeightSemiBold = FontWeight.w600;
  final FontWeight fontWeightBold = FontWeight.w700;
  final FontWeight fontWeightExtraBold = FontWeight.w800;

  final Color colorScaffoldBG = const Color(0xFFF9F9F9);
  final Color colorPrimary = const Color(0xffDB3022);
  final Color colorLightBlue = const Color(0xffC2E3F6);
  final Color colorMainFont = const Color(0xff282828);
  final Color colorGreen = const Color(0xff35867D);
  final Color colorPrimaryLight = const Color(0xff9DADBD);
  final Color colorBlack = const Color(0xff000000);
  final Color colorWhite = const Color(0xffFFFFFF);
  final Color colorCream = const Color(0xffF1F1F1);
  final Color colorGreyTab = const Color(0xff9F9F9F);
  final Color colorTextGrey = const Color(0xff979797);
  final Color colorDarkGrey = const Color(0xff4E4E4E);
  final Color colorLightGrey = const Color(0xff979797);
  final Color colorLightGrey2 = const Color(0xffAFAFAF);
  final Color colorDarkRed = const Color(0xffFF3B3B);
  final Color colorHintText = const Color(0xffB8B8B8);
  final Color colorTransparent = const Color(0x00000000);
  final Color colorGreyCardBg = const Color(0xffDCDCDC);
  final Color colorDarkBlue = const Color(0xff1D0330);
  final Color colorRed = const Color(0xffEA5455);
  final Color colorYellow = const Color(0xffFEBF0F);
  final Color colorRatingBar = const Color(0xFFFFBA49);
  final Color colorGrey = const Color(0xffE8E8EC);
  final Color colorGreyShadow = const Color(0xff707070);
  final Color colorBlue = const Color(0xff007AFF);
  final Color colorDarkExtraRed = const Color(0xffDB2B18);
  final Color colorContainerBorder = const Color(0xffb28df5);
  final Color colorContainerBorder1 = const Color(0xff33bcb3);
  final Color colorContainerBorder2 = const Color(0xffd9a1c4);
  final Color colorContainerBorder3 = const Color(0xffccc7df);
  final Color colorContainerBorder4 = const Color(0xfff77376);
  final Color colorContainerBorder5 = const Color(0xfff87c73);
  final Color colorContainerBorder6 = const Color(0xffeabcb4);




  Color colorTextMainFontByTheme() => isDarkMode ? colorWhite : colorBlack;
}


class TextStyles {
  static Color color = Constant().colorTextMainFontByTheme();

  static TextStyle get txtNormal =>
      TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: Constant().fontWeightMedium,
        fontFamily: Constant().fontFamily,
      );

  static TextStyle get txtRegular =>
      TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: Constant().fontWeightRegular,
        fontFamily: Constant().fontFamily,
      );

  static TextStyle get txtBold =>
      TextStyle(
          color: color,
          fontSize: 16.sp,
          fontWeight: Constant().fontWeightBold,
          fontFamily: Constant().fontFamily);

  static TextStyle get txtExtraBold =>
      TextStyle(
          color: color,
          fontSize: 16.sp,
          fontWeight: Constant().fontWeightExtraBold,
          fontFamily: Constant().fontFamily);

  static TextStyle get txtLight =>
      TextStyle(
          color: color,
          fontSize: 16.sp,
          fontWeight: Constant().fontWeightLight,
          fontFamily: Constant().fontFamily);

  static TextStyle get txtMedium =>
      TextStyle(
          fontSize: 16.sp,
          fontWeight: Constant().fontWeightMedium,
          fontFamily: Constant().fontFamily);

  static TextStyle get txtSemiBoldBlack =>
      TextStyle(
          color: Constant().colorBlack,
          fontSize: 18.sp,
          fontWeight: Constant().fontWeightSemiBold,
          fontFamily: Constant().fontFamily);

  static TextStyle get txtSemiBoldCream =>
      TextStyle(
          color: Constant().colorCream,
          fontSize: 18.sp,
          fontWeight: Constant().fontWeightSemiBold,
          fontFamily: Constant().fontFamily);

  static TextStyle get txtExtraLargeBoldWhite =>
      TextStyle(
          color: Constant().colorWhite,
          fontSize: 36.sp,
          fontWeight: Constant().fontWeightSemiBold,
          fontFamily: Constant().fontFamily);

}