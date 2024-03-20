// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:image_cropper/image_cropper.dart';

class HasilPotoSelainWajah extends StatefulWidget {
  File? img;
  HasilPotoSelainWajah({required this.img, super.key});

  @override
  State<HasilPotoSelainWajah> createState() => _HasilPotoSelainWajahState();
}

class _HasilPotoSelainWajahState extends State<HasilPotoSelainWajah> {
  final OrderConsultationController state =
      Get.put(OrderConsultationController());

  File? imageFile;

  @override
  void initState() {
    super.initState();
    imageFile = widget.img;
    setState(() {});
  }

  Future _cropImage() async {
    if (imageFile != null) {
      CroppedFile? cropped = await ImageCropper()
          .cropImage(sourcePath: imageFile!.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ], uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop',
            cropGridColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(title: 'Crop')
      ]);

      if (cropped != null) {
        setState(() {
          imageFile = File(cropped.path);
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
              padding: const EdgeInsets.only(right: 22),
              child: Image.asset(
                'assets/icons/zoom.png',
                width: 28,
                height: 28,
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
              'Wajah depan',
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
                    File(imageFile!.path),
                  ),
                  fit: BoxFit.fill,
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
                    imageFile = null;
                    if (state.isGallery.value) {
                      imageFile = await state.pickImageFromGalery();
                      setState(() {});
                      return;
                    }
                    Get.back(result: imageFile);
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
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    setState(() {});
                    Get.back(result: imageFile);
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
          ],
        ),
      ),
    );
  }
}
