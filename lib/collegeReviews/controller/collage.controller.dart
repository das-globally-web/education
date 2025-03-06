import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/collegeReviews/controller/service/collage.service.dart';
import 'package:educationapp/collegeReviews/model/perticuler.collage.model.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiCollageClientProvider =
    FutureProvider.autoDispose<CollageService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return CollageService(dio);
});

final callagesProviders = FutureProvider.autoDispose<AllUniModel>((ref) async {
  final client = await ref.watch(apiCollageClientProvider.future);
  return await compute(ApiController.getallCollage, client);
});

final perticulerCollageProvider = FutureProvider.autoDispose
    .family<PerticulerCollageModel, String>((ref, id) async {
  final client = await ref.watch(apiCollageClientProvider.future);
  return await compute(
      ApiController.getPerticulerCollage, {'service': client, 'id': id});
});
