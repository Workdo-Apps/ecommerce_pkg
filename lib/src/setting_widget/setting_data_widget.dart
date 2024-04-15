// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';

class SettingDataWidget extends StatelessWidget {
  final Function()? onTap;
  final String? icn;
  final String? title;
  final String? subTitle;
  final Color? cText;
  final Color? cBorder;
  final Color? cBackground;

  const SettingDataWidget({
    super.key,
    this.onTap,
    this.icn,
    this.title,
    this.subTitle,
    this.cText,
    this.cBorder,
    this.cBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        tileColor: cBackground,
        leading: assetSvgImageWidget(
          image: icn,
          height: 36,
          width: 36,
          colorFilter: ColorFilter.mode(
            cText ?? AppColor.cWhite,
            BlendMode.srcIn,
          ),
        ),
        minLeadingWidth: 36,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        title: Text(
          title!,
          style: pMedium12.copyWith(
            color: cText ?? AppColor.cWhite,
            fontSize: 13,
          ),
        ),
        subtitle: Text(
          subTitle!,
          style: pRegular12.copyWith(
            color: cText ?? AppColor.cWhite,
            fontSize: 13,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: cBorder ?? AppColor.cWhite,
          ),
        ),
      ),
    );
  }
}
