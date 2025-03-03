// To parse this JSON data, do
//
//     final updataOtpBodyModel = updataOtpBodyModelFromJson(jsonString);

import 'dart:convert';

UpdataOtpBodyModel updataOtpBodyModelFromJson(String str) => UpdataOtpBodyModel.fromJson(json.decode(str));

String updataOtpBodyModelToJson(UpdataOtpBodyModel data) => json.encode(data.toJson());

class UpdataOtpBodyModel {
    String email;

    UpdataOtpBodyModel({
        required this.email,
    });

    factory UpdataOtpBodyModel.fromJson(Map<String, dynamic> json) => UpdataOtpBodyModel(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
