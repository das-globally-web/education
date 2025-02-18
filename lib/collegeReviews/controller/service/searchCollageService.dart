import 'package:dio/dio.dart';
import 'package:educationapp/collegeReviews/model/searchCollageModel.dart';
import 'package:retrofit/retrofit.dart';

part 'searchCollageService.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class SearchCollageService {
  factory SearchCollageService(Dio dio, {String baseUrl}) =
      _SearchCollageService;

  @GET('/api/college-search/"collage')
  Future<SearchCollageModel> getAllSearchCollage(
      @Path('collage') String collage);
}
