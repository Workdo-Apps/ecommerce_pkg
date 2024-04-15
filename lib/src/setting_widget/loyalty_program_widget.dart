// TODO Implement this library.
// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyLinkDataWidget extends StatelessWidget {
  final String title;
  final Color? cBackground;
  final Color? cBorder;
  final Color? cText;
  final Color? cButton;
  final Color? cBtnText;

  const CopyLinkDataWidget({
    super.key,
    required this.title,
    this.cBackground,
    this.cBorder,
    this.cText,
    this.cButton,
    this.cBtnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: cBackground,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: cBorder!,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: pRegular12.copyWith(
                color: cText,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: title),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: cButton,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text(
                "Copy link",
                style: pMedium12.copyWith(
                  color: cBtnText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoyaltyDataWidget extends StatelessWidget {
  final String? id;
  final String? date;
  final String? amount;
  final Color? cBackground;
  final Color? cBorder;
  final Color? cText;
  final Color? cPriceText;

  const LoyaltyDataWidget({super.key, this.id, this.date, this.amount, this.cBackground, this.cBorder, this.cText, this.cPriceText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          id!,
          style: pMedium16.copyWith(color: cText),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Date: $date",
              style: pRegular12.copyWith(
                color: cText,
              ),
            ),
            Text(
              amount!,
              style: pSemiBold18.copyWith(color: cPriceText),
            )
          ],
        ),
        tileColor: cBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: cBorder!,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
    );
  }
}
