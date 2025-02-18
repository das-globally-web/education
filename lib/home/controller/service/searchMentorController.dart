import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/home/controller/service/searchMentorService.dart';
import 'package:educationapp/home/model/searchMentorModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchMentorsClientProvider =
    FutureProvider<SearchMentorService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return SearchMentorService(dio);
});

final searchMentorProvider =
    FutureProvider.family<SearchMentorModel, String>((ref, query) async {
  final clinet = await ref.watch(searchMentorsClientProvider.future);
  return await compute(
      ApiController.searchMentors, {"service": clinet, "query": query});
});
