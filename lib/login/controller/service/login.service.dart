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
}