import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/yourMentorModel.dart';
import 'package:educationapp/yourMentorService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final yourMentorProvider =
    FutureProvider.family<YourMentorModel, String>((ref, id) async {
  final yourmentorservice = YourMentorService(await createDio());
  return yourmentorservice.getAllMentor(id);
});
