import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthlappy_patient/framework/data_provider/auth/sign_up_controller.dart';
import 'package:healthlappy_patient/ui/utils/const.dart';
import '../utils/app_assets.dart';
import '../utils/theme_const.dart';
import '../utils/widgets/comman_btn.dart';
import '../utils/widgets/comman_input_text.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final signUpWatch = ref.watch(signUpProvider);

    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Text(
              "Sign up",
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 250.h,
                    width: 250.h,
                    child: Image.asset(AppAssets.signUp),
                  ),
                  CommonTextField(
                    textEditingController: signUpWatch.userNameController,
                    focusNode: signUpWatch.userNameFocusNode,
                    prefix: const Icon(Icons.person),
                    labelText: 'Username',
                    isLabel: true,
                    onChanged: (value) {
                      signUpWatch.checkFullNameValidation(value);
                    },
                    validator: (value) {
                      return signUpWatch.strUserNameErr == ""
                          ? null
                          : signUpWatch.strUserNameErr;
                    },
                  ),
                  Gap(20.h),
                  CommonTextField(
                    textEditingController: signUpWatch.emailController,
                    focusNode: signUpWatch.emailFocusNode,
                    prefix: const Icon(Icons.email),
                    labelText: 'Email',
                    isLabel: true,
                    validator: (value) {
                      return signUpWatch.strEmailErr == ""
                          ? null
                          : signUpWatch.strEmailErr;
                    },
                    onChanged: (value) =>
                        signUpWatch.checkEmailValidation(value),
                  ),
                  Gap(20.h),
                  CommonTextField(
                    // textEditingController: signUpWatch.passwordController,
                    focusNode: signUpWatch.passwordFocusNode,
                    prefix: const Icon(Icons.security),
                    isObscureText: signUpWatch.isVisible,
                    suffix: IconButton(
                      icon: signUpWatch.isVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () => signUpWatch.passVisibility(),
                    ),
                    labelText: 'Password',
                    isLabel: true,
                    validator: (value) => signUpWatch.strPasswordErr == ""
                        ? null
                        : signUpWatch.strPasswordErr,
                    onChanged: (value) =>
                        signUpWatch.checkPasswordValidation(value),
                  ),
                  Gap(20.h),
                  CommonTextField(
                    // textEditingController: signUpWatch.cPasswordController,
                    focusNode: signUpWatch.cPasswordFocusNode,
                    prefix: const Icon(Icons.security),
                    isObscureText: signUpWatch.cIsVisible,
                    suffix: IconButton(
                      icon: signUpWatch.cIsVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () => signUpWatch.cPassVisibility(),
                    ),
                    labelText: 'Confirm Password',
                    isLabel: true,
                    validator: (value) => signUpWatch.strCPasswordErr == ""
                        ? null
                        : signUpWatch.strCPasswordErr,
                    onChanged: (value) =>
                        signUpWatch.checkCPasswordValidation(value),
                  ),
                  Gap(20.h),
                  CommonButton(
                    leadingIcon: const Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (signUpWatch.isAllFieldsDone) {
                        debugPrint(true.toString());
                      } else {
                        debugPrint(false.toString());
                      }
                    },
                    isAllFieldsValid: signUpWatch.isAllFieldsDone,
                    buttonText: Text(
                      'Register',
                      style: TextStyles.txtMedium.copyWith(
                        color: Colors.white,
                        fontSize: setFontSize(12),
                      ),
                    ),
                  ),
                  Gap(20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.h,
                        height: 1.5.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(0.0),
                              Colors.red.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                      Gap(10.h),
                      Text(
                        'Or continue with',
                        style: GoogleFonts.allerta(),
                      ),
                      Gap(10.h),
                      Container(
                        width: 100.h,
                        height: 1.5.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Colors.black.withOpacity(0.0),
                              Colors.red.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(20.h),
                  // Google sign up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          color: Colors.white60,
                          elevation: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 20.0,
                                width: 20.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        AppAssets.google,
                                      ),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Gap(10.h),
                              Text(
                                "Sign up with Google",
                                style: GoogleFonts.abel(),
                              )
                            ],
                          ),
                          onPressed: () {})
                    ],
                  ),

                  // Already have an account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 15.h, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 15.h, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
