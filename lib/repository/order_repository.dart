import 'package:ecommerce_pkg/network_dio/network_dio.dart';
import 'package:ecommerce_pkg/utils/base_api.dart';

class OrderRepository {
  Future getOrderData({String? userId, int? pageNo}) async {
    var response = await NetworkHttps.postRequest("${API.orderListUrl}${API.pageUrl}$pageNo", {
      'customer_id': userId,
    });
    return response;
  }

  Future getOrderDetailData({String? orderId}) async {
    var response = await NetworkHttps.postRequest(API.orderDetailUrl, {
      'order_id': orderId,
    });
    return response;
  }

  Future getReturnOrderData({String? userId, int? pageNo}) async {
    var response = await NetworkHttps.postRequest("${API.returnOrderDetailUrl}${API.pageUrl}$pageNo", {
      'customer_id': userId,
    });
    return response;
  }

  Future productReturnData({
    String? orderId,
    String? productId,
    String? variantId,
  }) async {
    var response = await NetworkHttps.postRequest(API.productReturnUrl, {
      'order_id': orderId,
      'product_id': productId,
      'variant_id': variantId,
    });
    return response;
  }

  Future cancelOrderData({String? orderId}) async {
    var response = await NetworkHttps.postRequest(API.orderCancelUrl, {
      'order_id': orderId,
    });
    return response;
  }
}
