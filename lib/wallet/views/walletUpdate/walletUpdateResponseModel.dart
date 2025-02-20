// To parse this JSON data, do
//
//     final walletUpdateResponseModel = walletUpdateResponseModelFromJson(jsonString);

import 'dart:convert';

WalletUpdateResponseModel walletUpdateResponseModelFromJson(String str) => WalletUpdateResponseModel.fromJson(json.decode(str));

String walletUpdateResponseModelToJson(WalletUpdateResponseModel data) => json.encode(data.toJson());

class WalletUpdateResponseModel {
    String message;
    Data data;

    WalletUpdateResponseModel({
        required this.message,
        required this.data,
    });

    factory WalletUpdateResponseModel.fromJson(Map<String, dynamic> json) => WalletUpdateResponseModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    int userId;
    String balance;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.userId,
        required this.balance,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        balance: json["balance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "balance": balance,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
