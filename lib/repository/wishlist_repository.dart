// ignore_for_file: avoid_print

import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';

class WishListRepository {
  addToWishList({
    String? customerId,
    String? productId,
    String? variantId,
    bool? isWishlist,
  }) async {
    String message = '';

    String wishlistType = isWishlist == true ? "add" : "remove";
    var response = await NetworkHttps.postRequest(API.addWishlistUrl, {'customer_id': customerId, 'product_id': productId, 'variant_id': variantId, 'wishlist_type': wishlistType});
    if (response != null) {
      if (response['status'] == 1) {
        message = response['message'];
      }
      message = response['message'];
    }
    print("🩶message--->$message");
    return message;
  }

  getWishListData({
    int? customerId,
    int? pageNo,
  }) async {
    var response = await NetworkHttps.postRequest("${API.wishlistUrl}${API.pageUrl}$pageNo", {"customer_id": customerId});
    return response;
  }
}
