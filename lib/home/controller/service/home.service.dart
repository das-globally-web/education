import 'package:educationapp/config/const.data.dart';
import 'package:educationapp/home/model/allmentors.model.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/login/model/login.body.model.dart';
import 'package:educationapp/login/model/login.rsponse.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
part 'home.service.g.dart';



@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @POST('/api/user')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  })
  Future<AllMentorsModel> allMentors(@Body() MentorsModelBody body);
}
