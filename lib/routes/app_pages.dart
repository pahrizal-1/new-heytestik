// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/home/home_page.dart';
import 'package:heystetik_mobileapps/pages/onboarding/splash_screen_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/stream_home_page.dart';
import 'package:heystetik_mobileapps/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomepageCutomer(),
    ),
    GetPage(
      name: Routes.NEWS,
      page: () => StreamHomePage(
        index: 1,
      ),
    ),
  ];
}
