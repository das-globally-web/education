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

final saveUserProfileDataToLocalProvider = FutureProvider<String>((ref) async {
  final homeService = HomeService(await createDio());
  USerProfieModel profiledata = await homeService.userProfileGet();
  Hive.isBoxOpen('userdata');
  var box = Hive.box('userdata');
  box.put('name', profiledata.data.fullName);
  return profiledata.data.fullName;
});

final userDataProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

@immutable
class User {
  final String name;
  final String email;
  final String token;
  const User({required this.name, required this.email, required this.token});

  // Create a copyWith method to modify properties immutably
  User copyWith({String? name, String? email, String? token}) {
    return User(
        name: name ?? this.name,
        email: email ?? this.email,
        token: token ?? this.token);
  }
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(User(name: ' ', email: ' ', token: ' ')); // Initial state
  void setName(String name) {
    state.copyWith(name: name);
  }

  void setToken(String token) {
    state.copyWith(token: token);
  }

  void setEmail(String email) {
    state.copyWith(email: email);
  }
}
