// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/common_button/common_button.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class CartItemTotalWidget extends StatelessWidget {
  final String? subtotal;
  final String? taxName;
  final String? tax;
  final String? total;
  final Color? bgColor;
  final Color? textColor;
  final Color? btnColor;
  final Color? btnTextColor;
  final Function()? onTap;

  const CartItemTotalWidget({
    super.key,
    this.subtotal,
    this.total,
    this.bgColor,
    this.textColor,
    this.btnColor,
    this.btnTextColor,
    this.onTap,
    this.taxName,
    this.tax,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(13)),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: RichText(
          //     text: TextSpan(
          //       text: "Total: ",
          //       style: pRegular14.copyWith(color: textColor),
          //       children: [TextSpan(text: total!, style: pSemiBold18.copyWith(color: textColor))],
          //     ),
          //   ),
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              totalTextWidget(title: "Sub-total:", subTitle: subtotal, textColor: textColor),
              totalTextWidget(title: "$taxName:", subTitle: tax, textColor: textColor),
              totalTextWidget(title: "Total:", subTitle: total, textColor: textColor),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: horizontalDivider(color: AppColor.cLightGrey),
          ),
          CommonButton(
            onPressed: onTap,
            title: "Proceed to checkout",
            btnColor: btnColor,
            textColor: btnTextColor,
          ),
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
