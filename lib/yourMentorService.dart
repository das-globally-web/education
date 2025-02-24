import 'package:dio/dio.dart';
import 'package:educationapp/yourMentorModel.dart';
import 'package:retrofit/retrofit.dart';

part 'yourMentorService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class YourMentorService {
  factory YourMentorService(Dio dio, {String baseUrl}) = _YourMentorService;

  @GET('/api/getMentors/{id}')
  Future<YourMentorModel> getAllMentor(@Path('id') String id);
}
