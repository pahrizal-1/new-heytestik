import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/hasil_poto_wajah_kanan_presassement.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';

class CameraWajahKananPreassesmnet extends StatefulWidget {
  const CameraWajahKananPreassesmnet({super.key});

  @override
  State<CameraWajahKananPreassesmnet> createState() =>
      _CameraWajahKananPreassesmnetState();
}

class _CameraWajahKananPreassesmnetState
    extends State<CameraWajahKananPreassesmnet> {
  final OrderConsultationController state =
      Get.put(OrderConsultationController());

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
      controller = CameraController(cameras![direction], ResolutionPreset.high);
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: controller == null
                  ? Center(
                      child: Text(
                        'Loading Camera...',
                        style: whiteTextStyle.copyWith(fontSize: 10),
                      ),
                    )
                  : !controller!.value.isInitialized
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CameraPreview(controller!),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/bg-poto-bagian-kiri.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.transparent,
                  ),
                  Text(
                    'Wajah Kanan',
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/danger-icons.png',
                      width: 18,
                      height: 18,
                      color: whiteColor,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/my-journey.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 61,
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
                                    state.initialConditionRightSide =
                                        File(image!.path);
                                    setState(() {});
                                    Get.to(HasilWajahKananPreassesment());
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
                    SizedBox(
                      width: 61,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          setState(() {
                            direction = direction == 0 ? 1 : 0;
                            loadCamera(direction);
                          });
                        });
                      },
                      child: Image.asset(
                        'assets/icons/refresh-icons.png',
                        width: 29,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
