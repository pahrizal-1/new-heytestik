import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/pages/myJourney/cutome_poto_zoom_bermasalah.dart';
import 'package:heystetik_mobileapps/pages/myJourney/hasil_poto_wajah_bermasalah.dart';

import '../../theme/theme.dart';

class PotoBagianWajahKiri extends StatefulWidget {
  const PotoBagianWajahKiri({super.key});

  @override
  State<PotoBagianWajahKiri> createState() => _PotoBagianWajahKiriState();
}

class _PotoBagianWajahKiriState extends State<PotoBagianWajahKiri> {
  final MyJourneyController state = Get.put(MyJourneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset(
              'assets/icons/zoom.png',
              width: 21,
              height: 21,
            ),
          ),
        ],
      ),
      backgroundColor: blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (state.isGallery.value)
            Text(
              'Wajah kiri',
              style: whiteTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 20,
              ),
            ),
          if (state.isGallery.value)
            const SizedBox(
              height: 10,
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(
                    File(state.initialConditionLeftSide!.path),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Text(
            'Pastikan wajahmu di foto ini sudah terlihat jelas, ya :)',
            style: whiteTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 13,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 167,
        width: 390,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    state.initialConditionLeftSide == null;
                    if (state.isGallery.value) {
                      state.initialConditionLeftSide =
                          await state.pickImageFromGalery();
                      setState(() {});
                      return;
                    }
                    Get.back();
                  },
                  style: TextButton.styleFrom(
                    side: BorderSide(color: borderColor, width: 0.5),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Foto Ulang',
                    style: TextStyle(
                      fontSize: 14,
                      color: whiteColor,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    if (state.isGallery.value) {
                      state.initialConditionProblemPart =
                          await state.pickImageFromGalery();
                      setState(() {});
                      Get.to(PotoBagianWajahBermasalah());
                      return;
                    }
                    if (state.initialConditionLeftSide != null) {
                      Get.to(CustomeCameaPotoWajahBermasalah());
                      return;
                    }
                  },
                  style: TextButton.styleFrom(
                    side: BorderSide(color: greenColor, width: 2),
                    backgroundColor: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Lanjut',
                    style: TextStyle(
                      fontSize: 15,
                      color: whiteColor,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
