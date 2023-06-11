import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/auth/login_controller.dart';
import 'package:heystetik_mobileapps/controller/auth/register_controller.dart';
import 'package:heystetik_mobileapps/controller/slideshow/slideshow_controller.dart';
import 'package:heystetik_mobileapps/pages/onboarding/splash_screen_page.dart';
import 'package:provider/provider.dart';

import 'controller/interest/interest_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider<RegisterController>(
          create: (context) => RegisterController(),
        ),
        ChangeNotifierProvider<SlideShowController>(
          create: (context) => SlideShowController(),
        ),
        ChangeNotifierProvider<InterestController>(
          create: (context) => InterestController(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Heystetik Aplication',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreenPage(),
      ),
    );
  }
}
