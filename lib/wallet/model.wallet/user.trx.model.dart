// To parse this JSON data, do
//
//     final userTranctionModel = userTranctionModelFromJson(jsonString);

import 'dart:convert';

UserTranctionModel userTranctionModelFromJson(String str) => UserTranctionModel.fromJson(json.decode(str));

String userTranctionModelToJson(UserTranctionModel data) => json.encode(data.toJson());

class UserTranctionModel {
    String message;
    List<Datum> data;

    UserTranctionModel({
        required this.message,
        required this.data,
    });

    factory UserTranctionModel.fromJson(Map<String, dynamic> json) => UserTranctionModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String userName;
    int id;
    int userId;
    int voliteId;
    dynamic message;
    String amount;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.userName,
        required this.id,
        required this.userId,
        required this.voliteId,
        required this.message,
        required this.amount,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userName: json["user_name"],
        id: json["id"],
        userId: json["user_id"],
        voliteId: json["volite_id"],
        message: json["message"],
        amount: json["amount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "user_name": userName,
        "id": id,
        "user_id": userId,
        "volite_id": voliteId,
        "message": message,
        "amount": amount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
