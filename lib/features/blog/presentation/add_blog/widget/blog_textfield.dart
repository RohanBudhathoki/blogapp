import 'package:blogapp/core/theme/color.dart';
import 'package:flutter/material.dart';

class BlogTextfield extends StatelessWidget {
  TextEditingController? controller;
  final String hintText;
  final int? maxLines;

  BlogTextfield({
    super.key,
    required this.hintText,
    this.maxLines,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor,
        ),

        fillColor: AppColor.whiteColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.borderTextfield,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColor.borderTextfield,
            width: 1,
          ),
        ),
      ),
    );
  }
}
