import 'dart:developer';
import 'dart:io';

import 'package:educationapp/config/helpers.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:educationapp/localstorage/db.dart';
import 'package:educationapp/localstorage/localdb.dart';
import 'package:educationapp/splash/views/splash.page.dart';
import 'package:educationapp/yourMentor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

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
          // home: token == null ? const SplashScreen() : const HomePage(),
        home: YourMentorPage(),
        );
      },
    );
  }
}
