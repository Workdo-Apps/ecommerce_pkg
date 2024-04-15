// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromJson(jsonString);

import 'dart:convert';

CartItemModel cartItemModelFromJson(String str) => CartItemModel.fromJson(json.decode(str));

String cartItemModelToJson(CartItemModel data) => json.encode(data.toJson());

class CartItemModel {
  int? maxPrice;
  int? status;
  String? message;
  CartData? data;

  CartItemModel({
    this.maxPrice,
    this.status,
    this.message,
    this.data,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    maxPrice: json["max_price"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : CartData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "max_price": maxPrice,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class CartData {
  List<CartItem>? productList;
  int? productDiscountPrice;
  int? subTotal;
  CouponInfo? couponInfo;
  String? taxPrice;
  String? totalTaxPrice;
  String? taxId;
  String? taxRate;
  String? taxType;
  String? taxName;
  int? cartTotalProduct;
  int? cartTotalQty;
  String? originalPrice;
  String? totalFinalPrice;
  String? finalPrice;
  String? totalSubPrice;
  String? totalCouponPrice;
  String? shippingOriginalPrice;
  dynamic couponCode;

  CartData({
    this.productList,
    this.productDiscountPrice,
    this.subTotal,
    this.couponInfo,
    this.taxPrice,
    this.totalTaxPrice,
    this.taxId,
    this.taxRate,
    this.taxType,
    this.taxName,
    this.cartTotalProduct,
    this.cartTotalQty,
    this.originalPrice,
    this.totalFinalPrice,
    this.finalPrice,
    this.totalSubPrice,
    this.totalCouponPrice,
    this.shippingOriginalPrice,
    this.couponCode,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
    productList: json["product_list"] == null ? [] : List<CartItem>.from(json["product_list"]!.map((x) => CartItem.fromJson(x))),
    productDiscountPrice: json["product_discount_price"],
    subTotal: json["sub_total"],
    couponInfo: json["coupon_info"] == null ? null : CouponInfo.fromJson(json["coupon_info"]),
    taxPrice: json["tax_price"],
    totalTaxPrice: json["total_tax_price"],
    taxId: json["tax_id"].toString(),
    taxRate: json["tax_rate"].toString(),
    taxType: json["tax_type"].toString(),
    taxName: json["tax_name"],
    cartTotalProduct: json["cart_total_product"],
    cartTotalQty: json["cart_total_qty"],
    originalPrice: json["original_price"],
    totalFinalPrice: json["total_final_price"],
    finalPrice: json["final_price"],
    totalSubPrice: json["total_sub_price"],
    totalCouponPrice: json["total_coupon_price"].toString(),
    shippingOriginalPrice: json["shipping_original_price"].toString(),
    couponCode: json["coupon_code"],
  );

  Map<String, dynamic> toJson() => {
    "product_list": productList == null ? [] : List<dynamic>.from(productList!.map((x) => x.toJson())),
    "product_discount_price": productDiscountPrice,
    "sub_total": subTotal,
    "coupon_info": couponInfo?.toJson(),
    "tax_price": taxPrice,
    "total_tax_price": totalTaxPrice,
    "tax_id": taxId,
    "tax_rate": taxRate,
    "tax_type": taxType,
    "tax_name": taxName,
    "cart_total_product": cartTotalProduct,
    "cart_total_qty": cartTotalQty,
    "original_price": originalPrice,
    "total_final_price": totalFinalPrice,
    "final_price": finalPrice,
    "total_sub_price": totalSubPrice,
    "total_coupon_price": totalCouponPrice,
    "shipping_original_price": shippingOriginalPrice,
    "coupon_code": couponCode,
  };
}
class CouponInfo {
  int? couponId;
  String? couponName;
  String? couponCode;
  String? couponDiscountType;
  String? couponDiscountNumber;
  String? couponDiscountAmount;
  String? couponFinalAmount;

  CouponInfo({
    this.couponId,
    this.couponName,
    this.couponCode,
    this.couponDiscountType,
    this.couponDiscountNumber,
    this.couponDiscountAmount,
    this.couponFinalAmount,
  });

  factory CouponInfo.fromJson(Map<String, dynamic> json) => CouponInfo(
    couponId: json["coupon_id"],
    couponName: json["coupon_name"],
    couponCode: json["coupon_code"],
    couponDiscountType: json["coupon_discount_type"],
    couponDiscountNumber: json["coupon_discount_number"],
    couponDiscountAmount: json["coupon_discount_amount"],
    couponFinalAmount: json["coupon_final_amount"],
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": couponId,
    "coupon_name": couponName,
    "coupon_code": couponCode,
    "coupon_discount_type": couponDiscountType,
    "coupon_discount_number": couponDiscountNumber,
    "coupon_discount_amount": couponDiscountAmount,
    "coupon_final_amount": couponFinalAmount,
  };
}

class CartItem {
  int? cartId;
  DateTime? cartCreated;
  int? productId;
  String? image;
  String? name;
  String? originalPrice;
  String? totalOriginalPrice;
  String? perProductDiscountPrice;
  String? discountPrice;
  String? finalPrice;
  int? qty;
  int? variantId;
  String? variantName;
  int? productListReturn;
  String? shippingPrice;

  CartItem({
    this.cartId,
    this.cartCreated,
    this.productId,
    this.image,
    this.name,
    this.originalPrice,
    this.totalOriginalPrice,
    this.perProductDiscountPrice,
    this.discountPrice,
    this.finalPrice,
    this.qty,
    this.variantId,
    this.variantName,
    this.productListReturn,
    this.shippingPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    cartId: json["cart_id"],
    cartCreated: json["cart_created"] == null ? null : DateTime.parse(json["cart_created"]),
    productId: json["product_id"],
    image: json["image"],
    name: json["name"],
    originalPrice: json["orignal_price"],
    totalOriginalPrice: json["total_orignal_price"],
    perProductDiscountPrice: json["per_product_discount_price"],
    discountPrice: json["discount_price"],
    finalPrice: json["final_price"],
    qty: json["qty"],
    variantId: json["variant_id"],
    variantName: json["variant_name"],
    productListReturn: json["return"],
    shippingPrice: json["shipping_price"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "cart_created": cartCreated?.toIso8601String(),
    "product_id": productId,
    "image": image,
    "name": name,
    "orignal_price": originalPrice,
    "total_orignal_price": totalOriginalPrice,
    "per_product_discount_price": perProductDiscountPrice,
    "discount_price": discountPrice,
    "final_price": finalPrice,
    "qty": qty,
    "variant_id": variantId,
    "variant_name": variantName,
    "return": productListReturn,
    "shipping_price": shippingPrice,
  };
}
