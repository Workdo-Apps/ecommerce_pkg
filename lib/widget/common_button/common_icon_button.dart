// TODO Implement this library.
// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:get/get.dart';

class CommonIconBorderButton extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final double? radius;
  final String? iconData;
  final Function()? onPressed;
  final Color? bColor;
  final Color? btnColor;
  final Color? textColor;

  CommonIconBorderButton({
    super.key,
    this.title,
    this.height,
    this.width,
    this.onPressed,
    this.bColor,
    this.btnColor,
    this.iconData,
    this.radius,
    this.textColor,
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
        height: height ?? 43,
        decoration: BoxDecoration(
          color: btnColor ?? AppColor.cWhite,
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(
            color: bColor ?? AppColor.cTransparent,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              style: pMedium12.copyWith(
                color: textColor ?? AppColor.cLabel,
              ),
              textAlign: TextAlign.center,
            ),
            horizontalSpace(iconData == null ? 0 : 10),
            iconData == null
                ? SizedBox()
                : assetSvgImageWidget(
                    image: iconData!,
                    color: textColor ?? AppColor.cLabel,
                  ),
          ],
        ),
      ),
    );
  }
}
