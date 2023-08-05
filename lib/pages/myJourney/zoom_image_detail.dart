import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widget/poto_my_journey_widgets.dart';

class ZoomImageDetail extends StatelessWidget {
  const ZoomImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 21),
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 20,
                height: 20,
                color: whiteColor,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/wajah.png',
                              width: 195, height: 700),
                          Positioned(
                            top: 500.2,
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
                                    style:
                                        blackTextStyle.copyWith(fontSize: 8.67),
                                  ),
                                  Text(
                                    '12 Feb 2023; 17:30 WIB',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 8.67),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 390,
                        width: 2,
                        color: whiteColor,
                      ),
                      Stack(
                        children: [
                          Image.asset('assets/images/wajah.png',
                              width: 195, height: 700),
                          Positioned(
                            top: 500.2,
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
                                    style:
                                        blackTextStyle.copyWith(fontSize: 8.67),
                                  ),
                                  Text(
                                    '12 Feb 2023; 17:30 WIB',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 8.67),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 600,
                            left: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                    'assets/icons/icons-back.png',
                                    width: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 605,
                            left: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                    'assets/icons/zoom_icons.png',
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
