import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/camera_wajah_kanan_preassesment.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/hasil_poto_wajah_kanan_presassement.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../theme/theme.dart';

class HasilPotoWajahBermasalahPreasesment extends StatefulWidget {
  const HasilPotoWajahBermasalahPreasesment({super.key});

  @override
  State<HasilPotoWajahBermasalahPreasesment> createState() =>
      _HasilPotoWajahBermasalahPreasesmentState();
}

class _HasilPotoWajahBermasalahPreasesmentState
    extends State<HasilPotoWajahBermasalahPreasesment> {
  final OrderConsultationController state =
      Get.put(OrderConsultationController());

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
                child: TextButton(
                  onPressed: () async {
                    if (state.isGallery.value) {
                      state.initialConditionRightSide =
                          await state.pickImageFromGalery();
                      setState(() {});
                      Get.to(HasilWajahKananPreassesment());
                      return;
                    }
                    if (state.initialConditionProblemPart != null) {
                      Get.to(CameraWajahKananPreassesmnet());
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
