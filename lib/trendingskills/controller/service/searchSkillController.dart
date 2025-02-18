import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/controller/service/searchSkillService.dart';
import 'package:educationapp/trendingskills/model/searchSkillModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchSkillProvider =
    FutureProvider.family<SearchSkillModel, String>((ref, test) async {
  final searchskillservice = SearchSkillService(await createDio());
  return searchskillservice.getAllSearchSkill(test);
});
