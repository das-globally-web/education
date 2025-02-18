import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/home/controller/service/searchMentorService.dart';
import 'package:educationapp/home/model/searchMentorModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchMentorProvider =
    FutureProvider.family<SearchMentorModel, String>((ref, query) async {
  final searchmentorservice = SearchMentorService(await createDio());
  return searchmentorservice.getallSearchMentor(query);
});
