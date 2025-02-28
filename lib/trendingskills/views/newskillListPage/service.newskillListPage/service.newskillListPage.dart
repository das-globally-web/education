import 'package:dio/dio.dart';
import 'package:educationapp/trendingskills/views/newskillListPage/model.newskillListpage/newskillListModel.dart';
import 'package:retrofit/retrofit.dart';

part 'service.newskillListPage.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class Servicenewskilllistpage {
  factory Servicenewskilllistpage(Dio dio, {String baseUrl}) =
      _Servicenewskilllistpage;

  @GET('/api/user-data/{id}')
  Future<NewskillListPageModel> getAllNewSkillListPage(@Path('id') String id);
}
