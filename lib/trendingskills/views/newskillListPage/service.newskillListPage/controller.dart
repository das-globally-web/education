import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/service.newskillListPage/service.newskillListPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newskillListPageProvider = FutureProvider((ref) async {
  final newskillListPage = Servicenewskilllistpage(await createDio());
  return newskillListPage.getAllNewSkillListPage();
});
