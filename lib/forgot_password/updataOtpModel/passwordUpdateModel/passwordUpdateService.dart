import 'package:dio/dio.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateModel.dart';
import 'package:educationapp/forgot_password/updataOtpModel/passwordUpdateModel/passwordUpdateResModel.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
part 'passwordUpdateService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class PasswordUpdateService {
  factory PasswordUpdateService(Dio dio, {String baseUrl}) =
      _PasswordUpdateService;

  @POST('/api/update-password')
  Future<PasswordUpdateResModel> passwordUpdate(
      @Body() PasswordUpdateModelEmail body);
}

PasswordUpdateModelEmail passwordUpdateModelEmailFromJson(String str) =>
    PasswordUpdateModelEmail.fromJson(json.decode(str));

String passwordUpdateModelEmailToJson(PasswordUpdateModelEmail data) =>
    json.encode(data.toJson());

class PasswordUpdateModelEmail {
  String email;
  String otp;
  String password;
  String passwordConfirmation;

  PasswordUpdateModelEmail({
    required this.email,
    required this.otp,
    required this.password,
    required this.passwordConfirmation,
  });

  factory PasswordUpdateModelEmail.fromJson(Map<String, dynamic> json) =>
      PasswordUpdateModelEmail(
        email: json["email"],
        otp: json["otp"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
