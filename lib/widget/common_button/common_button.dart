// ignore_for_file: prefer_const_constructors

import 'package:async/async.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final double? horizontal;
  final double? fontSize;
  final Function()? onPressed;
  final Color? bColor;
  final Color? btnColor;
  final Color? textColor;
  final double? radius;

   CommonButton({
    super.key,
    this.title,
    this.height,
    this.width,
    this.onPressed,
    this.bColor,
    this.btnColor,
    this.textColor,
    this.fontSize,
    this.horizontal,
    this.radius,
  });

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _memoizer.runOnce(() async {
          await Future.delayed(Duration(milliseconds: 300));
          print("Button pressed");
          onPressed!();
        });
      },
      child: Container(
        width: width ?? Get.width,
        // height: height ?? Get.height * 0.07,
        height: height ?? 40,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(radius ?? 12),
          border: Border.all(
            color: bColor ?? Colors.transparent,
          ),
        ),
        // padding: EdgeInsets.symmetric(horizontal: horizontal??Get.width * 0.1),
        child: Center(
          child: Text(
            title!,
            style: pMedium14.copyWith(color: textColor ?? AppColor.cLabel, fontSize: fontSize ?? 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
