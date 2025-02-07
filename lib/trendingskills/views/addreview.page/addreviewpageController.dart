import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreview.service/addreview.service.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewBodyModel.dart';
import 'package:educationapp/trendingskills/views/addreview.page/addreviewResponseModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addreviewpage =
    FutureProvider.family<AddreviewResponseModel, AddreviewBodyModel>(
        (ref, body) async {
  final addreview = AddreviewPageService(await createDio());
  return addreview.getReviewPage(body);
});
