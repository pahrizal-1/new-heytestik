import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/poto_ktp_page.dart';

import '../../theme/theme.dart';

class CameraCutomeKTP extends StatefulWidget {
  const CameraCutomeKTP({super.key});

  @override
  State<CameraCutomeKTP> createState() => _CameraCutomeKTPState();
}

class _CameraCutomeKTPState extends State<CameraCutomeKTP> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image
  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
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
          Container(
            height: 290,
            width: 516,
            child: controller == null
                ? const Center(child: Text("Loading Camera..."))
                : !controller!.value.isInitialized
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(controller!),
          ),
          SizedBox(
            height: 135,
          ),
          Text(
            'Pastikan KTP mu terlihat jelas di dalam bingkai foto ini.',
            style: whiteTextStyle.copyWith(fontSize: 13),
          ),
          const SizedBox(
            height: 39,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 73, right: 73),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icons/refresh-icons.png',
                  width: 24,
                  color: Colors.transparent,
                  height: 24,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      if (controller != null) {
                        //check if contrller is not null
                        if (controller!.value.isInitialized) {
                          //check if controller is initialized
                          image =
                              await controller!.takePicture(); //capture image
                          setState(() {
                            //update UI
                          });
                        }
                      }
                    } catch (e) {
                      print(e); //show error
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PotoKtp()));
                  },
                  child: Image.asset(
                    'assets/icons/button-camera.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                Image.asset(
                  'assets/icons/refresh-icons.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
