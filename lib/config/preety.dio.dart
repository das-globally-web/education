import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:educationapp/login/controller/service/login.service.dart';
import 'package:educationapp/main.dart';
import 'package:educationapp/splash/views/splash.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = FutureProvider<Dio>((ref) async {
  return await createDio();
});

Future<Dio> createDio() async {
  final dio = Dio();

  if (!Hive.isBoxOpen('userdata')) {
    await Hive.openBox('userdata');
  }

  // dio.interceptors.add(PrettyDioLogger(
  //   requestHeader: true,
  //   requestBody: true,
  //   responseBody: false,
  //   responseHeader: true,
  // ));

  var box = Hive.box('userdata');
  var token = box.get('token');

  log("Token: $token");

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Retrieve token before sending request
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });
        handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 500) {
          // Token expired, refresh it
          log("Token expired, refreshing...");

          Fluttertoast.showToast(msg: "Session expired, try login");
          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SplashScreen()),
            (route) => false, // Remove all routes
          );
          return;
        } else {
          handler.next(e);
        }
      },
    ),
  );

  return dio;
}

Future<void> refreshToken() async {
  log("=========================================== this is code ================");
  var box = Hive.box('userdata');
  final service = LognService(await createDio());
  RefreshTokenResMoedl response =
      await service.refreshToken(RefreshTokenBodyModel(userId: box.get('id')));
  await box.put('token', response.token);
}
