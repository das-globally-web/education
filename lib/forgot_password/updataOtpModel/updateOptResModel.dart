// To parse this JSON data, do
//
//     final updataOtpResModel = updataOtpResModelFromJson(jsonString);

import 'dart:convert';

UpdataOtpResModel updataOtpResModelFromJson(String str) => UpdataOtpResModel.fromJson(json.decode(str));

String updataOtpResModelToJson(UpdataOtpResModel data) => json.encode(data.toJson());

class UpdataOtpResModel {
    String message;
    int expiresIn;

    UpdataOtpResModel({
        required this.message,
        required this.expiresIn,
    });

    factory UpdataOtpResModel.fromJson(Map<String, dynamic> json) => UpdataOtpResModel(
        message: json["message"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "expires_in": expiresIn,
    };
}
