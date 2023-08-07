import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;

///Get Platform of Current App
bool getIsIOSPlatform() => Platform.isIOS;

bool getIsAndroidPlatform() => Platform.isAndroid;

bool getIsWindowPlatform() => Platform.isWindows;

bool getIsMacPlatform() => Platform.isMacOS;

bool getIsWebPlatform() => kIsWeb;

///Check Dark Mode
bool isDarkMode = false;

///Hide Keyboard
hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

///Print Data
printData(data) {
  if (kDebugMode) {
    print(data);
  }
}

///Hive Keys
const String keySocialLogin = 'key_social_login';
const String keyIsUserLoggedIn = 'key_is_user_logged_in';
const String keyUserId = 'key_user_id';

///Hive Box
// var userBox = Hive.box('userBox');

// saveLocalData(String key, value) {
//   userBox.put(key, value);
// }

// ///Get Data from Hive
// String getIsSocialLogin() => (userBox.get(keySocialLogin) ?? "");

// String getIsUserLoggedIn() => (userBox.get(keyIsUserLoggedIn) ?? "");

// String getUserId() => (userBox.get(keyUserId) ?? "");

///App Padding
double paddingHorizontal = setWidth(16);

///Setting Screen Util in Web
setHeight(double height) => ScreenUtil().setHeight(height);

setWidth(double width) => ScreenUtil().setWidth(width);

setFontSize(double fontSize) => ScreenUtil().setHeight(fontSize);

///Show Snackbar
showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

///Validations

int maxMobileLength = 10;
int otpLength = 6;
int maxEmailLength = 40;
int maxPasswordLength = 15;
int maxPinCodeLength = 6;

isPasswordValid(String str) {
  if (str.length >= 8 && str.length <= 15) {
    return true;
  } else {
    return false;
  }
}

isPhoneNumberValid(String str) {
  if (str.isNotEmpty && str.length == 10) {
    return true;
  } else {
    return false;
  }
}

isEmailValid(String str) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  if (!(regex.hasMatch(str))) {
    return false;
  } else {
    return true;
  }
}

// logout(BuildContext context, GlobalController globalWatch) async {
//   await globalWatch.auth.signOut();
//   await globalWatch.googleSignIn.signOut();
//   saveLocalData(keySocialLogin, "false");
//   saveLocalData(keyUserId, '');
//   saveLocalData(keyIsUserLoggedIn, false);
//   // ignore: use_build_context_synchronously
//   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
//     builder: (BuildContext context) {
//       return const SplashScreen();
//     },
//   ), (route) => false);
// }
class PasswordValidator   {
  static const int _minLength = 6;
  static const int _maxLength = 12;

  static String validate(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < _minLength) {
      return 'Password must be at least $_minLength characters long';
    }
    if (value.length > _maxLength) {
      return 'Password must be at most $_maxLength characters long';
    }
    if (!_containsUppercase(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!_containsLowercase(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!_containsDigit(value)) {
      return 'Password must contain at least one digit';

    }
    return '';

  }

  static bool _containsUppercase(String value) {
    return value.contains(RegExp(r'[A-Z]'));

  }

  static bool _containsLowercase(String value) {
    return value.contains(RegExp(r'[a-z]'));
  }

  static bool _containsDigit(String value) {
    return value.contains(RegExp(r'[0-9]'));
  }
}
