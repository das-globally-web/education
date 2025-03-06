import 'dart:developer';
import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/collegeReviews/controller/collage.controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/userprofile.model.dart';
import 'package:educationapp/login/views/login.page.dart';
import 'package:educationapp/trendingskills/controller/sikllscontroller.dart';
import 'package:educationapp/wallet/walletController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

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

  static Future<void> clearData() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }

    // Clear app storage
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }

    log("App data cleared");
    final container = ProviderContainer();
    container.dispose();
    container.invalidate(skilssProvide);
    container.invalidate(walletProvider);
    container.invalidate(homeMentorsProvider);
    container.invalidate(callagesProviders);
    container.invalidate(companyReviewProvider);
    var box = Hive.box('userdata');
    await box.clear();
  
  }
}
