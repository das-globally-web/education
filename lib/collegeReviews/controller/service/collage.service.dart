import 'package:dio/dio.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:retrofit/retrofit.dart';

part "collage.service.g.dart";
@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class CollageService {
  factory CollageService(Dio dio, {String baseUrl}) = _CollageService;
  @GET('/api/collages')
  Future<AllUniModel> getAllCollages();
}
