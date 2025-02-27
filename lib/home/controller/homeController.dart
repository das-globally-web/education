import 'dart:developer';
import 'package:educationapp/CORE/api_controller.dart';
import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/home/model/userprofile.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

final apiClientProvider = FutureProvider<HomeService>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return HomeService(dio);
});

final homeMentorsProvider = FutureProvider<AllMentorsModel>((ref) async {
  final client = await ref.watch(apiClientProvider.future);
  return await compute(ApiController.fetchMentors, client);
});

final companyReviewProvider = FutureProvider((ref) async {
  final companyreviewservice = HomeService(await createDio());
  return companyreviewservice.getAllcompanyReview();
});

final saveUserProfileDataToLocalProvider =
    FutureProvider.family<bool, String>((ref, token) async {
  if (!Hive.isBoxOpen('userdata')) {
    await Hive.openBox('userdata');
  }
  var box = Hive.box('userdata');
  box.put('token', token);
  StoreData.fsavedata();
  return true;
});

// Riverpod provider

class StoreData {
  static void logic(Map<dynamic, String> data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', data['name'].toString());
    preferences.setString('email', data['email'].toString());
    preferences.setString('pic', data['pic'].toString());
  }

  static void fsavedata() async {
    log("Saveing data to local");
    final homeService = HomeService(await createDio());
    USerProfieModel profiledata = await homeService.userProfileGet();
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
    var box = Hive.box('userdata');
    box.put(
      "name",
      profiledata.data.fullName,
    );
    box.put("email", profiledata.data.email);
    box.put("pic", profiledata.data.profilePic);
    box.put("id", profiledata.data.id);
    // logic({
    //   "name": profiledata.data.fullName,
    //   "email": profiledata.data.email,
    //   "pic": profiledata.data.profilePic,
    // });
  }

  static Future<Map<dynamic, String>> fetchData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return {
      "name": preferences.getString('name').toString(),
      "email": preferences.getString('email').toString(),
      "pic": preferences.getString('pic').toString(),
    };
  }
}
