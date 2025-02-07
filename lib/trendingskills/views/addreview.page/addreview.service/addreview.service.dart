import 'package:dio/dio.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewBodyModel.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewResponseModel.dart';
import 'package:retrofit/retrofit.dart';

part 'addreview.service.g.dart';

@RestApi(baseUrl: 'http://education.globallywebsolutions.com')
abstract class AddreviewPageService {
  factory AddreviewPageService(Dio dio, {String baseUrl}) = _AddreviewPageService;

  @POST('/api/reviews')
  Future<AddreviewResponseModel> getReviewPage(@Body() AddreviewBodyModel body);
}
