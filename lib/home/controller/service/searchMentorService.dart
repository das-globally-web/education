import 'package:dio/dio.dart';
import 'package:educationapp/home/model/searchMentorModel.dart';
import 'package:retrofit/retrofit.dart';

part 'searchMentorService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class SearchMentorService {
  factory SearchMentorService(Dio dio, {String baseUrl}) = _SearchMentorService;

  @GET('/api/mentor-search/{query}')
  Future<SearchMentorModel> getallSearchMentor(@Path("query") String query);
}
