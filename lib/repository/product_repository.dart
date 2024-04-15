// ignore_for_file: avoid_print

import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';

class ProductRepository {
  Future getProductDetailData(int productID) async {
    var response = await NetworkHttps.postRequest(API.productDetailUrl, {"id": productID});
    print("response---------->$response");
    return response;
  }

  Future addReviewData({
    String? mainCategoryId,
    String? subCategoryId,
    String? productId,
    String? rating,
    String? title,
    String? description,
    String? status,
  }) async {
    var response = await NetworkHttps.postRequest(API.addReviewUrl, {
      'maincategory_id': mainCategoryId,
      'subcategory_id': subCategoryId,
      'product_id': productId,
      'rating_no': rating,
      'title': title,
      'description': description,
      'status': status,
    });
    print("response---------->$response");
    return response;
  }

  Future getProductVariantData({
    int? productID,
    int? qty,
    String? customerId,
    var variantData,
  }) async {
    var response = await NetworkHttps.postRequest(API.variantListUrl, {
      'product_id': productID,
      'variant': variantData,
      'quantity': qty,
      'customer_id': customerId,
    });
    print("response---------->$response");
    return response;
  }
}
