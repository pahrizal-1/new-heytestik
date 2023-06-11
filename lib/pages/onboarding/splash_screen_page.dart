import 'dart:async';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:video_player/video_player.dart';
import 'package:heystetik_mobileapps/pages/onboarding/onboarding1_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/videos/splashvideo.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then(
        (_) => controller.play(),
      );
    Timer(const Duration(milliseconds: 5500), () async {
      String? token = await LocalStorage().getAccessToken();
      if (token == null || token == '') {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const OnBoarding1Page(),
            ),
          );
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const TabBarCustomer(),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 140,
          width: 250,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
