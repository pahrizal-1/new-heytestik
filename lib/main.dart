import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/auth/login_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/register/register_controller.dart';
import 'package:heystetik_mobileapps/controller/doctor/home/home_controller.dart';
import 'package:heystetik_mobileapps/pages/home/notifikasion_page.dart';
import 'package:heystetik_mobileapps/pages/onboarding/splash_screen_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/komentar_stream_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_doctor.dart';
import 'package:heystetik_mobileapps/routes/app_pages.dart';
import 'package:heystetik_mobileapps/routes/init_dynamic_link.dart';
import 'package:heystetik_mobileapps/service/doctor/consultation/notif_service.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:provider/provider.dart';

import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print("FIREBASE MESSAGING BACKGROUND HANDLER");
  print("NOTIF DI TAP NIHH ${message.toMap()}");
  print('SASASA ${message.data}');
  print('SASASA JENIS ${message.data['type']}');

  if (message.data['type'] == "GENERAL") {
    print('INI NOTIF GENERAL');
    Get.to(() => NotifikasionPage());
  } else if (message.data['type'] == "TRANSACTION_CONSULTATION_SUCCESS") {
    print('INI NOTIF TRANSACTION_CONSULTATION_SUCCESS');
    Get.to(() => const TabBarCustomer(currentIndex: 1));
  } else if (message.data['type'] == "CONSULTATION_DOCTOR_SCHEDULE") {
    print('INI NOTIF CONSULTATION_DOCTOR_SCHEDULE');
    Get.to(() => const TabBarDoctor());
  } else if (message.data['type'] == "CONSULTATION_REVIEW") {
    print('INI NOTIF CONSULTATION_REVIEW');
    Get.to(() => const TabBarCustomer(currentIndex: 1));
  } else if (message.data['type'] == "CHAT") {
    print('INI NOTIF CHAT');
    Get.to(() => const TabBarCustomer(currentIndex: 1));
  } else if (message.data['type'] == "STREAM_LIKE" ||
      message.data['type'] == "STREAM_COMMENT" ||
      message.data['type'] == "STREAM_COMMENT_LIKE" ||
      message.data['type'] == "STREAM_COMMENT_REPLY" ||
      message.data['type'] == "STREAM_COMMENT_REPLY_LIKE" ||
      message.data['type'] == "STREAM_VOTE") {
    print("INI NOTIF ${message.data['type']}");
    Get.to(
      () => KomentarStreamPage(
        postId: int.parse(
          message.data['stream_id'].toString(),
        ),
      ),
    );
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'High Importance Notifications',
  importance: Importance.max,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("ON MESSAGE OPENED APP");
    print("NOTIF DI TAP NIHH ${message.toMap()}");
    print('SISISI ${message.data}');
    print('SISISI JENIS ${message.data['type']}');

    if (message.data['type'] == "GENERAL") {
      print('INI NOTIF GENERAL');
      Get.to(() => NotifikasionPage());
    } else if (message.data['type'] == "TRANSACTION_CONSULTATION_SUCCESS") {
      print('INI NOTIF TRANSACTION_CONSULTATION_SUCCESS');
      Get.to(() => const TabBarCustomer(currentIndex: 1));
    } else if (message.data['type'] == "CONSULTATION_DOCTOR_SCHEDULE") {
      print('INI NOTIF CONSULTATION_DOCTOR_SCHEDULE');
      Get.to(() => const TabBarDoctor());
    } else if (message.data['type'] == "CONSULTATION_REVIEW") {
      print('INI NOTIF CONSULTATION_REVIEW');
      Get.to(() => const TabBarCustomer(currentIndex: 1));
    } else if (message.data['type'] == "CHAT") {
      print('INI NOTIF CHAT');
      Get.to(() => const TabBarCustomer(currentIndex: 1));
    } else if (message.data['type'] == "STREAM_LIKE" ||
        message.data['type'] == "STREAM_COMMENT" ||
        message.data['type'] == "STREAM_COMMENT_LIKE" ||
        message.data['type'] == "STREAM_COMMENT_REPLY" ||
        message.data['type'] == "STREAM_COMMENT_REPLY_LIKE" ||
        message.data['type'] == "STREAM_VOTE") {
      print("INI NOTIF ${message.data['type']}");
      Get.to(
        () => KomentarStreamPage(
          postId: int.parse(
            message.data['stream_id'].toString(),
          ),
        ),
      );
    }
  });

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  await FirebaseMessaging.instance.subscribeToTopic("all");
  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print("ON MESSAGE");
    print("NOTIF DI TAP NIHH ${message.toMap()}");
    print('SUSUSU ${message.data}');
    print('SUSUSU JENIS ${message.data['type']}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification?.toMap()}');
      Get.put(DoctorHomeController()).isNotifications.value = true;
    }

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelShowBadge: true,
            channelDescription: channel.description,
            importance: Importance.max,
            priority: Priority.max,
            icon: android.smallIcon,
            // other properties...
          ),
        ),
      );
    }
  });

  initDynamicLinks();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginController>(
            create: (context) => LoginController(),
          ),
          ChangeNotifierProvider<RegisterController>(
            create: (context) => RegisterController(),
          ),
        ],
        child: GetMaterialApp(
          title: 'Heystetik Mobile Apps',
          theme: ThemeData(),
          // initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          home: const SplashScreenPage(),
        ),
      ),
    );
  }
}
