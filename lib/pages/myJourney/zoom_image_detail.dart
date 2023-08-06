import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widget/poto_my_journey_widgets.dart';

class ZoomImageDetail extends StatefulWidget {
  const ZoomImageDetail({super.key});

  @override
  State<ZoomImageDetail> createState() => _ZoomImageDetailState();
}

final zoomTransformationController = TransformationController();

void _resetZoom() {
  zoomTransformationController.value = Matrix4.identity();
  print('reset zoom');
}

class _ZoomImageDetailState extends State<ZoomImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 20,
                height: 20,
                color: whiteColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  InteractiveViewer(
                    transformationController: zoomTransformationController,
                    child: Container(
                      height: 450,
                      width: 179,
                      child: Image.asset(
                        'assets/images/wajah.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 400.2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(86),
                          bottomRight: Radius.circular(86),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 6, top: 7),
                      height: 36,
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Journey - Jerawat',
                            style: blackTextStyle.copyWith(fontSize: 8.67),
                          ),
                          Text(
                            '12 Feb 2023; 17:30 WIB',
                            style:
                                blackRegulerTextStyle.copyWith(fontSize: 8.67),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 2,
                height: 450,
                color: whiteColor,
              ),
              Stack(
                children: [
                  InteractiveViewer(
                    transformationController: zoomTransformationController,
                    child: Container(
                      height: 450,
                      width: 170,
                      child: Image.asset(
                        'assets/images/wajah.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200.2,
                    left: 120,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            shape: BoxShape.circle),
                        height: 36,
                        width: 110,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: whiteColor,
                        )),
                  ),
                  Positioned(
                    top: 400.2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(86),
                          bottomRight: Radius.circular(86),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 6, top: 7),
                      height: 36,
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Journey - Jerawat',
                            style: blackTextStyle.copyWith(fontSize: 8.67),
                          ),
                          Text(
                            '12 Feb 2023; 17:30 WIB',
                            style:
                                blackRegulerTextStyle.copyWith(fontSize: 8.67),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _resetZoom();
                    });
                  },
                  child: Image.asset(
                    'assets/icons/icons-back.png',
                    width: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
