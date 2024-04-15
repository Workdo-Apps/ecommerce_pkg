// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> commonToast(
  String msg, {
  Color? bgColor,
  Color? labelColor,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: bgColor ?? Colors.white,
    textColor: labelColor ?? Colors.black,
    fontSize: 16.0,
  );
}
