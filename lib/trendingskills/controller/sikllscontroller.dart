import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/controller/service/skills.service.dart';
import 'package:educationapp/trendingskills/model/new.skills.model.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiSkillClientProvider =
    FutureProvider.autoDispose<SkillService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return SkillService(dio);
});

final skilssProvide = FutureProvider.autoDispose<SkillsModel>((ref) async {
  final client = await ref.watch(apiSkillClientProvider.future);
  return await compute(ApiController.getAllSkilss, client);
});

final newskillsProvider =
    FutureProvider.autoDispose.family<NewSkillsModel, String>((ref, id) async {
  final client = await ref.watch(apiSkillClientProvider.future);
  return await compute(
      ApiController.getNewAllSkills, {'service': client, 'id': id});
});
