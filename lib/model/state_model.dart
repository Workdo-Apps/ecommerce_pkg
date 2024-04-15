// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  int? status;
  String? message;
  List<StateData>? data;

  StateModel({
    this.status,
    this.message,
    this.data,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<StateData>.from(json["data"]!.map((x) => StateData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StateData {
  String? name;
  int? id;
  int? countryId;

  StateData({
    this.name,
    this.id,
    this.countryId,
  });

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        name: json["name"],
        id: json["id"],
        countryId: json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "country_id": countryId,
      };
}
