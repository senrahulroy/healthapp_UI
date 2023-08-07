// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:healthlappy_patient/framework/data_provider/auth/sign_in_controller.dart';
import 'package:healthlappy_patient/ui/auth/connectivity/internet_check.dart';
import 'package:healthlappy_patient/ui/utils/app_string.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthlappy_patient/ui/utils/const.dart';
import 'package:healthlappy_patient/ui/utils/widgets/comman_loading.dart';
import 'package:healthlappy_patient/ui/utils/widgets/toast_widget.dart';
import 'package:matcher/expect.dart';
import '../../framework/data_provider/global_controller.dart';
import '../screens/drawer/drawer_configure.dart';
import '../utils/app_assets.dart';
import '../utils/theme_const.dart';
import '../utils/widgets/comman_btn.dart';
import '../utils/widgets/comman_input_text.dart';
import 'sign_up_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final signWatch = ref.watch(signInProvider);

    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              TextStrings.strSignIn,
            ),
          ),
        ),
        body: BodySignIn(signWatch: signWatch),
      ),
    );
  }
}

class BodySignIn extends ConsumerWidget {
  const BodySignIn({
    super.key,
    required this.signWatch,
  });

  final SignInController signWatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final globalWatch = ref.watch(globalProvider);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Form(
            key: globalWatch.formKey,
            child: Column(
              children: [
                // Image Asset
                SizedBox(
                  height: 250.h,
                  width: 250.h,
                  child: Image.asset(AppAssets.signIn),
                ),

                // Email text Field
                CommonTextField(
                  textEditingController: signWatch.emailController,
                  focusNode: signWatch.emailFocusNode,
                  prefix: const Icon(Icons.email),
                  labelText: TextStrings.strEmail,
                  validator: (value) {
                    return signWatch.strEmailErr == ""
                        ? null
                        : signWatch.strEmailErr;
                  },
                  isLabel: true,
                  textInputType: TextInputType.emailAddress,
                  onChanged: (value) => signWatch.checkEmailValidation(value),
                ),

                //PassWord text Field
                Gap(20.h),
                CommonTextField(
                  prefix: const Icon(Icons.security),
                  isObscureText: signWatch.isVisible,
                  textEditingController: signWatch.passwordController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    return signWatch.strPasswordErr == ""
                        ? null
                        : signWatch.strPasswordErr;
                  },
                  onChanged: (value) =>
                      signWatch.checkPasswordValidation(value),
                  suffix: IconButton(
                    icon: signWatch.isVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      signWatch.passVisibility();
                    },
                  ),
                  labelText: TextStrings.strYourPassword,
                  isLabel: true,
                ),

                // Forget Password Here
                Gap(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        TextStrings.strForget,
                        style: TextStyle(fontSize: 15.h, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Gap(20.h),

                // sign In button
                CommonButton(
                  leadingIcon: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  isAllFieldsValid: signWatch.isAllFieldsDone,
                  buttonText: signWatch.isLoading
                      ?   Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SpinKitDoubleBounce(color: Colors.white),
                              Gap(1.w),
                                Text('Please wait.....',style: TextStyles.txtMedium.copyWith(
                                color: Colors.white,
                                fontSize: setFontSize(12),
                              ),)
                            ],
                          ),
                      )
                      //const  CircularProgressIndicator()//LoadingPage()
                      : Text(
                          TextStrings.strSignIn,
                          style: TextStyles.txtMedium.copyWith(
                            color: Colors.white,
                            fontSize: setFontSize(12),
                          ),
                        ),
                  onPressed: () async {
                    if (signWatch.isAllFieldsDone) {
                      try {
                        await auth.signInWithEmailAndPassword(
                            email: signWatch.emailController.text,
                            password: signWatch.passwordController.text);
                        signWatch.updateIsLoading(true);
                        await Future.delayed(const Duration(seconds: 3));
                        signWatch.updateIsLoading(false);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DrawerSetup()));
                        Fluttertoast.showToast(
                            msg: signWatch.emailController.text);
                        signWatch.emailController.clear();
                        signWatch.passwordController.clear();
                        signWatch.clearProvider();
                      } on FirebaseAuthException catch (e) {
                        String errorCode = e.code;
                        String errorMessage = e.message!;
                        debugPrint(e.code);
                        signWatch.updateIsLoading(false);
                        switch (errorCode) {
                          case "wrong-password":
                            ToastWidget.showToast(message: errorMessage);
                            break;

                          case "invalid-email":
                            ToastWidget.showToast(message: errorMessage);
                            break;

                          case "user-disabled":
                            ToastWidget.showToast(message: errorMessage);
                            break;

                          case "user-not-found":
                            ToastWidget.showToast(message: errorMessage);
                            break;

                          default:
                            ToastWidget.showToast(message: errorMessage);
                            break;
                        }
                      }
                    }
                  },
                ),
                Gap(30.h),

                // Here start with Other login
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

                // Google sign in button
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
                              "Sign In with Google",
                              style: GoogleFonts.abel(),
                            )
                          ],
                        ),
                        onPressed: () {})
                  ],
                ),
                // Gap(20.h),

                // Don't have as account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(fontSize: 15.h, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const InternetCheck(child: SignUpScreen()),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
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
    );
  }
}
