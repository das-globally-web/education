import 'dart:io';

import 'package:educationapp/config/helpers.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:educationapp/localstorage/db.dart';
import 'package:educationapp/localstorage/localdb.dart';
import 'package:educationapp/splash/views/splash.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the application document directory
  final Directory appDocDir = await getApplicationDocumentsDirectory();

  // Create a subdirectory for Hive storage
  final Directory hiveDirectory = Directory('${appDocDir.path}/hive_data');
  if (!hiveDirectory.existsSync()) {
    hiveDirectory.createSync(recursive: true); // Create the directory if it doesn't exist
  }

  Hive.init(hiveDirectory.path); // Initialize Hive with the custom directory
  Hive.registerAdapter(UserAdapter()); // Register your generated adapter
  await Hive.openBox('mybox'); // Open your Hive box

  runApp(ProviderScope(child: const MyApp())); // Assuming you're using Riverpod
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return SizedBox();
    final userBox = Hive.box<User>('mybox');
    final user = userBox.get('user1');
    return ScreenUtilInit(
      designSize: const Size(440, 956), // Set your design dimensions
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          home: user == null ? SplashScreen() : HomePage(),
        );
      },
    );
  }
}
