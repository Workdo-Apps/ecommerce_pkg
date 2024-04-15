// TODO Implement this library.

// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';

class CommonSocialButton extends StatelessWidget {
  final String? title;
  final String? icon;
  final double? height;
  final double? width;
  final double? radius;
  final Color? btnColor;
  final Color? circleColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;
  final Function()? onPressed;

  CommonSocialButton(
      {super.key,
      this.title,
      this.icon,
      this.height,
      this.width,
      this.onPressed,
      this.btnColor,
      this.radius,
      this.borderColor,
      this.iconColor,
      this.textColor,
      this.circleColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 40,
        width: width ?? 272,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(radius ?? 64),
          border: Border.all(
            color: borderColor ?? AppColor.cTransparent,
          ),
        ),
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(3),
                child: Center(
                  child: assetSvgImageWidget(
                    image: icon!,
                  ),
                )),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title!,
                  style: pMedium10.copyWith(color: textColor ?? AppColor.cLabel,fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(width: 0, height: 0),
            ),
          ],
        ),
      ),
    );
  }
}
