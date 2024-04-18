// ignore_for_file: avoid_print

import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/widget/common_toast.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

class AuthRepository {
  Future getBaseUrlData({
    required String siteUrl,
    required String storeName,
  }) async {
    var url = Uri.parse(siteUrl + API.apiUrl + storeName);
    print("url------->$url");
    var response = await http.post(url);
    print('Response status: ${response.statusCode}');
    print('Response body-----?: ${response.body}');
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decoded;
    } else {
      print("===err============  ${decoded["message"]}");
      commonToast(decoded["message"]);
    }
  }

  Future getCurrencyData() async {
    var url = Uri.parse(API.baseUrl + API.currencyUrl);
    print("url------->$url");
    var response = await http.post(url);
    print('Response status: ${response.statusCode}');
    print('Response body-----?: ${response.body}');
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decoded;
    } else {
      print("===err============  ${decoded["message"]}");
      commonToast(decoded["message"]);
    }
  }

  Future loginData({
    // required String storeName,
    String? email,
    String? password,
    String? googleId,
    String? faceBookId,
    String? appleId,
    String? token,
    String? deviceType,
  }) async {
    var url = Uri.parse(API.baseUrl + API.loginUrl);
    print("----------------${email.toString().isNotEmpty}");
    Map data = email != null
        ? {'email': email, 'password': password, 'google_id': googleId, 'facebook_id': faceBookId, 'apple_id': appleId, 'device_type': deviceType}
        : {'google_id': googleId ?? '', 'facebook_id': faceBookId ?? '', 'apple_id': appleId ?? '', 'device_type': deviceType};
    print("===url============$url\n data===> ${json.encode(data)}");
    var response = await http.post(url, body: json.encode(data), headers: NetworkHttps.headers);
    print('Response status: ${response.statusCode}');
    print('Response body-----?: ${response.body}');
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decoded;
    } else {
      print("===err============  ${decoded["message"]}");
      commonToast(decoded["message"]);
    }
  }

  Future registerData({
    // required String storeName,
    String? firstName,
    String? email,
    String? password,
    String? mobile,
    String? deviceType,
    String? registerType,
    String? googleId,
    String? faceBookId,
    String? appleId,
    String? token,
  }) async {
    var url = Uri.parse(API.baseUrl + API.registerUrl);
    Map data = {
      'first_name': firstName,
      'email': email,
      'password': password ?? '',
      'mobile': mobile ?? '',
      'device_type': deviceType ?? '',
      'register_type': registerType ?? '',
      'google_id': googleId ?? '',
      'facebook_id': faceBookId ?? '',
      'apple_id': appleId ?? '',
      'token': token ?? ''
    };
    print("===url============$url\n data===> ${json.encode(data)}");
    var response = await http.post(url, body: json.encode(data), headers: NetworkHttps.headers);
    print('Response status: ${response.statusCode}');
    log('Response body-----?: ${response.body}');
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decoded;
    } else {
      print("===err============  ${decoded["message"]}");
      commonToast(decoded["message"]);
    }
  }

  Future sendOtpData({/*required String storeName,*/ String? email}) async {
    var url = Uri.parse(API.baseUrl + API.forgotPasswordSendOtpUrl);
    Map data = {'email': email};
    print("===url============$url\n data===> ${json.encode(data)}");
    var response = await http.post(url, body: json.encode(data), headers: NetworkHttps.headers);
    print('Response status: ${response.statusCode}');
    print('Response body-----?: ${response.body}');
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decoded;
    } else {
      print("===err============  ${decoded["message"]}");
      commonToast(decoded["message"]);
    }
  }

  Future verifyOtpData({/*required String storeName,*/ String? email, String? otp}) async {
    var url = Uri.parse(API.baseUrl + API.forgotPasswordVerifyOtpUrl);
    Map data = {'email': email, "otp": otp};
    print("===url============$url\n data===> ${json.encode(data)}");
    var response = await http.post(url, body: json.encode(data), headers: NetworkHttps.headers);
    print('Response status: ${response.statusCode}');
    print('Response body-----?: ${response.body}');
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decoded;
    } else {
      print("===err============  ${decoded["message"]}");
      commonToast(decoded["message"]);
    }
  }

  Future logoutData({String? userId}) async {
    var response = await NetworkHttps.postRequest(API.logoutUrl, {'user_id': userId});
    return response;
  }
}
