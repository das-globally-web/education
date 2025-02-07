import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:educationapp/trendingskills/controller/service/skills.service.dart';
import 'package:educationapp/trendingskills/model/new.skills.model.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final skilssProvide = FutureProvider<SkillsModel>((ref) async {
  final service = SkillService(await createDio());
  return service.getALLSiklls();
});

final newskillsProvider =
    FutureProvider.family<NewSkillsModel, String>((ref, id) async {
  final newservice = SkillService(await createDio());
  return newservice.getNewAllSkills(id);
});
