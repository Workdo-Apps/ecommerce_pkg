import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CupertinoAlertDialog buildLogoutDialog({String? title, String? subTitle, Function()? onYesTap, Color? cText}) {
  return CupertinoAlertDialog(
    title: Text(
      title!,
      style: pSemiBold18.copyWith(color: cText ?? AppColor.cLabel),
      textAlign: TextAlign.center,
    ),
    content: Text(
      subTitle!,
      style: pMedium14.copyWith(color: cText ?? AppColor.cLabel),
      textAlign: TextAlign.center,
    ),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'No',
          style: pMedium18.copyWith(color: AppColor.cRedText),
        ),
      ),
      TextButton(
        onPressed: onYesTap,
        child: Text(
          'Yes',
          style: pMedium18.copyWith(color: AppColor.cBlueFont),
        ),
      ),
    ],
  );
}
