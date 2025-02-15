import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/model.review/addreview.model.dart';
import 'package:educationapp/trendingskills/views/service.review/addreview.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientReviewProvider = FutureProvider<AddreviewService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return AddreviewService(dio);
});

final addreviewProvider =
    FutureProviderFamily<AddReviewModel, String>((ref, id) async {
  final client = await ref.watch(apiClientReviewProvider.future);

  return await compute(
      ApiController.getAllReview, {'service': client, 'id': id});
});
