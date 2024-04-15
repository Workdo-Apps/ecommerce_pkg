// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  int? status;
  String? message;
  AddressModelData? data;

  AddressModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : AddressModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class AddressModelData {
  int? currentPage;
  List<Address>? data;
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

  AddressModelData({
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

  factory AddressModelData.fromJson(Map<String, dynamic> json) => AddressModelData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<Address>.from(json["data"]!.map((x) => Address.fromJson(x))),
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

class Address {
  int? id;
  int? customerId;
  String? title;
  String? address;
  int? countryId;
  int? stateId;
  int? cityId;
  int? postcode;
  int? defaultAddress;
  String? themeId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? demoField;
  String? countryName;
  String? stateName;
  String? cityName;

  Address({
    this.id,
    this.customerId,
    this.title,
    this.address,
    this.countryId,
    this.stateId,
    this.cityId,
    this.postcode,
    this.defaultAddress,
    this.themeId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.demoField,
    this.countryName,
    this.stateName,
    this.cityName,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        customerId: json["customer_id"],
        title: json["title"],
        address: json["address"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        postcode: json["postcode"],
        defaultAddress: json["default_address"],
        themeId: json["theme_id"],
        storeId: json["store_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        demoField: json["demo_field"],
        countryName: json["country_name"],
        stateName: json["state_name"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "title": title,
        "address": address,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "postcode": postcode,
        "default_address": defaultAddress,
        "theme_id": themeId,
        "store_id": storeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "demo_field": demoField,
        "country_name": countryName,
        "state_name": stateName,
        "city_name": cityName,
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
