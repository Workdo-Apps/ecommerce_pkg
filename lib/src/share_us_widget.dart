// TODO Implement this library.

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/images.dart';
import 'package:ecommerce_pkg/utils/helper.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/icon_and_image.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class ShareUsWidget extends StatelessWidget {
  final Color? titleColor;
  final String? youtubeImage;
  final String? messengerImage;
  final String? instagramImage;
  final String? twitterImage;
  final String? youtubeLink;
  final String? messengerLink;
  final String? instagramLink;
  final String? twitterLink;

  const ShareUsWidget({
    super.key,
    this.titleColor,
    this.youtubeImage,
    this.messengerImage,
    this.instagramImage,
    this.twitterImage,
    this.youtubeLink,
    this.messengerLink,
    this.instagramLink,
    this.twitterLink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Share us,be us",
                    style: pSemiBold14.copyWith(color: titleColor ?? AppColor.cWhite),
                  ),
                  verticalSpace(16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchWebUrl(youtubeLink!);
                        },
                        child: assetSvgImageWidget(
                          image: youtubeImage,
                        ),
                      ),
                      horizontalSpace(10),
                      GestureDetector(
                        onTap: () {
                          launchWebUrl(messengerLink!);
                        },
                        child: assetSvgImageWidget(
                          image: messengerImage,
                        ),
                      ),
                      horizontalSpace(10),
                      GestureDetector(
                        onTap: () {
                          launchWebUrl(instagramLink!);
                        },
                        child: assetSvgImageWidget(
                          image: instagramImage,
                        ),
                      ),
                      horizontalSpace(10),
                      GestureDetector(
                        onTap: () {
                          launchWebUrl(twitterLink!);
                        },
                        child: assetSvgImageWidget(
                          image: twitterImage,
                        ),
                      ),
                      horizontalSpace(10),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    assetSvgImageWidget(
                      image: DefaultImages.closeIcn,
                      colorFilter: ColorFilter.mode(titleColor ?? AppColor.cWhite, BlendMode.srcIn),
                    ),
                    horizontalSpace(16),
                    Text(
                      'Back',
                      style: pMedium12.copyWith(color: titleColor ?? AppColor.cWhite),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
