import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:educationapp/config/const.data.dart';
import 'package:educationapp/localstorage/db.dart';
import 'package:educationapp/localstorage/localdb.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<Dio> createDio() async {
  final dio = Dio();
  final userBox = Hive.box<User>('mybox');
  final user = userBox.get('user1');
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  ));
  String? value = await LocalStorage.getToken();
  log(value.toString());
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Retrieve token
        options.headers.addAll({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + user!.token,
        });
        handler.next(options); // Continue with the request
      },
    ),
  );
  return dio;
}
