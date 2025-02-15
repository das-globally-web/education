import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/trendingskills/controller/service/skills.service.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/model.newskillListpage/newskillListModel.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/service.newskillListPage/service.newskillListPage.dart';

class ApiController {
  static Future<AllMentorsModel> fetchMentors(HomeService service) async {
    return await service.allMentors(MentorsModelBody(userType: 'student'));
  }

  static Future<SkillsModel> getAllSkilss(SkillService service) async {
    return await service.getALLSiklls();
  }
}
