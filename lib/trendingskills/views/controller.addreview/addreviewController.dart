import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/trendingskills/views/service.review/addreview.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addreviewProvider = FutureProvider((ref) async {
  final addreviewService = AddreviewService(await createDio());
  return addreviewService.getAllReview();
});
