import 'dart:developer';
import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/userprofile.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final apiClientProvider = FutureProvider.autoDispose<HomeService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return HomeService(dio);
});

final homeMentorsProvider =
    FutureProvider.autoDispose<AllMentorsModel>((ref) async {
  final client = await ref.watch(apiClientProvider.future);
  return await compute(ApiController.fetchMentors, client);
});

final companyReviewProvider = FutureProvider.autoDispose((ref) async {
  final companyreviewservice = HomeService(await createDio());
  return companyreviewservice.getAllcompanyReview();
});

final saveUserProfileDataToLocalProvider =
    FutureProvider.autoDispose.family<bool, String>((ref, token) async {
  return true;
});

class StoreData {
  static Future<bool> logic(String token) async {
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
    var box = Hive.box('userdata');
    await box.put('token', token);
    await StoreData.fsavedata();
    return true;
  }

  static Future<void> fsavedata() async {
    log("Saveing data to local");
    final homeService = HomeService(await createDio());
    USerProfieModel profiledata = await homeService.userProfileGet();
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
    var box = Hive.box('userdata');
    await box.put(
      "name",
      profiledata.data.fullName,
    );
    await box.put("email", profiledata.data.email);
    await box.put("pic", profiledata.data.profilePic);
    await box.put("id", profiledata.data.id);
  }
}
