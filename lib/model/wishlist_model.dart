// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecommerce_pkg/model/product_model.dart';

WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  int? count;

  int? status;
  String? message;
  WishlistData? data;

  WishlistModel({
    this.count,
    this.status,
    this.message,
    this.data,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        count: json["count"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : WishlistData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class WishlistData {
  int? currentPage;
  List<ProductData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  WishlistData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory WishlistData.fromJson(Map<String, dynamic> json) => WishlistData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class ProductData {
  int? id;
  int? customerId;
  int? productId;
  dynamic variantId;
  int? status;
  String? themeId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? demoField;
  String? productName;
  String? productImage;
  String? variantName;
  String? originalPrice;
  String? finalPrice;
  Product? productData;

  ProductData({
    this.id,
    this.customerId,
    this.productId,
    this.variantId,
    this.status,
    this.themeId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.demoField,
    this.productName,
    this.productImage,
    this.variantName,
    this.originalPrice,
    this.finalPrice,
    this.productData,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        customerId: json["customer_id"],
        productId: json["product_id"],
        variantId: json["variant_id"],
        status: json["status"],
        themeId: json["theme_id"],
        storeId: json["store_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        demoField: json["demo_field"],
        productName: json["product_name"],
        productImage: json["product_image"],
        variantName: json["variant_name"],
        originalPrice: json["original_price"],
        finalPrice: json["final_price"],
        productData: json["product_data"] == null ? null : Product.fromJson(json["product_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "product_id": productId,
        "variant_id": variantId,
        "status": status,
        "theme_id": themeId,
        "store_id": storeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "demo_field": demoField,
        "product_name": productName,
        "product_image": productImage,
        "variant_name": variantName,
        "original_price": originalPrice,
        "final_price": finalPrice,
        "product_data": productData?.toJson(),
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
