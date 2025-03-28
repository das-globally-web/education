import 'package:dio/dio.dart';
import 'package:educationapp/trendingskills/views/model.review/review.model.dart';
import 'package:retrofit/retrofit.dart';

part 'review.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class AddreviewService {
  factory AddreviewService(Dio dio, {String baseUrl}) = _AddreviewService;

  @GET('/api/reviews/{id}')
  Future<AddReviewModel> getAllReview(@Path("id") String id);
}
