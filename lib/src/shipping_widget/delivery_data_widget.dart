// TODO Implement this library.

// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class DeliveryDataWidget extends StatelessWidget {
  final dynamic value;
  final Color? bColor;
  final Color? bgColor;
  final Color? fontColor;
  final Color? imageColor;
  final dynamic groupValue;
  final Color? activeColor;
  final void Function(dynamic)? onChanged;
  final String? title;
  final String? subTitle;
  final String? date;
  final String? price;
  final String? image;

  const DeliveryDataWidget({
    super.key,
    this.bgColor,
    this.bColor,
    this.activeColor,
    this.value,
    this.groupValue,
    this.onChanged,
    this.fontColor,
    this.title,
    this.subTitle,
    this.date,
    this.price,
    this.image,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          onChanged!(value);
        },
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: bColor ?? AppColor.cWhite),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Radio(
                            activeColor: activeColor ?? AppColor.cWhite,
                            value: value,
                            groupValue: groupValue,
                            onChanged: onChanged,
                          ),
                        ),
                      ),
                      horizontalSpace(10),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title ?? "",
                              style: pSemiBold16.copyWith(color: fontColor ?? AppColor.cWhite),
                            ),
                            // Text(
                            //   subTitle ?? '',
                            //   style: pRegular10.copyWith(color: fontColor ?? AppColor.cWhite),
                            // ),
                            // date == null ? SizedBox(height: 0) : verticalSpace(10),
                            // date == null
                            //     ? SizedBox(height: 0)
                            //     : Text(
                            //         date!,
                            //         style: pRegular10.copyWith(color: fontColor ?? AppColor.cWhite),
                            //       ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  // Image.network(
                  //   image!,
                  //   height: 50,
                  //   color: imageColor,
                  // ),
                  // price == null
                  //     ? SizedBox(height: 0)
                  //     : Text(
                  //         price!,
                  //         style: pRegular10.copyWith(color: fontColor ?? AppColor.cWhite),
                  //       ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: "Additional price:",
                  //     style: pRegular10.copyWith(color: fontColor ?? AppColor.cWhite),
                  //     children: [
                  //       TextSpan(
                  //         text: price,
                  //         style: pSemiBold10.copyWith(color: fontColor ?? AppColor.cWhite),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //   ],
                  // ),
                ],
              ),
              date == null ? SizedBox(height: 0) : verticalSpace(10),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    date == null
                        ? SizedBox(height: 0)
                        : Text(
                            date!,
                            style: pRegular10.copyWith(color: fontColor ?? AppColor.cWhite),
                          ),
                    price == null
                        ? SizedBox(height: 0)
                        : Text(
                            price!,
                            style: pRegular10.copyWith(color: fontColor ?? AppColor.cWhite),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
