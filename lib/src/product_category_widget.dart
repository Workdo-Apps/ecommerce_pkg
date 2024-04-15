// TODO Implement this library.

// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_pkg/utils/text_style.dart';
import 'package:flutter/material.dart';

class ProductCategoryWidget extends StatelessWidget {
  final String? image;
  final String? title;
  final Color? cText;
  final Color? cImage;
  final Color? cBorder;
  final Color? cBackground;

  const ProductCategoryWidget({
    super.key,
    this.image,
    this.title,
    this.cText,
    this.cImage,
    this.cBorder,
    this.cBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          color: cBackground,
          border: Border.all(
            color: cBorder!,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == ''
                ? SizedBox()
                : Image.network(
                    image!,
                    width: 35,
                    height: 35,
                    color: cImage,
                  ),
            Text(
              title!,
              style: pSemiBold12.copyWith(
                color: cText,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
