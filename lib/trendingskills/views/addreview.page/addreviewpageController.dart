import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreview.service/addreview.service.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewBodyModel.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewResponseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addreviewpageProvider =
    FutureProvider.autoDispose.family<AddReviewResponseModel, AddReviewBodyModel>(
        (ref, body) async {
  final addreviewservice = AddreviewService(await createDio());
  return addreviewservice.getAllReview(body);
});
