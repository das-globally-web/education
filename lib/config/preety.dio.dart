import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:educationapp/config/const.data.dart';
import 'package:educationapp/localstorage/db.dart';
import 'package:educationapp/localstorage/localdb.dart';
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
  log(token.toString());

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Retrieve token
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
        handler.next(options); // Continue with the request
      },
    ),
  );
  return dio;
}
