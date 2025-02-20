import 'dart:developer';

import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/login/controller/login.state.dart';
import 'package:educationapp/login/controller/service/login.service.dart';
import 'package:educationapp/login/model/login.body.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifierProvider for LoginController
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(),
);

// LoginController class
class LoginController extends StateNotifier<LoginState> {
LoginController() : super(LoginInitial());

  // Login method
  Future<void> login(LoginBodyModel body) async {
    log("Login process started"); // Log the start of the login process

    try {
      state = LoginLoading(); // Set state to loading

      // Initialize Dio and LoginService
      final dio = await createDio();
      final loginService = LognService(dio);

      // Call the login API
      final response = await loginService.login(body);

      // Set state to success with the response
      state = LoginSuccess(response);
      log("Login successful: ${response.toString()}"); // Log success
    } catch (e) {
      // Handle errors and set state to error
      state = LoginError(e.toString());
      log("Login failed: ${e.toString()}"); // Log the error
    }
  }
}
