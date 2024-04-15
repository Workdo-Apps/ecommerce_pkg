// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, unnecessary_brace_in_string_interps

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce_pkg/utils/base_api.dart';
import 'package:ecommerce_pkg/widget/common_toast.dart';

class NetworkHttps {
  static String accessToken = '';

  NetworkHttps._privateConstructor();

  static final NetworkHttps getInstance = NetworkHttps._privateConstructor();
  static final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    HttpHeaders.cacheControlHeader: "no-cache",
  };

  static Future getRequest(String endPoint) async {
    var getUrl = API.baseUrl + endPoint;
    print("GET API URL===> $getUrl");
    print("authHeaders===>${accessToken}");
    try {
      var response = await http.get(Uri.parse(getUrl), headers: {"Authorization": 'Bearer ${accessToken}', 'Accept': 'application/json', HttpHeaders.contentTypeHeader: "application/json"});
      print("statusCode===> ${response.statusCode}");
      print("response body===> ${response.body}");
      // return response;
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        // await Prefs.clear();
        // Get.offAll(() => AuthScreen());
      }
      _handleError(response);
    } on Exception catch (e) {
      print("err->${e.toString()}");
      // commonToast("No Internet connection.");
      throw Exception('No Internet connection.');
    }
  }

  static Future postRequest(String endPoint, Map data) async {
    String postUrl = API.baseUrl + endPoint;
    print("POST API URL===> $postUrl");
    print("data===> ${jsonEncode(data)}");
    print("accessToken===>${accessToken}");
    try {
      var response = await http
          .post(Uri.parse(postUrl), body: jsonEncode(data), headers: {"Authorization": 'Bearer ${accessToken}', 'Accept': 'application/json', HttpHeaders.contentTypeHeader: "application/json"});
      print("statusCode===> ${response.statusCode}");
      print("response body===> ${response.body}");
      print("response c===> ${response.statusCode == 200 || response.statusCode == 201}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        accessToken = '';
      }
      _handleError(response);
    } on Exception catch (e) {
      print("err->${e.toString()}");

      // commonToast("No Internet connection.");
      throw Exception('No Internet connection.---->${e.toString()}');
    }
  }

  static Future deleteRequest(String endPoint) async {
    String deleteUrl = API.baseUrl + endPoint;

    print(" delete API URL===> $deleteUrl");
    try {
      var response = await http.delete(Uri.parse(deleteUrl), headers: {
        "Authorization": 'Bearer ${accessToken}',
        'Accept': 'application/json',
        HttpHeaders.cacheControlHeader: "no-cache",
      });
      print("statusCode===> ${response.statusCode}");
      print("response body===> ${response.body}");
      print("response c===> ${response.statusCode == 200 || response.statusCode == 201}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        // await Prefs.clear();
        // Get.offAll(() => AuthScreen());
      }
      _handleError(response);
    } on Exception catch (e) {
      commonToast("err->${e.toString()}");
      throw Exception("err->${e.toString()}");
    }
  }

  static Exception _handleError(http.Response response) {
    switch (response.statusCode) {
      case 400:
      case 401:
      case 404:
      case 500:
        commonToast(json.decode(response.body)['message'].toString());
        throw Exception(json.decode(response.body).toString());
      default:
        throw Exception("An error occurred, status code: ${response.statusCode}");
    }
  }
}
