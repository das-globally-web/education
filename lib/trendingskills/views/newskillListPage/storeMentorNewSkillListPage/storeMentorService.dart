import 'package:dio/dio.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/storeMentorNewSkillListPage/storeMentorBodyModel.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/storeMentorNewSkillListPage/storeMentorResModel.dart';
import 'package:retrofit/retrofit.dart';

part 'storeMentorService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class StoreMentorService {
  factory StoreMentorService(Dio dio, {String baseUrl}) = _StoreMentorService;

  @POST('/api/storeMentors')
  Future<StoreMentorResModel> getAllStoreMentor(
      @Body() StoreMentorBodyModel body);
}
