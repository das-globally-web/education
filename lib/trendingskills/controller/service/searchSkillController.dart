import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/controller/service/searchSkillService.dart';
import 'package:educationapp/trendingskills/model/searchSkillModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchSkillClientProvider =
    FutureProvider<SearchSkillService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return SearchSkillService(dio);
});

final searchSkillProvider =
    FutureProvider.family<SearchSkillModel, String>((ref, test) async {
  final clinet = await ref.watch(searchSkillClientProvider.future);
  return await compute(
      ApiController.searchSkill, {'service': clinet, 'query': test});
});
