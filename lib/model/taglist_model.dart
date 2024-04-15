// To parse this JSON data, do
//
//     final taglistModel = taglistModelFromJson(jsonString);

import 'dart:convert';

TagListModel taglistModelFromJson(String str) => TagListModel.fromJson(json.decode(str));

String taglistModelToJson(TagListModel data) => json.encode(data.toJson());

class TagListModel {
  int? maxPrice;
  int? status;
  String? message;
  List<TagList>? data;

  TagListModel({
    this.maxPrice,
    this.status,
    this.message,
    this.data,
  });

  factory TagListModel.fromJson(Map<String, dynamic> json) => TagListModel(
    maxPrice: json["max_price"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<TagList>.from(json["data"]!.map((x) => TagList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "max_price": maxPrice,
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TagList {
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

  TagList({
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
  });

  factory TagList.fromJson(Map<String, dynamic> json) => TagList(
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
  };
}
