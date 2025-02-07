import 'dart:io';

import 'package:dio/dio.dart';
import 'package:educationapp/registerpage/model.register/registerResponseModel.dart';
import 'package:retrofit/retrofit.dart';

part 'register.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com/')
abstract class RegisterService {
  factory RegisterService(Dio dio, {String baseUrl}) = _RegisterService;

  @POST('api/register')
  @MultiPart()
  Future<RegisterResponseModel> register(
    {@Part() required Map<String, dynamic> data,}
    // @Part(name: 'full_name') String fullName,
    // @Part(name: 'email') String email,
    // @Part(name: 'phone_number') String phoneNumber,
    // @Part(name: 'password') String password,
    // @Part(name: 'confirm_password') String confirmPassword,
    // @Part(name: 'language_known') String languageKnown,
    // @Part(name: 'total_experience') String totalExperience,
    // @Part(name: 'service_type') String serviceType,
    // @Part(name: 'profile_pic') File? profilePic,
    // @Part(name: 'skills_id') String skillsId,
    // @Part(name: 'user_type') String userType,
    // @Part(name: 'description') String description,
    // @Part(name: 'location') String location,
  );
}
