// ignore_for_file: avoid_print

import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';

class AddToCartRepository {
  Future addToCartData({String? userId, String? productId, String? variantId, String? qty}) async {
    var response = await NetworkHttps.postRequest(API.addToCartUrl, {
      'customer_id': userId,
      'product_id': productId,
      'variant_id': variantId,
      'qty': qty,
    });
    return response;
  }

  Future getCartData({String? userId}) async {
    var response = await NetworkHttps.postRequest(API.cartListUrl, {
      'customer_id': userId,
    });
    return response;
  }

  Future cartQtyFunction({String? userId, String? productId, String? variantId, int? qtyType}) async {
    print("quantity type------>${quantityType(qtyType!)}");
    var response = await NetworkHttps.postRequest(API.cartQtyUrl, {
      'customer_id': userId,
      'product_id': productId,
      'variant_id': variantId,
      'quantity_type': quantityType(qtyType),
    });
    return response;
  }

  Future appleCouponData({String? couponCode}) async {
    var response = await NetworkHttps.postRequest(API.applyCouponUrl, {'coupon_code': couponCode});
    return response;
  }

  Future getDeliveryData() async {
    var response = await NetworkHttps.postRequest(API.deliveryListUrl, {});
    return response;
  }

  Future getDeliveryChargeData({
    String? countryId,
    String? stateId,
    String? methodId,
  }) async {
    var response = await NetworkHttps.postRequest(API.deliveryChargeUrl, {'country_id': countryId, 'state_id': stateId, 'method_id': methodId});
    return response;
  }

  Future orderSave({
    String? customerId,
    String? paymentType,
    String? paymentComment,
    String? deliveryComment,
    String? deliveryId,
    Map? billingInfo,
    Map? couponInfo,
  }) async {
    var response = await NetworkHttps.postRequest(API.orderSaveUrl, {
      "customer_id": customerId,
      "payment_type": paymentType,
      "delivery_comment": deliveryComment,
      "payment_comment": paymentComment,
      "delivery_id": deliveryId,
      "billing_info": billingInfo,
      "coupon_info": couponInfo
    });
    return response;
  }

  quantityType(int type) {
    switch (type) {
      case 0:
        return 'increase';
        break;
      case 1:
        return 'decrease';
        break;
      case 2:
        return 'remove';
        break;
    }
  }
}
