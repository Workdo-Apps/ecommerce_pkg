import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';

class SearchRepository {
  Future getTagList() async {
    var response = await NetworkHttps.postRequest(API.tagListUrl,{});
    return response;
  }

  Future searchProductData({
    int? pageNo,
    String? title,
  }) async {
    var response = await NetworkHttps.postRequest("${API.searchUrl}${API.pageUrl}$pageNo", {"type": "product_search", "name": title});
    return response;
  }

  Future searchFilterProductData({
    int? pageNo,
    String? mainCategoryId,
    String? minPrice,
    String? maxPrice,
    String? rating,
  }) async {
    var response = await NetworkHttps.postRequest("${API.searchUrl}${API.pageUrl}$pageNo", {
      "type": "product_filter",
      "tag": mainCategoryId,
      "min_price": minPrice,
      "max_price": maxPrice,
      "rating": rating,
    });
    return response;
  }
}