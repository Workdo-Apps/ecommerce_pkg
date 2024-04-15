// TODO Implement this library.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/common_button/common_button.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class OrderItemTotalWidget extends StatelessWidget {
  final String? subtotal;
  final String? taxName;
  final String? tax;
  final String? total;
  final Color? bgColor;
  final Color? textColor;
  final Color? btnColor;
  final Color? btnTextColor;
  final Function()? onTap;
  final bool? isButtonShow;

  const OrderItemTotalWidget({
    super.key,
    this.subtotal,
    this.tax,
    this.total,
    this.bgColor,
    this.textColor,
    this.btnColor,
    this.btnTextColor,
    this.onTap,
    this.isButtonShow,
    this.taxName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(13)),
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              totalTextWidget(title: "Sub-total:", subTitle: subtotal, textColor: textColor),
              totalTextWidget(title: "$taxName:", subTitle: tax, textColor: textColor),
              totalTextWidget(title: "Total:", subTitle: total, textColor: textColor),
            ],
          ),
          isButtonShow == true
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: horizontalDivider(color: AppColor.cLightGrey),
          )
              : SizedBox(width: 0, height: 0),
          verticalSpace(isButtonShow == true ? 18 : 0),
          isButtonShow == true
              ? CommonButton(
            onPressed: onTap,
            title: "Confirm Order",
            btnColor: btnColor,
            textColor: btnTextColor,
          )
              : SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }

  Column totalTextWidget({
    String? title,
    String? subTitle,
    final Color? textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!, style: pSemiBold14.copyWith(color: textColor)),
        Text(subTitle!, style: pMedium14.copyWith(color: textColor)),
      ],
    );
  }
}
