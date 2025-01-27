import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/login/controller/service/login.service.dart';
import 'package:educationapp/login/model/login.body.model.dart';
import 'package:educationapp/login/model/login.rsponse.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginControllerProvider =
    FutureProvider.family<LoginResponseModel, LoginBodyModel>(
        (ref, body) async {
  final loginService = LognService( await createDio());
  return loginService.login(body);
});
