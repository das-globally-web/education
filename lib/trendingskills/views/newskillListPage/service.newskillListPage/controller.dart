import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/model.newskillListpage/newskillListModel.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/service.newskillListPage/service.newskillListPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newskillListPageProvider = FutureProvider.autoDispose.family<NewskillListPageModel, String>((ref , id) async {
  final newskillListPage = Servicenewskilllistpage(await createDio());
  return newskillListPage.getAllNewSkillListPage(id);
});
