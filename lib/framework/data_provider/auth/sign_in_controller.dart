
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../ui/utils/app_string.dart';
import '../../../ui/utils/const.dart';

//Provider

final signInProvider = ChangeNotifierProvider ((ref) {
  return SignInController();
});


// class for Sign in Controller
class SignInController extends ChangeNotifier{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Focus Node
   FocusNode emailFocusNode = FocusNode();
   FocusNode passwordFocusNode = FocusNode();

   // Default String

   String strEmail ="";
   String strEmailErr ="";

   String strPassword ="";
   String strPasswordErr ="";

  // check all field have value
   bool isAllFieldsDone = false;
   bool isUserLoggedIn = false;
   bool isLoading = false;
   bool _isVisible = true ;

   bool get isVisible => _isVisible;

  void passVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  //Update Is User Logged In
  updateUserLoggedIn(bool val) {
    isUserLoggedIn = val;
    notifyListeners();
  }

  ///Clear All Providers
  clearProvider() {
    strEmail = "";
    strEmailErr = "";
    strPassword = "";
    strPasswordErr = "";
    isAllFieldsDone = false;
    isLoading = false;
    _isVisible = true;
    notifyListeners();
  }

   updateIsLoading(bool val){
     isLoading = val;
     notifyListeners();
   }

  checkEmailValidation(String value) {
    strEmail = value;
    strEmailErr = "";
     String removeWhiteSpace = value.replaceAll(" ", "");

    if (removeWhiteSpace.isEmpty) {
      strEmailErr = TextStrings.strEmailNull;
    } else if (!isEmailValid(value)) {
      strEmailErr  = TextStrings.strEnterEmail;
    } else {
      strEmailErr = "";
    }
    checkAllEmailValidation();

  }

  //Check All Validation
  checkAllEmailValidation() {
    isAllFieldsDone= (strEmail != "" &&  strEmailErr == "");
    checkPass();
    notifyListeners();

  }

  checkPasswordValidation(String value) {
    strPassword = value;
    strPasswordErr = PasswordValidator.validate(value);
    checkPass();

  }
  checkPass(){
    isAllFieldsDone = strPassword != "" &&  strPasswordErr == "";
    notifyListeners();
  }
}