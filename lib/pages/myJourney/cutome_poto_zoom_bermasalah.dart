import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/myJourney/hasil_poto_wajah_bermasalah.dart';
import '../../theme/theme.dart';

class CustomeCameaPotoWajahBermasalah extends StatefulWidget {
  const CustomeCameaPotoWajahBermasalah({super.key});

  @override
  State<CustomeCameaPotoWajahBermasalah> createState() =>
      _CustomeCameaPotoWajahBermasalahState();
}

class _CustomeCameaPotoWajahBermasalahState
    extends State<CustomeCameaPotoWajahBermasalah> {
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
            // ignore: sized_box_for_whitespace
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

            Positioned(
              top: 20,
              left: 70,
              child: Row(
                children: [
                  Text(
                    'Zoom Bagian Bermasalah',
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    width: 40,
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
                    InkWell(
                      onTap: () async {
                        try {
                          if (controller != null) {
                            //check if contrller is not null
                            if (controller!.value.isInitialized) {
                              //check if controller is initialized
                              image = await controller!
                                  .takePicture(); //capture image
                              setState(() {
                                //update UI
                              });
                            }
                          }
                        } catch (e) {
                          print(e); //show error
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PotoBagianWajahBermasalah()));
                      },
                      child: Image.asset(
                        'assets/icons/button-camera.png',
                        width: 70,
                        height: 70,
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
