// To parse this JSON data, do
//
//     final walletUpdateBodyModel = walletUpdateBodyModelFromJson(jsonString);

import 'dart:convert';

WalletUpdateBodyModel walletUpdateBodyModelFromJson(String str) => WalletUpdateBodyModel.fromJson(json.decode(str));

String walletUpdateBodyModelToJson(WalletUpdateBodyModel data) => json.encode(data.toJson());

class WalletUpdateBodyModel {
    int userId;
    int balance;

    WalletUpdateBodyModel({
        required this.userId,
        required this.balance,
    });

    factory WalletUpdateBodyModel.fromJson(Map<String, dynamic> json) => WalletUpdateBodyModel(
        userId: json["user_id"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "balance": balance,
    };
}
