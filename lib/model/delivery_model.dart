// To parse this JSON data, do
//
//     final deliveryModel = deliveryModelFromJson(jsonString);

import 'dart:convert';

DeliveryModel deliveryModelFromJson(String str) => DeliveryModel.fromJson(json.decode(str));

String deliveryModelToJson(DeliveryModel data) => json.encode(data.toJson());

class DeliveryModel {
  int? maxPrice;
  int? status;
  String? message;
  List<DeliveryData>? data;

  DeliveryModel({
    this.maxPrice,
    this.status,
    this.message,
    this.data,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
    maxPrice: json["max_price"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DeliveryData>.from(json["data"]!.map((x) => DeliveryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "max_price": maxPrice,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DeliveryData {
  int? id;
  String? methodName;
  int? zoneId;
  String? cost;
  dynamic productCost;
  dynamic calculationType;
  dynamic shippingRequires;
  String? themeId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;

  DeliveryData({
    this.id,
    this.methodName,
    this.zoneId,
    this.cost,
    this.productCost,
    this.calculationType,
    this.shippingRequires,
    this.themeId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
  });

  factory DeliveryData.fromJson(Map<String, dynamic> json) => DeliveryData(
    id: json["id"],
    methodName: json["method_name"],
    zoneId: json["zone_id"],
    cost: json["cost"],
    productCost: json["product_cost"],
    calculationType: json["calculation_type"],
    shippingRequires: json["shipping_requires"],
    themeId: json["theme_id"],
    storeId: json["store_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "method_name": methodName,
    "zone_id": zoneId,
    "cost": cost,
    "product_cost": productCost,
    "calculation_type": calculationType,
    "shipping_requires": shippingRequires,
    "theme_id": themeId,
    "store_id": storeId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
