import 'dart:developer';
import 'package:educationapp/CORE/notification_controller.dart';
import 'package:educationapp/firebase_options.dart';
import 'package:educationapp/home/views/home.page.dart';
import 'package:educationapp/splash/views/splash.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  var androidInitialize =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: androidInitialize);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("Message received: ${message.notification?.title}");
    if (message.notification != null) {
      showNotification(message.notification!);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    log("User tapped on notification: ${message.data}");
  });

  try {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
  } catch (e) {
    log("Hive initialization failed: $e");
  }

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> showNotification(RemoteNotification notification) async {
  var androidDetails = AndroidNotificationDetails(
    'channelId',
    'channelName',
    importance: Importance.high,
    priority: Priority.high,
  );
  var notificationDetails = NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.show(
    0,
    notification.title,
    notification.body,
    notificationDetails,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      log('User denied permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userdata');
    var token = box.get('token');
    if (kDebugMode) {
      log("Token: $token");
    }
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          home: token == null ? const SplashScreen() : const HomePage(),
        );
      },
    );
  }
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

class FormDataNotifier extends StateNotifier<MyFormDataModel> {
  FormDataNotifier()
      : super(MyFormDataModel(userType: '', serviceType: '', skillId: ''));

  void updateUserType(String userType) {
    state = state.copyWith(userType: userType);
  }

  void updateServiceType(String serviceType) {
    state = state.copyWith(serviceType: serviceType);
  }

  void updateSkillId(String skillId) {
    state = state.copyWith(skillId: skillId);
  }
}

final formDataProvider =
    StateNotifierProvider<FormDataNotifier, MyFormDataModel>((ref) {
  return FormDataNotifier();
});
