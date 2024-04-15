// TODO Implement this library.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';

class UseCouponCodeWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Color? cFont;
  final Color? cApplyText;
  final Color? cButton;
  final Color? bColor;
  final Color? fieldBorderColor;
  final Color? bgColor;
  final Function()? onTap;
  final double? padding;
  final double? boxRadius;
  final double? fieldRadius;
  final double? btnRadius;

  const UseCouponCodeWidget({
    super.key,
    this.cFont,
    this.cApplyText,
    this.cButton,
    this.bColor,
    this.bgColor,
    this.controller,
    this.onTap,
    this.padding,
    this.boxRadius,
    this.fieldRadius,
    this.btnRadius,
    this.fieldBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 8),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: bColor!),
        borderRadius: BorderRadius.circular(boxRadius ?? 13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Use Coupon Code",
                style: pBold14.copyWith(
                  color: cFont ?? AppColor.cWhite,
                ),
              ),
              Text(
                "Type code and accept",
                style: pRegular10.copyWith(
                  color: cFont ?? AppColor.cWhite,
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 170,
            decoration: BoxDecoration(
              border: Border.all(color: fieldBorderColor ?? AppColor.cWhite),
              borderRadius: BorderRadius.circular(fieldRadius ?? 20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: controller,
                    cursorColor: cFont,
                    style: pMedium12.copyWith(
                      color: cFont ?? AppColor.cWhite,
                    ),
                    decoration: InputDecoration(
                      hintText: "Type code",
                      hintStyle: pRegular12.copyWith(
                        color: cFont ?? AppColor.cWhite,
                      ),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      height: 30,
                      // width: 38,
                      decoration: BoxDecoration(
                        color: cButton,
                        borderRadius: BorderRadius.circular(btnRadius ?? 15),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Center(
                        child: Text(
                          "Apply",
                          style: pMedium12.copyWith(
                            color: cApplyText ?? AppColor.cWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
