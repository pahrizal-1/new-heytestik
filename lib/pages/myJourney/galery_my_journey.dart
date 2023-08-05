import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/myJourney/zoom_image_detail.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan2_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class GaleryMyJourney extends StatefulWidget {
  const GaleryMyJourney({super.key});

  @override
  State<GaleryMyJourney> createState() => _GaleryMyJourneyState();
}

class _GaleryMyJourneyState extends State<GaleryMyJourney> {
  bool isSelceted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Galeri My Journey',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bekas Jerawat',
                  style: blackHigtTextStyle.copyWith(fontSize: 14),
                ),
                Text(
                  '13 Jun 2023',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(ZoomImageDetail());
                        },
                        child: Container(
                          height: 72,
                          width: 82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/before1.png'),
                                  fit: BoxFit.cover)),
                        )),
                  ],
                )
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anti Aging',
                  style: blackHigtTextStyle.copyWith(fontSize: 14),
                ),
                Text(
                  '10 Apr 2023',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 33,
                ),
                Text(
                  '12 Apr 2023',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Muka Kusam',
                  style: blackHigtTextStyle.copyWith(fontSize: 14),
                ),
                Text(
                  '11 Apr 2023',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 72,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/before1.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [ButtonGreenWidget(title: 'Pilih Foto')],
        ),
      ),
    );
  }
}
