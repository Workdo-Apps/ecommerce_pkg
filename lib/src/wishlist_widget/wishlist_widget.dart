// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/images.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';
import 'package:get/get.dart';

class WishlistDataWidget extends StatelessWidget {
  final int? index;
  final String? image;
  final String? title;
  final String? price;
  final Function()? onTap;
  final Function()? cartTap;
  final Function()? deleteTap;
  final Color? bColor;
  final Color? bgColor;
  final Color? boxColor;
  final Color? icnColor;
  final Color? textColor;
  final Color? priceTextColor;

  WishlistDataWidget({
    super.key,
    this.index,
    this.deleteTap,
    this.cartTap,
    this.onTap,
    this.image,
    this.title,
    this.price,
    this.bColor,
    this.bgColor,
    this.boxColor,
    this.icnColor,
    this.textColor,
    this.priceTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            GestureDetector(
              onTap: cartTap,
              child: Container(
                height: 85,
                width: 85,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: boxColor,
                  // borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  child: assetSvgImageWidget(
                    image: DefaultImages.cartIcn,
                    colorFilter: ColorFilter.mode(
                      icnColor ?? AppColor.cLabel,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: deleteTap,
              child: Container(
                width: 85,
                height: 85,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: boxColor,
                  // borderRadius: BorderRadius.circular(12),
                ),
                child: Align(
                  child: assetSvgImageWidget(
                    image: DefaultImages.deleteIcn,
                    colorFilter: ColorFilter.mode(
                      icnColor ?? AppColor.cLabel,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                color: bColor ?? AppColor.cWhite,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(12),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              // leading: Image.network(image!, width: 55, height: 55),
              leading: buildCachedNetworkImage(imageUrl: image!, height: 55, width: 55, cIndicator: priceTextColor, fit: BoxFit.contain),
              title: Text(
                title!.capitalizeFirst!,
                style: pBold16.copyWith(
                  color: textColor ?? AppColor.cWhite,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    price!,
                    style: pBold14.copyWith(color: priceTextColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
