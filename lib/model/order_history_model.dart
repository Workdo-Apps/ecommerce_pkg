// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) => OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) => json.encode(data.toJson());

class OrderHistoryModel {
  int? maxPrice;
  int? status;
  String? message;
  OrderData? data;

  OrderHistoryModel({
    this.maxPrice,
    this.status,
    this.message,
    this.data,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
        maxPrice: json["max_price"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : OrderData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "max_price": maxPrice,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class OrderData {
  int? currentPage;
  List<OrderHistoryItem>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  OrderData({
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

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<OrderHistoryItem>.from(json["data"]!.map((x) => OrderHistoryItem.fromJson(x))),
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

class OrderHistoryItem {
  int? id;
  DateTime? orderDate;
  DateTime? deliveryDate;
  String? productOrderId;
  DateTime? date;
  double? amount;
  int? deliveryId;
  int? deliveredStatus;
  int? returnStatus;
  int? rewardPoints;
  String? themeId;
  String? demoField;
  String? deliveredStatusString;
  String? deliveredImage;
  String? orderIdString;
  DateTime? returnDate;
  String? userName;

  OrderHistoryItem({
    this.id,
    this.orderDate,
    this.deliveryDate,
    this.productOrderId,
    this.date,
    this.amount,
    this.deliveryId,
    this.deliveredStatus,
    this.returnStatus,
    this.rewardPoints,
    this.themeId,
    this.demoField,
    this.deliveredStatusString,
    this.deliveredImage,
    this.orderIdString,
    this.returnDate,
    this.userName,
  });

  factory OrderHistoryItem.fromJson(Map<String, dynamic> json) => OrderHistoryItem(
        id: json["id"],
        orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
        deliveryDate: json["delivery_date"] == null ? null : DateTime.parse(json["delivery_date"]),
        productOrderId: json["product_order_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        amount: double.parse(json["amount"].toString()),
        deliveryId: json["delivery_id"],
        deliveredStatus: json["delivered_status"],
        returnStatus: json["return_status"],
        rewardPoints: json["reward_points"],
        themeId: json["theme_id"],
        demoField: json["demo_field"],
        deliveredStatusString: json["delivered_status_string"],
        deliveredImage: json["delivered_image"],
        orderIdString: json["order_id_string"],
        returnDate: json["return_date"] == null ? null : DateTime.parse(json["return_date"]),
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_date": orderDate?.toIso8601String(),
        "delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "product_order_id": productOrderId,
        "date": date?.toIso8601String(),
        "amount": amount,
        "delivery_id": deliveryId,
        "delivered_status": deliveredStatus,
        "return_status": returnStatus,
        "reward_points": rewardPoints,
        "theme_id": themeId,
        "demo_field": demoField,
        "delivered_status_string": deliveredStatusString,
        "delivered_image": deliveredImage,
        "order_id_string": orderIdString,
        "return_date": "${returnDate!.year.toString().padLeft(4, '0')}-${returnDate!.month.toString().padLeft(2, '0')}-${returnDate!.day.toString().padLeft(2, '0')}",
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
