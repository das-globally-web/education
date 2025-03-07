import 'package:dio/dio.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:educationapp/collegeReviews/model/perticuler.collage.model.dart';

import 'package:retrofit/retrofit.dart';

part "collage.service.g.dart";

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class CollageService {
  factory CollageService(Dio dio, {String baseUrl}) = _CollageService;
  @GET('/api/collages?city=')
  Future<AllUniModel> getAllCollages();
  @GET('/api/collages/{id}')
  Future<PerticulerCollageModel> getPErticulerCollage(@Path('id') String id);
}
