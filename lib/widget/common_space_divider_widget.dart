import 'package:flutter/material.dart';

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget horizontalDivider({Color? color}) {
  return Divider(
    color: color,
    thickness: 1,
  );
}
