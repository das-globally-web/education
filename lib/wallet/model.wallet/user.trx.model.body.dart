// To parse this JSON data, do
//
//     final userTranctionBodyModel = userTranctionBodyModelFromJson(jsonString);

import 'dart:convert';

UserTranctionBodyModel userTranctionBodyModelFromJson(String str) =>
    UserTranctionBodyModel.fromJson(json.decode(str));

String userTranctionBodyModelToJson(UserTranctionBodyModel data) =>
    json.encode(data.toJson());

class UserTranctionBodyModel {
  String userId;
  String voliteId;
  String amount;

  UserTranctionBodyModel({
    required this.userId,
    required this.voliteId,
    required this.amount,
  });

  factory UserTranctionBodyModel.fromJson(Map<String, dynamic> json) =>
      UserTranctionBodyModel(
        userId: json["user_id"],
        voliteId: json["volite_id"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "volite_id": voliteId,
        "amount": amount,
      };
}


// To parse this JSON data, do
//
//     final userTranctionResModel = userTranctionResModelFromJson(jsonString);



UserTranctionResModel userTranctionResModelFromJson(String str) => UserTranctionResModel.fromJson(json.decode(str));

String userTranctionResModelToJson(UserTranctionResModel data) => json.encode(data.toJson());

class UserTranctionResModel {
    String message;
    Data data;

    UserTranctionResModel({
        required this.message,
        required this.data,
    });

    factory UserTranctionResModel.fromJson(Map<String, dynamic> json) => UserTranctionResModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String userId;
    String voliteId;
    String amount;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.userId,
        required this.voliteId,
        required this.amount,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        voliteId: json["volite_id"],
        amount: json["amount"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "volite_id": voliteId,
        "amount": amount,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
