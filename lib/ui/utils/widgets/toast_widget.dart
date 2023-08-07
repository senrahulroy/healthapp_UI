
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast duration = Toast.LENGTH_SHORT,
    Color backgroundColor = Colors.black54,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}

