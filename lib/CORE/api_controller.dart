

import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/mentors.model.dart';

class ApiController {
  static Future<AllMentorsModel> fetchMentors(HomeService service) async {
    return await service.allMentors(MentorsModelBody(userType: 'student'));
  }
}
