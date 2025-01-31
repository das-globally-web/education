
import 'package:educationapp/trendingskills/model/skills.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
part 'skills.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class SkillsService {
  factory SkillsService(Dio dio, {String baseUrl}) = _SkillsService;

  @GET('/api/get-all-skills')

  Future<SkillsModel> getALLSiklls();
}
