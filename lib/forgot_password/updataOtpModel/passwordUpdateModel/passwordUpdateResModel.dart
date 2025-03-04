// To parse this JSON data, do
//
//     final passwordUpdateResModel = passwordUpdateResModelFromJson(jsonString);

import 'dart:convert';

PasswordUpdateResModel passwordUpdateResModelFromJson(String str) => PasswordUpdateResModel.fromJson(json.decode(str));

String passwordUpdateResModelToJson(PasswordUpdateResModel data) => json.encode(data.toJson());

class PasswordUpdateResModel {
    String message;

    PasswordUpdateResModel({
        required this.message,
    });

    factory PasswordUpdateResModel.fromJson(Map<String, dynamic> json) => PasswordUpdateResModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
