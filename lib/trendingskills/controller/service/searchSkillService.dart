import 'package:dio/dio.dart';
import 'package:educationapp/trendingskills/model/searchSkillModel.dart';
import 'package:retrofit/retrofit.dart';

part 'searchSkillService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class SearchSkillService {
  factory SearchSkillService(Dio dio, {String baseUrl}) = _SearchSkillService;

  @GET('/api/getskills-search/{test}')
  Future<SearchSkillModel> getAllSearchSkill(@Path("test") String test);
}
