import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:educationapp/login/controller/service/login.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  ));

  var box = Hive.box('userdata');
  var token = box.get('token');

  log("Token: $token");

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Retrieve token before sending request
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
        handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Token expired, refresh it
          log("Token expired, refreshing...");

          try {
            await refreshToken(); // Refresh token
            token = box.get('token'); // Get new token

            // Retry the failed request with new token
            final newRequest = e.requestOptions;
            newRequest.headers['Authorization'] = 'Bearer $token';

            final response = await dio.fetch(newRequest);
            handler.resolve(response); // Return new response
          } catch (refreshError) {
            log("Token refresh failed: $refreshError");
            handler.next(e); // Forward original error
          }
        } else {
          handler.next(e);
        }
      },
    ),
  );

  return dio;
}

Future<void> refreshToken() async {
  var box = Hive.box('userdata');
  final service = LognService(await createDio());
  RefreshTokenResMoedl response =
      await service.refreshToken(RefreshTokenBodyModel(userId: box.get('id')));
  await box.put('token', response.token);
}
