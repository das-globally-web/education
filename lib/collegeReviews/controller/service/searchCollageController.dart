import 'package:educationapp/collegeReviews/controller/service/searchCollageService.dart';
import 'package:educationapp/collegeReviews/model/searchCollageModel.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchCollageProvider =
    FutureProvider.family<SearchCollageModel, String>((ref, mdsu) async {
  final searchcollageservice = SearchCollageService(await createDio());
  return searchcollageservice.getAllCollage(mdsu);
});
