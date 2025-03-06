import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/storeMentorNewSkillListPage/storeMentorBodyModel.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/storeMentorNewSkillListPage/storeMentorResModel.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/storeMentorNewSkillListPage/storeMentorService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeMentorProvider =
    FutureProvider.autoDispose.family<StoreMentorResModel, StoreMentorBodyModel>(
        (ref, body) async {
  final storementorservice = StoreMentorService(await createDio());
  return storementorservice.getAllStoreMentor(body);
});
