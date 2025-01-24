import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/allmentors.model.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/login/controller/service/login.service.dart';
import 'package:educationapp/login/model/login.body.model.dart';
import 'package:educationapp/login/model/login.rsponse.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeMentorsProvider = FutureProvider<AllMentorsModel>((ref) async {
  final homeService = HomeService(createDio());
  return homeService.allMentors(MentorsModelBody(userType: "student"));
});

