// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecommerce_pkg/model/product_model.dart';

// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
  int? count;
  int? maxPrice;
  int? status;
  String? message;
  ProductDetailData? data;

  ProductDetailModel({
    this.count,
    this.maxPrice,
    this.status,
    this.message,
    this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        count: json["count"],
        maxPrice: json["max_price"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : ProductDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "max_price": maxPrice,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProductDetailData {
  Product? productInfo;
  List<ProductImage>? productImage;
  List<ProductReview>? productReview;
  List<Variant>? variant;
  List<Product>? reletedProducts;
  List<dynamic>? productInstruction;

  ProductDetailData({
    this.productInfo,
    this.productImage,
    this.productReview,
    this.variant,
    this.reletedProducts,
    this.productInstruction,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
        productInfo: json["product_info"] == null ? null : Product.fromJson(json["product_info"]),
        productImage: json["product_image"] == null ? [] : List<ProductImage>.from(json["product_image"]!.map((x) => ProductImage.fromJson(x))),
        productReview: json["product_Review"] == null ? [] : List<ProductReview>.from(json["product_Review"]!.map((x) => ProductReview.fromJson(x))),
        variant: json["variant"] == null ? [] : List<Variant>.from(json["variant"]!.map((x) => Variant.fromJson(x))),
        reletedProducts: json["releted_products"] == null ? [] : List<Product>.from(json["releted_products"]!.map((x) => Product.fromJson(x))),
        productInstruction: json["product_instruction"] == null ? [] : List<dynamic>.from(json["product_instruction"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_info": productInfo?.toJson(),
        "product_image": productImage == null ? [] : List<dynamic>.from(productImage!.map((x) => x.toJson())),
        "product_Review": productReview == null ? [] : List<dynamic>.from(productReview!.map((x) => x)),
        "variant": variant == null ? [] : List<dynamic>.from(variant!.map((x) => x.toJson())),
        "releted_products": reletedProducts == null ? [] : List<dynamic>.from(reletedProducts!.map((x) => x.toJson())),
        "product_instruction": productInstruction == null ? [] : List<dynamic>.from(productInstruction!.map((x) => x)),
      };
}

class ProductImage {
  int? id;
  int? productId;
  String? imagePath;
  String? themeId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? demoField;
  String? imagePathFullUrl;

  ProductImage({
    this.id,
    this.productId,
    this.imagePath,
    this.themeId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.demoField,
    this.imagePathFullUrl,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        productId: json["product_id"],
        imagePath: json["image_path"],
        themeId: json["theme_id"],
        storeId: json["store_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        demoField: json["demo_field"],
        imagePathFullUrl: json["image_path_full_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image_path": imagePath,
        "theme_id": themeId,
        "store_id": storeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "demo_field": demoField,
        "image_path_full_url": imagePathFullUrl,
      };
}


class ProductData {
  int? id;
  String? name;
  String? slug;
  String? imagePath;
  String? iconPath;
  int? trending;
  int? status;
  String? themeId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? demoField;
  int? categoryItem;
  int? totalProduct;
  int? maincategoryId;
  String? imagePathFullUrl;
  String? iconPathFullUrl;

  ProductData({
    this.id,
    this.name,
    this.slug,
    this.imagePath,
    this.iconPath,
    this.trending,
    this.status,
    this.themeId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.demoField,
    this.categoryItem,
    this.totalProduct,
    this.maincategoryId,
    this.imagePathFullUrl,
    this.iconPathFullUrl,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        imagePath: json["image_path"],
        iconPath: json["icon_path"],
        trending: json["trending"],
        status: json["status"],
        themeId: json["theme_id"],
        storeId: json["store_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        demoField: json["demo_field"],
        categoryItem: json["category_item"],
        totalProduct: json["total_product"],
        maincategoryId: json["maincategory_id"],
        imagePathFullUrl: json["image_path_full_url"],
        iconPathFullUrl: json["icon_path_full_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image_path": imagePath,
        "icon_path": iconPath,
        "trending": trending,
        "status": status,
        "theme_id": themeId,
        "store_id": storeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "demo_field": demoField,
        "category_item": categoryItem,
        "total_product": totalProduct,
        "maincategory_id": maincategoryId,
        "image_path_full_url": imagePathFullUrl,
        "icon_path_full_url": iconPathFullUrl,
      };
}

class SubCategoryctData {
  int? id;
  String? name;
  String? imageUrl;
  String? imagePath;
  String? iconPath;
  int? maincategoryId;
  int? status;
  String? themeId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? iconImgPath;
  String? imagePathFullUrl;
  String? iconPathFullUrl;

  SubCategoryctData({
    this.id,
    this.name,
    this.imageUrl,
    this.imagePath,
    this.iconPath,
    this.maincategoryId,
    this.status,
    this.themeId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.iconImgPath,
    this.imagePathFullUrl,
    this.iconPathFullUrl,
  });

  factory SubCategoryctData.fromJson(Map<String, dynamic> json) => SubCategoryctData(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        imagePath: json["image_path"],
        iconPath: json["icon_path"],
        maincategoryId: json["maincategory_id"],
        status: json["status"],
        themeId: json["theme_id"],
        storeId: json["store_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        iconImgPath: json["icon_img_path"],
        imagePathFullUrl: json["image_path_full_url"],
        iconPathFullUrl: json["icon_path_full_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "image_path": imagePath,
        "icon_path": iconPath,
        "maincategory_id": maincategoryId,
        "status": status,
        "theme_id": themeId,
        "store_id": storeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "icon_img_path": iconImgPath,
        "image_path_full_url": imagePathFullUrl,
        "icon_path_full_url": iconPathFullUrl,
      };
}

class Variant {
  String? variantName;
  List<VariantListDatum>? variantListData;

  Variant({
    this.variantName,
    this.variantListData,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantName: json["variant_name"],
        variantListData: json["variant_list_data"] == null ? [] : List<VariantListDatum>.from(json["variant_list_data"]!.map((x) => VariantListDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "variant_name": variantName,
        "variant_list_data": variantListData == null ? [] : List<dynamic>.from(variantListData!.map((x) => x.toJson())),
      };
}

class VariantListDatum {
  int? id;
  String? name;

  VariantListDatum({
    this.id,
    this.name,
  });

  factory VariantListDatum.fromJson(Map<String, dynamic> json) => VariantListDatum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductReview {
  String? productImage;
  String? title;
  String? subTitle;
  int? rating;
  String? review;
  String? userImage;
  String? userName;
  String? userEmail;

  ProductReview({
    this.productImage,
    this.title,
    this.subTitle,
    this.rating,
    this.review,
    this.userImage,
    this.userName,
    this.userEmail,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
        productImage: json["product_image"],
        title: json["title"],
        subTitle: json["sub_title"],
        rating: json["rating"],
        review: json["review"],
        userImage: json["user_image"],
        userName: json["user_name"],
        userEmail: json["user_email"],
      );

  Map<String, dynamic> toJson() => {
        "product_image": productImage,
        "title": title,
        "sub_title": subTitle,
        "rating": rating,
        "review": review,
        "user_image": userImage,
        "user_name": userName,
        "user_email": userEmail,
      };
}
