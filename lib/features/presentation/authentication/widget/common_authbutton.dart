import 'package:blogapp/core/theme/color.dart';
import 'package:flutter/material.dart';

class CommonAuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CommonAuthButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      width: MediaQuery.of(context).size.width,
      height: 47.62,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blackColor,
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            height: 1.3,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Mulish',
          ),
        ),
      ),
    );
  }
}
