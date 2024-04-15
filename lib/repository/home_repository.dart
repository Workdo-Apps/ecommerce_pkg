// ignore_for_file: avoid_print

import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';

class HomeRepository {
  getLandingPageData() async {
    var response = await NetworkHttps.postRequest(API.landingPageUrl, {});
    print("response---------->$response");
    return response;
  }

  getProductBannerData() async {
    var response = await NetworkHttps.postRequest(API.productBannerUrl, {});
    print("response---------->$response");
    return response;
  }

  getDiscountProductData({required int pageNo}) async {
    var response = await NetworkHttps.postRequest("${API.discountProductsUrl}${API.pageUrl}$pageNo", {});
    print("response---------->$response");
    return response;
  }

  getFeatureProductData() async {
    var response = await NetworkHttps.postRequest(API.featuredProductsUrl, {});
    print("response---------->$response");
    return response;
  }

  getHomeCategoryData({required int pageNo}) async {
    var response = await NetworkHttps.postRequest("${API.homeCategoryUrl}${API.pageUrl}$pageNo", {});
    print("response---------->$response");
    return response;
  }
  getHomeCategoryProductData({
    required int pageNo,
    String? mainCategoryID,
    String? subCategoryID,
  }) async {
    var response = await NetworkHttps.postRequest("${API.categoryProductsUrl}${API.pageUrl}$pageNo", {"maincategory_id": mainCategoryID, "subcategory_id": subCategoryID});
    print("response---------->$response");
    return response;
  }
  getTrendingCategoryData() async {
    var response = await NetworkHttps.postRequest(API.trendingCategoryUrl, {});
    print("response---------->$response");
    return response;
  }

  getTrendingCategoryProductData({
    required int pageNo,
    String? mainCategoryID,
    String? subCategoryID,
  }) async {
    var response = await NetworkHttps.postRequest("${API.categoryProductsUrl}${API.pageUrl}$pageNo", {"maincategory_id": mainCategoryID, "subcategory_id": subCategoryID});
    print("response---------->$response");
    return response;
  }

  getBestSellerData({required int pageNo}) async {
    var response = await NetworkHttps.postRequest("${API.bestsellerUrl}${API.pageUrl}$pageNo", {});
    print("response---------->$response");
    return response;
  }

  setSubscribeData({String? email}) async {
    var response = await NetworkHttps.postRequest(API.subscribeUrl, {"email": email});
    print("response---------->$response");
    return response;
  }
}
