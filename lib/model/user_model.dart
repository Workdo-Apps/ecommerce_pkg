import 'dart:convert';

class UserModel {
  int? status;
  String? message;
  UserData? data;

  UserModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? image;
  String? name;
  String? email;
  String? mobile;
  int? defaultAddressId;
  String? countryId;
  String? stateId;
  String? city;
  String? address;
  String? postcode;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
    this.name,
    this.email,
    this.mobile,
    this.defaultAddressId,
    this.countryId,
    this.stateId,
    this.city,
    this.address,
    this.postcode,
  });

  factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        defaultAddressId: json["defaulte_address_id"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        city: json["city"],
        address: json["address"],
        postcode: json["postcode"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "name": name,
        "email": email,
        "mobile": mobile,
        "defaulte_address_id": defaultAddressId,
        "country_id": countryId,
        "state_id": stateId,
        "city": city,
        "address": address,
        "postcode": postcode,
      };
}
