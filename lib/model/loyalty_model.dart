// To parse this JSON data, do
//
//     final loyalityModel = loyalityModelFromJson(jsonString);

import 'dart:convert';

LoyaltyModel loyalityModelFromJson(String str) => LoyaltyModel.fromJson(json.decode(str));

String loyalityModelToJson(LoyaltyModel data) => json.encode(data.toJson());

class LoyaltyModel {
  int? maxPrice;
  int? status;
  String? message;
  LoyaltyData? data;

  LoyaltyModel({
    this.maxPrice,
    this.status,
    this.message,
    this.data,
  });

  factory LoyaltyModel.fromJson(Map<String, dynamic> json) => LoyaltyModel(
    maxPrice: json["max_price"],
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : LoyaltyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "max_price": maxPrice,
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class LoyaltyData {
  LoyaltyProgram? loyalityProgram;
  String? point;
  RewardHistory? rewardHistory;

  LoyaltyData({
    this.loyalityProgram,
    this.point,
    this.rewardHistory,
  });

  factory LoyaltyData.fromJson(Map<String, dynamic> json) => LoyaltyData(
    loyalityProgram: json["loyality-program"] == null ? null : LoyaltyProgram.fromJson(json["loyality-program"]),
    point: json["point"],
    rewardHistory: json["reward_history"] == null ? null : RewardHistory.fromJson(json["reward_history"]),
  );

  Map<String, dynamic> toJson() => {
    "loyality-program": loyalityProgram?.toJson(),
    "point": point,
    "reward_history": rewardHistory?.toJson(),
  };
}

class LoyaltyProgram {
  String? loyaltyProgramTitle;
  String? loyaltyProgramDescription;
  String? loyaltyProgramYourCash;
  String? loyaltyProgramCopyThisLinkAndSendToYourFriends;

  LoyaltyProgram({
    this.loyaltyProgramTitle,
    this.loyaltyProgramDescription,
    this.loyaltyProgramYourCash,
    this.loyaltyProgramCopyThisLinkAndSendToYourFriends,
  });

  factory LoyaltyProgram.fromJson(Map<String, dynamic> json) => LoyaltyProgram(
    loyaltyProgramTitle: json["loyality-program-title"],
    loyaltyProgramDescription: json["loyality-program-description"],
    loyaltyProgramYourCash: json["loyality-program-your-cash"],
    loyaltyProgramCopyThisLinkAndSendToYourFriends: json["loyality-program-copy-this-link-and-send-to-your-friends"],
  );

  Map<String, dynamic> toJson() => {
    "loyality-program-title": loyaltyProgramTitle,
    "loyality-program-description": loyaltyProgramDescription,
    "loyality-program-your-cash": loyaltyProgramYourCash,
    "loyality-program-copy-this-link-and-send-to-your-friends": loyaltyProgramCopyThisLinkAndSendToYourFriends,
  };
}

class RewardHistory {
  int? currentPage;
  List<HistoryData>? data;
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

  RewardHistory({
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

  factory RewardHistory.fromJson(Map<String, dynamic> json) => RewardHistory(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<HistoryData>.from(json["data"]!.map((x) => HistoryData.fromJson(x))),
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

class HistoryData {
  int? id;
  String? productOrderId;
  DateTime? orderDate;
  int? customerId;
  int? isGuest;
  String? productJson;
  String? productId;
  double? productPrice;
  double? couponPrice;
  double? deliveryPrice;
  double? taxPrice;
  String? finalPrice;
  double? returnPrice;
  String? paymentComment;
  String? paymentType;
  String? paymentStatus;
  int? deliveryId;
  String? deliveryComment;
  int? deliveredStatus;
  dynamic deliveryDate;
  dynamic confirmedDate;
  dynamic pickedDate;
  dynamic shippedDate;
  int? returnStatus;
  DateTime? returnDate;
  dynamic cancelDate;
  int? rewardPoints;
  dynamic additionalNote;
  String? themeId;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? demoField;
  String? deliveredStatusString;
  String? deliveredImage;
  String? orderIdString;
  String? userName;

  HistoryData({
    this.id,
    this.productOrderId,
    this.orderDate,
    this.customerId,
    this.isGuest,
    this.productJson,
    this.productId,
    this.productPrice,
    this.couponPrice,
    this.deliveryPrice,
    this.taxPrice,
    this.finalPrice,
    this.returnPrice,
    this.paymentComment,
    this.paymentType,
    this.paymentStatus,
    this.deliveryId,
    this.deliveryComment,
    this.deliveredStatus,
    this.deliveryDate,
    this.confirmedDate,
    this.pickedDate,
    this.shippedDate,
    this.returnStatus,
    this.returnDate,
    this.cancelDate,
    this.rewardPoints,
    this.additionalNote,
    this.themeId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.demoField,
    this.deliveredStatusString,
    this.deliveredImage,
    this.orderIdString,
    this.userName,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) => HistoryData(
    id: json["id"],
    productOrderId: json["product_order_id"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    customerId: json["customer_id"],
    isGuest: json["is_guest"],
    productJson: json["product_json"],
    productId: json["product_id"],
    productPrice: double.parse(json["product_price"].toString()),
    couponPrice: double.parse(json["coupon_price"].toString()),
    deliveryPrice: double.parse(json["delivery_price"].toString()),
    taxPrice: double.parse(json["tax_price"].toString()),
    finalPrice: json["final_price"],
    returnPrice: double.parse(json["return_price"].toString()),
    paymentComment: json["payment_comment"],
    paymentType: json["payment_type"],
    paymentStatus: json["payment_status"],
    deliveryId: json["delivery_id"],
    deliveryComment: json["delivery_comment"],
    deliveredStatus: json["delivered_status"],
    deliveryDate: json["delivery_date"],
    confirmedDate: json["confirmed_date"],
    pickedDate: json["picked_date"],
    shippedDate: json["shipped_date"],
    returnStatus: json["return_status"],
    returnDate: json["return_date"] == null ? null : DateTime.parse(json["return_date"]),
    cancelDate: json["cancel_date"],
    rewardPoints: json["reward_points"],
    additionalNote: json["additional_note"],
    themeId: json["theme_id"],
    storeId: json["store_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    demoField: json["demo_field"],
    deliveredStatusString: json["delivered_status_string"],
    deliveredImage: json["delivered_image"],
    orderIdString: json["order_id_string"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_order_id": productOrderId,
    "order_date": orderDate?.toIso8601String(),
    "customer_id": customerId,
    "is_guest": isGuest,
    "product_json": productJson,
    "product_id": productId,
    "product_price": productPrice,
    "coupon_price": couponPrice,
    "delivery_price": deliveryPrice,
    "tax_price": taxPrice,
    "final_price": finalPrice,
    "return_price": returnPrice,
    "payment_comment": paymentComment,
    "payment_type": paymentType,
    "payment_status": paymentStatus,
    "delivery_id": deliveryId,
    "delivery_comment": deliveryComment,
    "delivered_status": deliveredStatus,
    "delivery_date": deliveryDate,
    "confirmed_date": confirmedDate,
    "picked_date": pickedDate,
    "shipped_date": shippedDate,
    "return_status": returnStatus,
    "return_date": "${returnDate!.year.toString().padLeft(4, '0')}-${returnDate!.month.toString().padLeft(2, '0')}-${returnDate!.day.toString().padLeft(2, '0')}",
    "cancel_date": cancelDate,
    "reward_points": rewardPoints,
    "additional_note": additionalNote,
    "theme_id": themeId,
    "store_id": storeId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "demo_field": demoField,
    "delivered_status_string": deliveredStatusString,
    "delivered_image": deliveredImage,
    "order_id_string": orderIdString,
    "user_name": userName,
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
