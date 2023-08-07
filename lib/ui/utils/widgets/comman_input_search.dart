


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarDoctor extends StatelessWidget {
  final String hintText;
  final TextEditingController? searchController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  const SearchBarDoctor(
      {super.key,
        required this.hintText,
        this.searchController,
        this.prefixIcon,
        this.suffixIcon,
        this.suffixIconColor,
        this.prefixIconColor});

  @override
  Widget build(BuildContext context) {
    return Container(

      // Add padding around the search bar
      padding:   EdgeInsets.symmetric(vertical: 6.h,horizontal: 12.w),
      // Use a Material design search bar
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.w)

      ),
      child: TextField(
        controller: searchController,

        decoration: InputDecoration(
          hintText: hintText,
          // Add a search icon or button to the search bar
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          // Add a clear button to the search bar
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,

          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
        ),
      ),
    );
  }
}

