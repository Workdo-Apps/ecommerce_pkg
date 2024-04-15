// TODO Implement this library.
// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/images.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class CartItemWidget extends StatelessWidget {
  final String? title;
  final String? price;
  final String? image;
  final int? quantity;
  final bool? isShoppingCart;
  final bool? isSlide;
  final Function()? increment;
  final Function()? decrement;
  final Function()? deleteFun;
  final Color? bColor;
  final Color? bgColor;
  final Color? btnColor;
  final Color? boxColor;
  final Color? titleColor;
  final Color? icnColor;
  final Color? priceColor;

  const CartItemWidget({
    super.key,
    this.title,
    this.price,
    this.image,
    this.quantity,
    this.isShoppingCart,
    this.increment,
    this.decrement,
    this.isSlide,
    this.deleteFun,
    this.bColor,
    this.bgColor,
    this.boxColor,
    this.titleColor,
    this.icnColor,
    this.priceColor,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            customFlutterSlidable(
              onTap: deleteFun!,
              btnColor: btnColor,
              icnColor: icnColor,
            ),
          ],
        ),
        enabled: isSlide!,
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: bColor!),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  buildCachedNetworkImage(
                    imageUrl: image!,
                    width: 60,
                    height: 60,
                    cIndicator: boxColor,
                  ),
                  // Container(
                  //   height: 60,
                  //   width: 60,
                  //   decoration: BoxDecoration(
                  //       color: AppColor.cWhite, image: DecorationImage(image: NetworkImage(image!)), borderRadius: BorderRadius.circular(13)),
                  // ),
                  horizontalSpace(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 2.5,
                        child: Text(
                          title!,
                          style: pBold16.copyWith(color: titleColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpace(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isShoppingCart == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    qtyIncrementWidget(onTap: decrement, iconData: DefaultImages.minimizeIcn, color: boxColor, icnColor: icnColor),
                                    horizontalSpace(8),
                                    Text(
                                      quantity.toString(),
                                      style: pMedium12.copyWith(color: titleColor),
                                    ),
                                    horizontalSpace(8),
                                    qtyIncrementWidget(onTap: increment, iconData: DefaultImages.plusIcn, color: boxColor, icnColor: icnColor),
                                    horizontalSpace(10),
                                  ],
                                )
                              : Text(
                                  "Qty: $quantity",
                                  style: pMedium12.copyWith(color: AppColor.cGreyFont),
                                ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    price.toString(),
                    style: pSemiBold16.copyWith(color: priceColor),
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

Widget shoppingCartTextWidget({Color? bgColor, Color? textColor, Color? totalColor, int? total}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Shopping cart",
        style: pSemiBold27.copyWith(color: textColor ?? AppColor.cWhite),
      ),
      Container(
        height: 35,
        width: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              "${total}",
              style: pMedium16.copyWith(color: totalColor),
            ),
          ),
        ),
      )
    ],
  );
}

Widget qtyIncrementWidget({
  Function()? onTap,
  String? iconData,
  Color? color,
  Color? icnColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: assetSvgImageWidget(
          image: iconData,
          color: icnColor,
        ),
      ),
    ),
  );
}

Widget customFlutterSlidable({
  required Function() onTap,
  double? height,
  double? width,
  Color? btnColor,
  Color? icnColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        // height: height ?? 60,
        width: width ?? 80,
        decoration: BoxDecoration(
          color: btnColor,
        ),
        child: Center(
          child: assetSvgImageWidget(
            image: DefaultImages.deleteIcn,
            height: 25,
            colorFilter: ColorFilter.mode(
              icnColor ?? AppColor.cLabel,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    ),
  );
}
