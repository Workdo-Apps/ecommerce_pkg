// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

Widget assetSvgImageWidget({
  String? image,
  double? width,
  double? height,
  Color? color,
  BoxFit? fit,
  final ColorFilter? colorFilter,
  Clip clipBehavior = Clip.hardEdge,
}) =>
    SvgPicture.asset(
      image!,
      fit: fit ?? BoxFit.contain,
      height: height,
      width: width,
      color: color,
      colorFilter: colorFilter,
      clipBehavior: clipBehavior,
    );

Widget buildCachedNetworkImage({
  required String imageUrl,
  double? height,
  double? width,
  BoxFit? fit,
  Color? cIndicator,
  Color? imageColor,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    height: height,
    width: width,
    color: imageColor,
    fit: fit ?? BoxFit.fill,
    placeholder: (context, url) => SizedBox(
      height: 10,
      width: 10,
      child: CircularProgressIndicator(
        color: cIndicator,
        strokeWidth: 0.8,
      ),
    ),
    // errorWidget: (context, url, error) => Icon(Icons.error),
    errorWidget: (context, url, error) => Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage("https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG.png"),
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
