// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/images.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class OrderProductWidget extends StatelessWidget {
  final String? productName;
  final String? productImage;
  final String? quantity;
  final String? price;
  final Function()? returnOnTap;
  final Color? bColor;
  final Color? bgColor;
  final Color? textColor;
  final Color? priceColor;

  const OrderProductWidget({
    super.key,
    this.productName,
    this.productImage,
    this.quantity,
    this.price,
    this.returnOnTap,
    this.bColor,
    this.bgColor,
    this.textColor,
    this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 85,
        width: Get.width,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: bColor ?? AppColor.cWhite),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image.network(
                //   productImage!,
                //   height: 45,
                //   width: 45,
                // ),
                buildCachedNetworkImage(imageUrl: productImage!, height: 45, width: 45, cIndicator: priceColor),
                horizontalSpace(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2.3,
                      child: Text(
                        productName!,
                        style: pSemiBold14.copyWith(color: textColor ?? AppColor.cWhite),
                      ),
                    ),
                    Text(
                      "Qty:$quantity",
                      style: pRegular12.copyWith(
                        color: AppColor.cGreyFont,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  price!,
                  style: pMedium18.copyWith(color: priceColor),
                ),
                verticalSpace(6),
                GestureDetector(
                  onTap: returnOnTap,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      assetSvgImageWidget(
                        image: DefaultImages.returnIcn,
                        width: 8,
                        height: 8,
                        colorFilter: ColorFilter.mode(
                          textColor ?? AppColor.cWhite,
                          BlendMode.srcIn,
                        ),
                      ),
                      horizontalSpace(6),
                      Text(
                        "Return Item",
                        style: pMedium8.copyWith(color: textColor ?? AppColor.cWhite),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
