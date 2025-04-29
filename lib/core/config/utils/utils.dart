import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:blogapp/core/theme/color.dart';
import 'package:flutter/material.dart';

void flushBar(BuildContext context, String content) {
  showFlushbar(
    context: context,
    flushbar: Flushbar(
      message: content,
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(16),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      backgroundColor: AppColor.redColor,
      forwardAnimationCurve: Curves.linear,
      reverseAnimationCurve: Curves.decelerate,
      titleColor: AppColor.whiteColor,
      positionOffset: 20,
    )..show(context),
  );
}
