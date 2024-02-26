// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/poto_wajah_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';

class CameraWajahSettingsPage extends StatefulWidget {
  const CameraWajahSettingsPage({super.key});

  @override
  State<CameraWajahSettingsPage> createState() =>
      _CameraWajahSettingsPageState();
}

class _CameraWajahSettingsPageState extends State<CameraWajahSettingsPage> {
  final ProfileController state = Get.put(ProfileController());
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  int direction = 0;
  @override
  void initState() {
    loadCamera(direction);
    super.initState();
  }

  loadCamera(int direction) async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![direction], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print('NO any camera found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Foto Wajah',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Column(
          children: [
            Stack(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  height: 500,
                  width: 516,
                  child: controller == null
                      ? const Center(child: Text('Loading Camera...'))
                      : !controller!.value.isInitialized
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CameraPreview(controller!),
                ),
                Center(
                    child: Container(
                  height: 500,
                  width: 516,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/bingkai-icons.png'))),
                )),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Pastikan wajahmu terlihat jelas dan berada di dalam bingkai ini.',
                style: whiteTextStyle.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/icons/refresh-icons.png',
                  width: 24,
                  color: Colors.transparent,
                  height: 24,
                ),
                Obx(
                  () => state.isLoadingCam.value
                      ? LoadingMore()
                      : InkWell(
                          onTap: () async {
                            state.isLoadingCam.value = true;
                            if (controller != null) {
                              //check if contrller is not null
                              if (controller!.value.isInitialized) {
                                //check if controller is initialized
                                image = await controller!
                                    .takePicture(); //capture image
                                state.facePhoto = File(image!.path);
                                setState(() {});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PotoWajahPage(),
                                  ),
                                );
                              }
                            }
                            state.isLoadingCam.value = false;
                          },
                          child: Image.asset(
                            'assets/icons/button-camera.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      direction = direction == 0 ? 1 : 0;
                      loadCamera(direction);
                    });
                  },
                  child: Image.asset(
                    'assets/icons/refresh-icons.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
