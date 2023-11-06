// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/home/home_page.dart';
import 'package:heystetik_mobileapps/pages/onboarding/splash_screen_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomepageCutomer(),
    ),
    GetPage(
      name: Routes.NEWS,
      page: () => const TabBarCustomer(
        currentIndex: 2,
        streamIndex: 1,
      ),
    ),
  ];
}
