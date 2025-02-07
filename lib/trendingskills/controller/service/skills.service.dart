import 'package:educationapp/trendingskills/model/new.skills.model.dart';
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'skills.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class SkillService {
  factory SkillService(Dio dio, {String baseUrl}) = _SkillService;

  @GET('/api/get-all-skills')
  Future<SkillsModel> getALLSiklls();

  @GET('/api/getskills-mentor/{id}')
  Future<NewSkillsModel> getNewAllSkills(@Path('id') String id);
}
