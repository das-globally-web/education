import 'dart:developer';

import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/login/controller/login.state.dart';
import 'package:educationapp/login/controller/service/login.service.dart';
import 'package:educationapp/login/model/login.body.model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(),
);

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginInitial());

  Future<void> login(LoginBodyModel body) async {
    log("Hey bro");
    try {
      state = LoginLoading(); // Set state to loading

      final loginService = LognService(await createDio());
      final response = await loginService.login(body);

      state = LoginSuccess(response); // Set state to success
    } catch (e) {
      state = LoginError(e.toString()); // Handle errors
    }
  }
}
