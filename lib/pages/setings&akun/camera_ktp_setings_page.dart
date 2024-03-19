// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/poto_ktp_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../theme/theme.dart';

class CameraCutomeKTP extends StatefulWidget {
  const CameraCutomeKTP({super.key});

  @override
  State<CameraCutomeKTP> createState() => _CameraCutomeKTPState();
}

class _CameraCutomeKTPState extends State<CameraCutomeKTP> {
  final ProfileController state = Get.put(ProfileController());
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  int direction = 0;
  FlashMode flashMode = FlashMode.off;

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
      print("NO any camera found");
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
                  'Foto KTP',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: controller == null
                  ? const Center(child: Text("Loading Camera..."))
                  : !controller!.value.isInitialized
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CameraPreview(controller!),
            ),
          ),
          const SizedBox(
            height: 39,
          ),
          Text(
            'Pastikan KTP mu terlihat jelas di dalam bingkai foto ini.',
            style: whiteTextStyle.copyWith(fontSize: 13),
          ),
          const SizedBox(
            height: 39,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        if (flashMode == FlashMode.off) {
                          controller?.setFlashMode(FlashMode.always);
                          flashMode = FlashMode.always;
                        } else {
                          controller?.setFlashMode(FlashMode.off);
                          flashMode = FlashMode.off;
                        }
                      });
                    },
                    child: flashMode == FlashMode.off
                        ? const Icon(Icons.flash_off)
                        : const Icon(Icons.flash_on)),
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
                                state.idCardPhoto = File(image!.path);
                                setState(() {});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PotoKtp(),
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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
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
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 39,
          ),
        ],
      ),
    );
  }
}
