import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const.dart';
import '../theme_const.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isAllFieldsValid;
  final Widget? leadingIcon;
  final Widget buttonText;

  const CommonButton({
    Key? key,
    required this.onPressed,
    required this.isAllFieldsValid,
    this.leadingIcon,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.w),
      ),
      onPressed: onPressed,
      color: isAllFieldsValid
          ? Constant().colorPrimary
          : Constant().colorPrimary.withOpacity(0.1),
      child: Container(
        height: setHeight(50),
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: setHeight(15)),
          child: Row(
            children: [
              leadingIcon ?? Container(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: setWidth(10)),
                child: Container(
                  height: Constant().infiniteSize,
                  color: Constant().colorWhite,
                  width: 0.5,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Transform.translate(
                    offset: Offset(setWidth(-20), 0),
                    child:buttonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
