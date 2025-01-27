import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/home/model/allmentors.model.dart';
import 'package:educationapp/trendingskills/controller/service/skills.service.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final skilssProvide = FutureProvider<SkillsModel>((ref) async {
  final service = SkillsService(await createDio());
  return service.getALLSiklls();
});
