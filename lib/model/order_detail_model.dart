// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) => OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) => json.encode(data.toJson());

class OrderDetailModel {
  int? maxPrice;
  int? status;
  String? message;
  OrderDetail? data;

  OrderDetailModel({
    this.maxPrice,
    this.status,
    this.message,
    this.data,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    maxPrice: json["max_price"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : OrderDetail.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "max_price": maxPrice,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class OrderDetail {
  int? id;
  int? isGuest;
  String? orderId;
  dynamic deliveryDate;
  int? orderRewardPoint;
  int? returnPrice;
  dynamic returnStatusMessage;
  DateTime? returnDate;
  String? orderStatusText;
  int? orderStatus;
  String? orderStatusMessage;
  String? paymentStatus;
  dynamic deliveryboyId;
  List<OrderItem>? product;
  int? isReview;
  Informations? billingInformations;
  Informations? deliveryInformations;
  String? paymnetType;
  String? paymnet;
  String? delivery;
  String? deliveredCharge;
  dynamic couponInfo;
  Tax? tax;
  String? subTotal;
  String? finalPrice;
  String? taxPrice;
  String? taxName;
  int? taxRate;
  String? taxType;
  int? taxId;

  OrderDetail({
    this.id,
    this.isGuest,
    this.orderId,
    this.deliveryDate,
    this.orderRewardPoint,
    this.returnPrice,
    this.returnStatusMessage,
    this.returnDate,
    this.orderStatusText,
    this.orderStatus,
    this.orderStatusMessage,
    this.paymentStatus,
    this.deliveryboyId,
    this.product,
    this.isReview,
    this.billingInformations,
    this.deliveryInformations,
    this.paymnetType,
    this.paymnet,
    this.delivery,
    this.deliveredCharge,
    this.couponInfo,
    this.tax,
    this.subTotal,
    this.finalPrice,
    this.taxPrice,
    this.taxName,
    this.taxRate,
    this.taxType,
    this.taxId,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["id"],
    isGuest: json["is_guest"],
    orderId: json["order_id"],
    deliveryDate: json["delivery_date"],
    orderRewardPoint: json["order_reward_point"],
    returnPrice: json["return_price"],
    returnStatusMessage: json["return_status_message"],
    returnDate: json["return_date"] == null ? null : DateTime.parse(json["return_date"]),
    orderStatusText: json["order_status_text"],
    orderStatus: json["order_status"],
    orderStatusMessage: json["order_status_message"],
    paymentStatus: json["payment_status"],
    deliveryboyId: json["deliveryboy_id"],
    product: json["product"] == null ? [] : List<OrderItem>.from(json["product"]!.map((x) => OrderItem.fromJson(x))),
    isReview: json["is_review"],
    billingInformations: json["billing_informations"] == null ? null : Informations.fromJson(json["billing_informations"]),
    deliveryInformations: json["delivery_informations"] == null ? null : Informations.fromJson(json["delivery_informations"]),
    paymnetType: json["paymnet_type"],
    paymnet: json["paymnet"],
    delivery: json["delivery"],
    deliveredCharge: json["delivered_charge"],
    couponInfo: json["coupon_info"],
    tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
    subTotal: json["sub_total"],
    finalPrice: json["final_price"],
    taxPrice: json["tax_price"],
    taxName: json["tax_name"],
    taxRate: json["tax_rate"],
    taxType: json["tax_type"],
    taxId: json["tax_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_guest": isGuest,
    "order_id": orderId,
    "delivery_date": deliveryDate,
    "order_reward_point": orderRewardPoint,
    "return_price": returnPrice,
    "return_status_message": returnStatusMessage,
    "return_date": "${returnDate!.year.toString().padLeft(4, '0')}-${returnDate!.month.toString().padLeft(2, '0')}-${returnDate!.day.toString().padLeft(2, '0')}",
    "order_status_text": orderStatusText,
    "order_status": orderStatus,
    "order_status_message": orderStatusMessage,
    "payment_status": paymentStatus,
    "deliveryboy_id": deliveryboyId,
    "product": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
    "is_review": isReview,
    "billing_informations": billingInformations?.toJson(),
    "delivery_informations": deliveryInformations?.toJson(),
    "paymnet_type": paymnetType,
    "paymnet": paymnet,
    "delivery": delivery,
    "delivered_charge": deliveredCharge,
    "coupon_info": couponInfo,
    "tax": tax?.toJson(),
    "sub_total": subTotal,
    "final_price": finalPrice,
    "tax_price": taxPrice,
    "tax_name": taxName,
    "tax_rate": taxRate,
    "tax_type": taxType,
    "tax_id": taxId,
  };
}

class Informations {
  String? name;
  String? address;
  String? state;
  String? country;
  String? city;
  String? postCode;
  String? email;
  String? phone;

  Informations({
    this.name,
    this.address,
    this.state,
    this.country,
    this.city,
    this.postCode,
    this.email,
    this.phone,
  });

  factory Informations.fromJson(Map<String, dynamic> json) => Informations(
    name: json["name"],
    address: json["address"],
    state: json["state"],
    country: json["country"],
    city: json["city"],
    postCode: json["post_code"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "state": state,
    "country": country,
    "city": city,
    "post_code": postCode,
    "email": email,
    "phone": phone,
  };
}

class OrderItem {
  int? productId;
  String? image;
  String? name;
  String? orignalPrice;
  String? totalOrignalPrice;
  String? finalPrice;
  int? qty;
  int? variantId;
  String? variantName;
  int? productReturn;

  OrderItem({
    this.productId,
    this.image,
    this.name,
    this.orignalPrice,
    this.totalOrignalPrice,
    this.finalPrice,
    this.qty,
    this.variantId,
    this.variantName,
    this.productReturn,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    productId: json["product_id"],
    image: json["image"],
    name: json["name"],
    orignalPrice: json["orignal_price"],
    totalOrignalPrice: json["total_orignal_price"],
    finalPrice: json["final_price"],
    qty: json["qty"],
    variantId: json["variant_id"],
    variantName: json["variant_name"],
    productReturn: json["return"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "image": image,
    "name": name,
    "orignal_price": orignalPrice,
    "total_orignal_price": totalOrignalPrice,
    "final_price": finalPrice,
    "qty": qty,
    "variant_id": variantId,
    "variant_name": variantName,
    "return": productReturn,
  };
}

class Tax {
  int? amountString;

  Tax({
    this.amountString,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    amountString: json["amountstring"],
  );

  Map<String, dynamic> toJson() => {
    "amountstring": amountString,
  };
}
