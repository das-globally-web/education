import 'package:educationapp/collegeReviews/controller/service/collage.service.dart';
import 'package:educationapp/collegeReviews/model/perticuler.collage.model.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final callagesProviders = FutureProvider<AllUniModel>((ref) async {
  final service = CollageService(await createDio());
  return service.getAllCollages();
});

final perticulerCollageProvider =
    FutureProvider.family<PerticulerCollageModel, String>((ref, id) async {
  final service = CollageService(await createDio());
  return service.getPErticulerCollage(id);
});
