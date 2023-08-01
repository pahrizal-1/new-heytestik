import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/splash_screen.dart/splashscreen_controller.dart';
import 'package:video_player/video_player.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late VideoPlayerController controller;
  final SplashScreenController state = Get.put(SplashScreenController());

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/videos/splashvideo.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then(
        (_) => controller.play(),
      );

    state.init(context);
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
          height: 100,
          width: 200,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
