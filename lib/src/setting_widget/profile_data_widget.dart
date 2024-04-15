// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/icons.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/images.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/common_button/common_button.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class ProfileDataWidget extends StatelessWidget {
  final Color? bColor;
  final Color? bgColor;
  final Color? btnColor;
  final Color? textColor;
  final Color? btnTextColor;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? selectedImagePath;
  final Function()? btnTap;
  final Function()? cameraTap;
  final Function()? galleryTap;

  const ProfileDataWidget({
    super.key,
    this.name,
    this.email,
    this.bColor,
    this.btnTap,
    this.bgColor,
    this.btnColor,
    this.textColor,
    this.cameraTap,
    this.galleryTap,
    this.btnTextColor,
    this.profileImage,
    this.selectedImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: bColor ?? AppColor.cWhite),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Choose", style: pMedium16),
                    // contentPadding: EdgeInsets.zero,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        imageSourceWidget(
                          title: "Camera",
                          icon: icnCameraAlt,
                          onTap: cameraTap,
                        ),
                        horizontalSpace(10),
                        imageSourceWidget(
                          title: "Gallery",
                          icon: icnPhoto,
                          onTap: galleryTap,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: pMedium16,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: AppColor.cWhite,
                image: DecorationImage(
                  image: profileImage!.isNotEmpty
                      ? NetworkImage(profileImage!)
                      : selectedImagePath!.isNotEmpty
                          ? FileImage(
                              File(selectedImagePath!),
                            )
                          : AssetImage(
                              DefaultImages.profileImage,
                            ) as ImageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: pMedium18.copyWith(
                    fontSize: 20,
                    color: textColor,
                  ),
                ),
                verticalSpace(2),
                Text(
                  email!,
                  style: pRegular12.copyWith(color: textColor),
                ),
                verticalSpace(8),
                CommonButton(
                  title: 'Edit my profile',
                  onPressed: btnTap,
                  height: 30,
                  width: 120,
                  radius: 8,
                  btnColor: btnColor,
                  textColor: btnTextColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget imageSourceWidget({
  Function()? onTap,
  IconData? icon,
  String? title,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColor.cGreyFont, size: 40),
        Text(title!, style: pMedium24.copyWith(color: AppColor.cGreyFont, fontSize: 22)),
      ],
    ),
  );
}
