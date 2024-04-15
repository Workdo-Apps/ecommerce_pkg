import 'package:flutter/material.dart';
import 'package:ecommerce_pkg/utils/colors.dart';
import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:ecommerce_pkg/widget/common_space_divider_widget.dart';

class AddressInfoWidget extends StatelessWidget {
  final Color? cFont;
  final String? title1;
  final String? title2;
  final String? name1;
  final String? name2;
  final String? address1;
  final String? address2;
  final String? email1;
  final String? email2;
  final String? phone1;
  final String? phone2;

  const AddressInfoWidget({
    super.key,
    this.cFont,
    this.title1,
    this.title2,
    this.name1,
    this.name2,
    this.address1,
    this.address2,
    this.email1,
    this.email2,
    this.phone1,
    this.phone2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        informationWidget(
          title1: title1 ?? "Billing information:",
          title2: title2 ?? "Delivery information:",
          textStyle: pSemiBold16.copyWith(
            color: cFont ?? AppColor.cWhite,
          ),
        ),
        verticalSpace(8),
        informationWidget(
          cText: cFont,
          title1: name1,
          title2: name2,
        ),
        informationWidget(
          cText: cFont,
          title1: address1,
          title2: address2,
        ),
        verticalSpace(8),
        informationWidget(
          cText: cFont,
          title1: "Email: $email1",
          title2: "Email: $email2",
        ),
        informationWidget(
          cText: cFont,
          title1: "Phone: $phone1",
          title2: "Phone: $phone2",
        ),
      ],
    );
  }

  Widget informationWidget({String? title1, String? title2, TextStyle? textStyle, Color? cText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title1!,
              style: textStyle ??
                  pRegular14.copyWith(
                    color: cText ?? AppColor.cWhite,
                  ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Text(
              title2!,
              style: textStyle ??
                  pRegular14.copyWith(
                    color: cText ?? AppColor.cWhite,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
