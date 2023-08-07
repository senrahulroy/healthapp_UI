import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';
import '../theme_const.dart';

///Common Text Field
class CommonTextField extends StatelessWidget {
  ///Leading Icon
  final Widget? prefix;

  ///Trailing Icon
  final Widget? suffix;

  ///Text Editing Controller (For all the fields)
  final TextEditingController? textEditingController;

  ///Focus Nodes (For all the Fields)
  final FocusNode? focusNode;

  ///Text Field Label Value
  final String labelText;

  ///On Changed function of Text Field
  final ValueChanged<String>? onChanged;

  ///Show/Hide Label
  final bool isLabel;

  ///Show/Hide Password
  final bool? isObscureText;

  ///Leading Icon Color
  final Color? prefixIconColor;

  ///Trailing Icon Color
  final Color? suffixIconColor;

  ///Input Limitations
  final List<TextInputFormatter>? inputFormatters;

  ///Keyboard Type
  final TextInputType? textInputType;

  ///Validation Error Return
  final FormFieldValidator? validator;

  ///Set editable/un-editable text field
  final bool? readOnly;

  const CommonTextField({
    Key? key,
    this.prefix,
    this.suffix,
    this.textEditingController,
    this.focusNode,
    required this.labelText,
    this.onChanged,
    required this.isLabel,
    this.isObscureText,
    this.prefixIconColor,
    this.suffixIconColor,
    this.inputFormatters,
    this.textInputType,
    this.validator,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          obscureText: isObscureText ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          inputFormatters: inputFormatters,
          readOnly: readOnly ?? false,
          keyboardType: textInputType,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: labelText,
            labelStyle: TextStyles.txtNormal.copyWith(
              fontSize: setFontSize(12),
              color: Constant().colorBlack,
            ),
            prefixIcon: prefix,
            prefixIconColor: prefixIconColor,

            ///When text field is selected
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: setWidth(1),
                color: Constant().colorBlack,
              ),
            ),

            ///When text field is enabled
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: setWidth(1),
                color: Constant().colorBlack.withOpacity(0.5),
              ),
            ),

            ///When text field is disabled
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: setWidth(1),
                color: Colors.black,
              ),
            ),

            ///When error is shown
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: setWidth(1),
                color: Colors.red,
              ),
            ),

            ///When error is shown and text field is selected
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: setWidth(1),
                color: Colors.red,
              ),
            ),
            suffixIcon: suffix,
            suffixIconColor: prefixIconColor,
          ),
          onChanged: onChanged,
          validator: validator,
          onTap: () {},
        ),
      ],
    );
  }
}
