import 'package:blogapp/core/theme/color.dart';
import 'package:flutter/material.dart';

class RegisterTextfield extends StatelessWidget {
  TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  final Icon? imagesuffix;
  RegisterTextfield({
    super.key,
    this.controller,
    required this.hintText,
    this.imagesuffix,
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obscureText,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
          ),
          suffixIcon: imagesuffix,
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
      ),
    );
  }
}
