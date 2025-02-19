import 'package:dio/dio.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewBodyModel.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewResponseModel.dart';
import 'package:retrofit/retrofit.dart';

part 'addreview.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class AddreviewService {
  factory AddreviewService(Dio dio, {String baseUrl}) = _AddreviewService;

  @POST('/api/reviews')
  Future<AddReviewResponseModel> getAllReview(@Body() AddReviewBodyModel body);
}
