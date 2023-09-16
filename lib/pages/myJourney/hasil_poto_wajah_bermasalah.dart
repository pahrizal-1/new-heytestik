// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/pages/myJourney/galery_my_journey.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../theme/theme.dart';

class PotoBagianWajahBermasalah extends StatefulWidget {
  const PotoBagianWajahBermasalah({super.key});

  @override
  State<PotoBagianWajahBermasalah> createState() =>
      _PotoBagianWajahBermasalahState();
}

class _PotoBagianWajahBermasalahState extends State<PotoBagianWajahBermasalah> {
  final MyJourneyController state = Get.put(MyJourneyController());

  Future _cropImage() async {
    if (state.initialConditionProblemPart != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
          sourcePath: state.initialConditionProblemPart!.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Crop',
                cropGridColor: Colors.black,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(title: 'Crop')
          ]);

      if (cropped != null) {
        setState(() {
          state.initialConditionProblemPart = File(cropped.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: _cropImage,
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Image.asset(
                'assets/icons/zoom.png',
                width: 21,
                height: 21,
              ),
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
              'Wajah bermasalah',
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
                    File(state.initialConditionProblemPart!.path),
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
                    state.initialConditionProblemPart == null;
                    if (state.isGallery.value) {
                      state.initialConditionProblemPart =
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
              child: Container(
                color: blackColor,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Obx(
                  () => LoadingWidget(
                    isLoading: state.isLoading.value,
                    child: TextButton(
                      onPressed: () async {
                        await state.detailJourney(
                            context, state.concernId.value);
                        if (state.isAfter.value) {
                          await state
                              .afterCondition(context, state.concernId.value,
                                  doInPost: () async {
                            redirect();
                          });
                        } else {
                          await state.saveJourney(context, doInPost: () async {
                            redirect();
                          });
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
                        'Simpan',
                        style: TextStyle(
                          fontSize: 15,
                          color: whiteColor,
                          fontWeight: bold,
                        ),
                      ),
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

  redirect() {
    SnackbarWidget.getSuccessSnackbar(
      context,
      'Info',
      'Journey berhasil disimpan',
    );
    if (state.isGallery.value) {
      Get
        ..back()
        ..back()
        ..back()
        ..back()
        ..back();
    } else {
      Get
        ..back()
        ..back()
        ..back()
        ..back()
        ..back()
        ..back()
        ..back()
        ..back();
    }
    Get.to(GaleryMyJourney());
  }
}
