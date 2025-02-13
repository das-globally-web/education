import 'package:educationapp/config/preety.dio.dart';
import 'package:educationapp/findmentor/model/allmentors.model.dart';
import 'package:educationapp/home/controller/service/home.service.dart';
import 'package:educationapp/collegeReviews/model/allmentors.model.dart';
import 'package:educationapp/home/model/mentors.model.dart';
import 'package:educationapp/home/model/userprofile.model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final homeMentorsProvider = FutureProvider<AllMentorsModel>((ref) async {
  final homeService = HomeService(await createDio());
  return homeService.allMentors(MentorsModelBody(userType: "student"));
});

final saveUserProfileDataToLocalProvider = FutureProvider<bool>((ref) async {
  final homeService = HomeService(await createDio());
  USerProfieModel profiledata = await homeService.userProfileGet();
  final userNotifier = ref.read(userProvider.notifier);
  userNotifier.updateUser('name', profiledata.data.fullName);
  userNotifier.updateUser('token', profiledata.data.token);
  userNotifier.updateUser('email', profiledata.data.email);
  userNotifier.updateUser('pic', profiledata.data.profilePic);
  return true;
});

class UserNotifier extends StateNotifier<Map<String, String>> {
  UserNotifier() : super({}) {
    _initUserData();
  }

  // Initialize Hive Box
  Future<void> _initUserData() async {
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
    var box = Hive.box('userdata');

    // Load initial values from Hive
    state = {
      'name': box.get('name', defaultValue: ''),
      'token': box.get('token', defaultValue: ''),
      'email': box.get('email', defaultValue: ''),
      'pic': box.get('pic', defaultValue: ''),
    };
  }

  // Set and update a field in Hive
  void updateUser(String key, String value) {
    var box = Hive.box('userdata');
    box.put(key, value);

    // Update state
    state = {...state, key: value};
  }
}

// Riverpod provider
final userProvider = StateNotifierProvider<UserNotifier, Map<String, String>>(
  (ref) => UserNotifier(),
);
