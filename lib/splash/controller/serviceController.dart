import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/splash/models/service.model.dart';
import 'package:educationapp/splash/service/getstart.service.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceController = FutureProvider<GetStartService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return GetStartService(dio);
});

final serviceProvider = FutureProvider<ServiceModelRes>((ref) async {
  final client = await ref.watch(apiServiceController.future);
  return compute(ApiController.fetchService, client);
});
