// TODO Implement this library.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/icons.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/images.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';

class AddressDataWidget extends StatelessWidget {
  final int? index;
  final Function()? deleteTap;
  final Function()? onTap;
  final String? title;
  final String? subTitle;
  final Color? boxColor;
  final Color? cText;
  final Color? cBorder;
  final Color? cBackGround;
  final Color? cIcon;

  const AddressDataWidget({
    super.key,
    this.index,
    this.deleteTap,
    this.onTap,
    this.title,
    this.subTitle,
    this.boxColor,
    this.cText,
    this.cBorder,
    this.cBackGround,
    this.cIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Slidable(
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 85,
                width: 85,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: boxColor,
                  // borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icnEye, color: cIcon ?? AppColor.cLabel),
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
                      cIcon ?? AppColor.cLabel,
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
          child: ListTile(
            tileColor: cBackGround,
            title: Text(
              title!,
              style: pMedium14.copyWith(color: cText ?? AppColor.cWhite),
            ),
            subtitle: Text(
              subTitle!,
              style: pMedium12.copyWith(color: cText ?? AppColor.cWhite),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: cBorder ?? AppColor.cWhite),
            ),
          ),
        ),
      ),
    );
  }
}
