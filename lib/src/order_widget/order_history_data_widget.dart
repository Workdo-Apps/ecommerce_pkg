import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';
import 'package:flutter/material.dart';

class OrderHistoryDataWidget extends StatelessWidget {
  final String? orderText;
  final String? orderId;
  final String? status;
  final String? date;
  final String? price;
  final Function()? onTap;
  final Color? bColor;
  final Color? bgColor;
  final Color? textColor;
  final Color? priceColor;

  const OrderHistoryDataWidget({
    super.key,
    this.orderId,
    this.status,
    this.date,
    this.price,
    this.onTap,
    this.orderText,
    this.bColor,
    this.bgColor,
    this.textColor,
    this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: bColor ?? AppColor.cWhite,
            ),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderText!,
                      style: pRegular10.copyWith(color: textColor ?? AppColor.cWhite),
                    ),
                    Text(
                      orderId!,
                      style: pMedium14.copyWith(color: textColor ?? AppColor.cWhite),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    verticalSpace(8),
                    Text(
                      "Status: $status",
                      style: pRegular10.copyWith(color: textColor ?? AppColor.cWhite),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date: $date",
                    style: pRegular10.copyWith(color: textColor ?? AppColor.cWhite),
                  ),
                  Text(
                    price!,
                    style: pMedium18.copyWith(color: priceColor ?? AppColor.cWhite),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
