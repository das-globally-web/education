import 'package:educationapp/collegeReviews/controller/service/collage.service.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:educationapp/collegeReviews/model/perticuler.collage.model.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/trendingskills/controller/service/searchSkillService.dart';
import 'package:educationapp/trendingskills/controller/service/skills.service.dart';
import 'package:educationapp/trendingskills/model/new.skills.model.dart';
import 'package:educationapp/trendingskills/model/searchSkillModel.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:educationapp/trendingskills/views/model.review/addreview.model.dart';
import 'package:educationapp/trendingskills/views/service.review/addreview.service.dart';
import 'package:educationapp/wallet/model.wallet/wallet.model.dart';
import 'package:educationapp/wallet/service.wallet/wallet.service.dart';

class ApiController {
  static Future<AllMentorsModel> fetchMentors(HomeService service) async {
    return await service.allMentors(MentorsModelBody(userType: 'student'));
  }

  static Future<SkillsModel> getAllSkilss(SkillService service) async {
    return await service.getALLSiklls();
  }

  static Future<AddReviewModel> getAllReview(
      Map<String, dynamic> params) async {
    AddreviewService service = params['service'];
    String id = params['id'];
    return await service.getAllReview(id);
  }

  static Future<AllUniModel> getallCollage(CollageService service) async {
    return await service.getAllCollages();
  }

  static Future<PerticulerCollageModel> getPerticulerCollage(
      Map<String, dynamic> params) async {
    CollageService service = params['service'];
    String id = params['id'];
    return await service.getPErticulerCollage(id);
  }

  static Future<NewSkillsModel> getNewAllSkills(
      Map<String, dynamic> params) async {
    SkillService service = params['service'];
    String id = params['id'];
    return await service.getNewAllSkills(id);
  }

  static Future<WalletModel> getAllWallet(WalletService service) async {
    return await service.getAlltransaction();
  }

  static Future<SearchSkillModel> searchSkill(Map<String, dynamic> params) async {
    SearchSkillService service = params['service'];
    String query = params['query'];
    return await service.getAllSearchSkill(query);
  }
}
