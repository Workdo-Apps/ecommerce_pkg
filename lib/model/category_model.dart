// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  int? count;
  int? status;
  String? message;
  CategoryData? data;

  CategoryModel({this.count, this.status, this.message, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        count: json["count"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : CategoryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class CategoryData {
  int? currentPage;
  List<Category>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  CategoryData({
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

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<Category>.from(json["data"]!.map((x) => Category.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Links>.from(json["links"]!.map((x) => Links.fromJson(x))),
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

class Category {
  int? id;
  String? name;
  String? slug;
  String? imagePath;
  String? iconPath;
  int? trending;
  int? status;
  String? themeId;
  int? storeId;
  int? totalProduct;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? maincategoryId;
  String? image;
  List<SubCategory>? subCategory;

  Category({
    this.id,
    this.name,
    this.slug,
    this.imagePath,
    this.iconPath,
    this.trending,
    this.status,
    this.themeId,
    this.storeId,
    this.totalProduct,
    this.createdAt,
    this.updatedAt,
    this.maincategoryId,
    this.image,
    this.subCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        imagePath: json["image_path"],
        iconPath: json["icon_path"],
        trending: json["trending"],
        status: json["status"],
        themeId: json["theme_id"],
        storeId: json["store_id"],
        totalProduct: json["total_product"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        maincategoryId: json["maincategory_id"],
        image: json["image"],
        subCategory: json["sub_category"] == null ? [] : List<SubCategory>.from(json["sub_category"]!.map((x) => SubCategory.fromJson(x))),
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
        "total_product": totalProduct,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "maincategory_id": maincategoryId,
        "image": image,
        "sub_category": subCategory == null ? [] : List<dynamic>.from(subCategory!.map((x) => x.toJson())),
      };
}

class SubCategory {
  int? id;
  String? name;
  String? imagePath;
  String? iconPath;
  String? iconImgPath;
  String? imagePathFullUrl;
  String? iconPathFullUrl;

  SubCategory({
    this.id,
    this.name,
    this.imagePath,
    this.iconPath,
    this.iconImgPath,
    this.imagePathFullUrl,
    this.iconPathFullUrl,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        imagePath: json["image_path"],
        iconPath: json["icon_path"],
        iconImgPath: json["icon_img_path"],
        imagePathFullUrl: json["image_path_full_url"],
        iconPathFullUrl: json["icon_path_full_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_path": imagePath,
        "icon_path": iconPath,
        "icon_img_path": iconImgPath,
        "image_path_full_url": imagePathFullUrl,
        "icon_path_full_url": iconPathFullUrl,
      };
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
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
