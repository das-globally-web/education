// To parse this JSON data, do
//
//     final updatePasswordPhoneModel = updatePasswordPhoneModelFromJson(jsonString);

import 'dart:convert';

UpdatePasswordPhoneModel updatePasswordPhoneModelFromJson(String str) =>
    UpdatePasswordPhoneModel.fromJson(json.decode(str));

String updatePasswordPhoneModelToJson(UpdatePasswordPhoneModel data) =>
    json.encode(data.toJson());

class UpdatePasswordPhoneModel {
  String phoneNumber;
  String newPassword;
  String newPasswordConfirmation;

  UpdatePasswordPhoneModel({
    required this.phoneNumber,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  factory UpdatePasswordPhoneModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordPhoneModel(
        phoneNumber: json["phone_number"],
        newPassword: json["new_password"],
        newPasswordConfirmation: json["new_password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "new_password": newPassword,
        "new_password_confirmation": newPasswordConfirmation,
      };
}

// To parse this JSON data, do
//
//     final updatePhonePasswordResponse = updatePhonePasswordResponseFromJson(jsonString);

UpdatePhonePasswordResponse updatePhonePasswordResponseFromJson(String str) =>
    UpdatePhonePasswordResponse.fromJson(json.decode(str));

String updatePhonePasswordResponseToJson(UpdatePhonePasswordResponse data) =>
    json.encode(data.toJson());

class UpdatePhonePasswordResponse {
  String message;

  UpdatePhonePasswordResponse({
    required this.message,
  });

  factory UpdatePhonePasswordResponse.fromJson(Map<String, dynamic> json) =>
      UpdatePhonePasswordResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
