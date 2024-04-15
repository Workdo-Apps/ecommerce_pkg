import 'package:ecommerce_pkg/utils/base_api.dart';
import 'package:ecommerce_pkg/model/city_model.dart';
import 'package:ecommerce_pkg/model/state_model.dart';
import 'package:ecommerce_pkg/model/country_model.dart';
import 'package:ecommerce_pkg/network_dio/network_dio.dart';

class AddressRepository {
  CountryModel? countryModel;
  StateModel? stateModel;
  CityModel? cityModel;

  Future<List<CountryData>?> getCountryData() async {
    var response = await NetworkHttps.postRequest(API.countryListUrl, {});
    if (response != null) {
      if (response['status'] == 1) {
        countryModel = CountryModel.fromJson(response);
        return countryModel!.data;
      }
    }
    return null;
  }

  Future<List<StateData>?> getStateData({int? countryId}) async {
    var response = await NetworkHttps.postRequest(API.stateListUrl, {"country_id": countryId});
    if (response != null) {
      if (response['status'] == 1) {
        stateModel = StateModel.fromJson(response);
        return stateModel!.data;
      }
    }
    return null;
  }

  Future<List<CityData>?> getCityData({int? stateId}) async {
    var response = await NetworkHttps.postRequest(API.cityListUrl, {"state_id": stateId});
    if (response != null) {
      if (response['status'] == 1) {
        cityModel = CityModel.fromJson(response);
        return cityModel!.data;
      }
    }
    return null;
  }

  Future<String?> addAddressData({
    int? userId,
    String? title,
    String? address,
    String? countryId,
    String? stateId,
    String? cityId,
    String? postcode,
    String? defaultAddress,
  }) async {
    var response = await NetworkHttps.postRequest(API.addAddressUrl,
        {'customer_id': userId, 'title': title, 'address': address, 'country': countryId, 'state': stateId, 'city': cityId, 'postcode': postcode, 'default_address': defaultAddress});
    if (response != null) {
      if (response['status'] == 1) {
        return response['message'];
      }
    }
    return null;
  }

  Future<String?> updateAddressData({
    int? addressId,
    int? userId,
    String? title,
    String? address,
    String? countryId,
    String? stateId,
    String? cityId,
    String? postcode,
    String? defaultAddress,
  }) async {
    var response = await NetworkHttps.postRequest(API.updateAddressUrl, {
      'address_id': addressId,
      'customer_id': userId,
      'title': title,
      'address': address,
      'country': countryId,
      'state': stateId,
      'city': cityId,
      'postcode': postcode,
      'default_address': defaultAddress
    });
    if (response != null) {
      if (response['status'] == 1) {
        return response['message'];
      }
    }
    return null;
  }

  Future deleteAddressData({int? addressId}) async {
    var response = await NetworkHttps.postRequest(API.deleteAddressUrl, {"address_id": addressId});
    return response;
  }

  Future getAllAddressData({String? userId, int? pageNo}) async {
    var response = await NetworkHttps.postRequest("${API.addressListUrl}${API.pageUrl}$pageNo", {"customer_id": userId});
    return response;
  }
}
