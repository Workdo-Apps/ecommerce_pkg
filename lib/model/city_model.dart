// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  int? status;
  String? message;
  List<CityData>? data;

  CityModel({
    this.status,
    this.message,
    this.data,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CityData>.from(json["data"]!.map((x) => CityData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CityData {
  String? name;
  int? id;
  int? stateId;
  int? countryId;

  CityData({
    this.name,
    this.id,
    this.stateId,
    this.countryId,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        name: json["name"],
        id: json["id"],
        stateId: json["state_id"],
        countryId: json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "state_id": stateId,
        "country_id": countryId,
      };
}
