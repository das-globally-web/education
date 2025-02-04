import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/model.review/addreview.model.dart';
import 'package:educationapp/trendingskills/views/service.review/addreview.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addreviewProvider = FutureProviderFamily<AddReviewModel, String>((ref, id) async {
  final addreviewService = AddreviewService(await createDio());
  return addreviewService.getAllReview(id);
});
