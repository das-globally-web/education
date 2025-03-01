import 'dart:developer';

import 'package:educationapp/home/views/home.page.dart';

import 'package:educationapp/splash/views/splash.page.dart';
import 'package:educationapp/yourMentor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive with a custom directory
  // await initializeHive();
  await Hive.initFlutter();
  if (!Hive.isBoxOpen('userdata')) {
    await Hive.openBox('userdata');
  }
  var box = Hive.box('userdata');

  runApp(const ProviderScope(child: MyApp()));
}

// Function to initialize Hive

// HiveManager for centralized box management

// Main App Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userdata');
    var token = box.get('token');
    log("/////////////////////////////////////////////");
    log(token.toString());
    return ScreenUtilInit(
      designSize: const Size(440, 956), // Set your design dimensions
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          home: token == null ? const SplashScreen() : const HomePage(),
          // home: YourMentorPage(),
        );
      },
    );
  }
}

class MyFormData {
  static String userType = '';
  static String serviceType = '';
  static int skillId = 0;
}


class MyFormDataModel {
  final String userType;
  final String serviceType;
  final String skillId;

  MyFormDataModel({
    required this.userType,
    required this.serviceType,
    required this.skillId,
  });

  // Optionally, add a method to copy the object if you need to update one field
  MyFormDataModel copyWith({
    String? userType,
    String? serviceType,
    String? skillId,
  }) {
    return MyFormDataModel(
      userType: userType ?? this.userType,
      serviceType: serviceType ?? this.serviceType,
      skillId: skillId ?? this.skillId,
    );
  }
}



// Define the StateNotifier for MyFormDataModel
class FormDataNotifier extends StateNotifier<MyFormDataModel> {
  FormDataNotifier()
      : super(MyFormDataModel(userType: '', serviceType: '', skillId: ''));

  // Method to update the userType
  void updateUserType(String userType) {
    state = state.copyWith(userType: userType);
  }

  // Method to update the serviceType
  void updateServiceType(String serviceType) {
    state = state.copyWith(serviceType: serviceType);
  }

  // Method to update the skillId
  void updateSkillId(String skillId) {
    state = state.copyWith(skillId: skillId);
  }
}

final formDataProvider = StateNotifierProvider<FormDataNotifier, MyFormDataModel>((ref) {
  return FormDataNotifier();
});