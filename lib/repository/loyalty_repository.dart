import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';

class LoyaltyRepository {
  Future getLoyaltyData(int pageNo) async {
    var response = await NetworkHttps.postRequest("${API.loyaltyProgramJsonUrl}${API.pageUrl}$pageNo", {});
    return response;
  }
}
