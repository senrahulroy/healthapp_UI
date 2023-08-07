import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../ui/utils/app_string.dart';
import '../../../ui/utils/const.dart';

// Make Provider to access all this information
final signUpProvider = ChangeNotifierProvider((ref) {
  return SignUpController();
});

// this is Controller for sign up screen
class SignUpController extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  // FocusNode
  FocusNode userNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode cPasswordFocusNode = FocusNode();

  String strUserName = "";
  String strUserNameErr = "";

  String strEmail = "";
  String strEmailErr = "";

  String strPassword = "";
  String strPasswordErr = "";

  String strCPassword = "";
  String strCPasswordErr = "";

  // check all field have value
  bool isAllFieldsDone = false;
  bool isUserLoggedIn = false;
  bool _isVisible = true;
  bool _cIsVisible = true;

  bool get isVisible => _isVisible;
  bool get cIsVisible => _cIsVisible;

  // bool get isAllFieldsValid =>
  //    strEmail.isNotEmpty && strEmailErr.isEmpty && strPassword.isNotEmpty && strPasswordErr.isEmpty;

  // passVisibility chaker
  void passVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
  // confirm passVisibility chaker

  void cPassVisibility() {
    _cIsVisible = !_cIsVisible;
    notifyListeners();
  }

  //Update Is User Logged In
  updateUserLoggedIn(bool val) {
    isUserLoggedIn = val;
    notifyListeners();
  }

  //Clear All Providers
  clearProvider() {
    strUserName = "";
    strUserNameErr = "";

    strEmail = "";
    strEmailErr = "";

    strPassword = "";
    strPasswordErr = "";

    strCPassword = "";
    strCPasswordErr = "";

    isAllFieldsDone = false;
    _isVisible = true;
    _cIsVisible = true;

    notifyListeners();
  }

  //Check Full name Validation
  checkFullNameValidation(String value) {
    strUserName = value;
    strUserNameErr = "";
    String removeWhiteSpace = value.replaceAll(" ", "");
    if (removeWhiteSpace.isEmpty) {
      strUserNameErr = TextStrings.strUserName;
    } else {
      strUserNameErr = "";
    }
    checkUserName();
  }

  checkEmailValidation(String value) {
    strEmail = value;
    strEmailErr = "";
    String removeWhiteSpace = value.replaceAll(" ", "");

    if (removeWhiteSpace.isEmpty) {
      strEmailErr = TextStrings.strEmailNull;
    } else if (!isEmailValid(value)) {
      strEmailErr = TextStrings.strEnterEmail;
    } else {
      strEmailErr = "";
    }
    checkAllEmailValidation();
  }

  //Check All Validation

  checkPasswordValidation(String value) {
    strPassword = value;
    strPasswordErr = PasswordValidator.validate(value);
  }

  checkCPasswordValidation(String value) {
    strCPassword = value;
    strCPasswordErr = "";
    if (strCPassword != strPassword) {
      strCPasswordErr = "Password is not match";
    } else {
      strCPasswordErr = "";
    }
    checkCPass();
    notifyListeners();

  }

  checkUserName() {
    isAllFieldsDone = (strUserName != "" && strUserNameErr == "");
    checkAllEmailValidation();

    notifyListeners();
  }

  checkAllEmailValidation() {
    isAllFieldsDone = (strEmail != "" && strEmailErr == "");
    checkPass();
    checkCPass();
    notifyListeners();
  }

  checkPass() {
    isAllFieldsDone = strPassword != "" && strPasswordErr == "";
    notifyListeners();
  }

  checkCPass() {
    isAllFieldsDone = strCPassword != "" && strCPasswordErr == "";
    notifyListeners();
  }
}
