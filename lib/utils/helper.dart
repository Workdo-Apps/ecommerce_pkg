// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String parseHtmlString(String? htmlString) {
  var document = parse(htmlString);
  return parse(document.body!.text).documentElement!.text;
}

Future<void> launchWebUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Future getFcmToken() async {
  if (Platform.isIOS) {
    var token = await FirebaseMessaging.instance.getAPNSToken();
    final deviceToken = token;
    final deviceType = Platform.operatingSystem;
    Map data = {
      "device_token": deviceToken,
      "device_type": deviceType,
    };
    print("iOS type---->$data");
    return data;
  } else {
    var token = await FirebaseMessaging.instance.getToken();
    final deviceToken = token!;
    final deviceType = Platform.operatingSystem;

    Map data = {
      "device_token": deviceToken,
      "device_type": deviceType,
    };
    print("Type---->$data");
    return data;
  }
}
DateTime parseDateTime(String strDate) => DateTime.parse(strDate);

DateFormat formatDateTime(String format) => DateFormat(format);

String dateFormatted({required String date, required String formatType}) =>
    formatDateTime(formatType).format(parseDateTime(date));

enum FormatType {
  dateTime,
  date,
  time,
  ddMMMYYYY,
}

String formatForDateTime(FormatType formatType) {
  switch (formatType) {
    case FormatType.date:
      {
        return "MMM dd ,yyyy";
      }
    case FormatType.dateTime:
      {
        return "dd-MM-yyyy hh:mm a";
      }
    case FormatType.time:
      {
        return "hh:mm a";
      }
    case FormatType.ddMMMYYYY:
      {
        return "dd MMM,yyyy";
      }
    default:
      {
        return "";
      }
  }
}