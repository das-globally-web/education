import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:educationapp/login/model/login.body.model.dart';
import 'package:educationapp/login/model/login.rsponse.model.dart';
import 'package:retrofit/retrofit.dart';

part 'login.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class LognService {
  factory LognService(Dio dio, {String baseUrl}) = _LognService;

  @POST('/api/login')
  Future<LoginResponseModel> login(@Body() LoginBodyModel body);
  @POST('/api/refresh-token')
  Future<RefreshTokenResMoedl> refreshToken(@Body() RefreshTokenBodyModel body);
}

RefreshTokenResMoedl refreshTokenResMoedlFromJson(String str) => RefreshTokenResMoedl.fromJson(json.decode(str));

String refreshTokenResMoedlToJson(RefreshTokenResMoedl data) => json.encode(data.toJson());

class RefreshTokenResMoedl {
    String message;
    String token;

    RefreshTokenResMoedl({
        required this.message,
        required this.token,
    });

    factory RefreshTokenResMoedl.fromJson(Map<String, dynamic> json) => RefreshTokenResMoedl(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
    };
}

RefreshTokenBodyModel refreshTokenBodyModelFromJson(String str) => RefreshTokenBodyModel.fromJson(json.decode(str));

String refreshTokenBodyModelToJson(RefreshTokenBodyModel data) => json.encode(data.toJson());

class RefreshTokenBodyModel {
    int userId;

    RefreshTokenBodyModel({
        required this.userId,
    });

    factory RefreshTokenBodyModel.fromJson(Map<String, dynamic> json) => RefreshTokenBodyModel(
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
    };
}
