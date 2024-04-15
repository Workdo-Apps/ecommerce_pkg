// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:convert';
import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  Future getUserDetailData({String? userId}) async {
    var response = await NetworkHttps.postRequest(API.userDetailUrl, {"customer_id": userId});
    return response;
  }

  Future updateProfileData({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNo,
  }) async {
    var response = await NetworkHttps.postRequest(API.profileUpdateUrl, {
      "customer_id": userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'telephone': phoneNo,
    });
    return response;
  }

  Future updateImageData({
    required String userId,
    required String imagePath,
  }) async {
    String url = API.baseUrl + API.updateProfileImageUrl;
    Map<String, String> data = {
      'customer_id': userId,
    };
    print("url-->$url");
    print("data-->${jsonEncode(data)}");
    print("dataimagePath-->$imagePath");
    print("accessToken-->${NetworkHttps.accessToken}");
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(data);
    if (imagePath != '') {
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    }
    request.headers.addAll({
      "Authorization": 'Bearer ${NetworkHttps.accessToken}',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.cacheControlHeader: "no-cache",
    });
    print("h-->${request.headers}");

    http.StreamedResponse response = await request.send();
    print("-=-==========statusCode= (${response.statusCode})");

    var responseData = await response.stream.bytesToString();
    print("-=-==========responseData= ($responseData)");
    var decodedData = jsonDecode(responseData);
    print("-=-=------${decodedData['data']}");

    if (response.statusCode == 200) {
      return decodedData;
    } else {
      print(response.reasonPhrase);
    }
  }

  Future changePasswordData({
    String? userId,
    String? password,
  }) async {
    var response = await NetworkHttps.postRequest(API.changePasswordUrl, {
      'customer_id': userId,
      'password': password,
    });
    return response;
  }
}
