// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/profile/profile_controller.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';

class AlertDialogUlasan extends StatelessWidget {
  Function() functionCamera;
  Function() functionGallery;
  Function() functionGalleryMyJourney;
  AlertDialogUlasan({
    required this.functionCamera,
    required this.functionGallery,
    required this.functionGalleryMyJourney,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
          height: 245,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambahkan gambar',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 20, color: blackColor),
                ),
                const SizedBox(
                  height: 21,
                ),
                InkWell(
                  onTap: () async {
                    await functionCamera();
                  },
                  child: Text(
                    'Kamera',
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 15, color: blackColor),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                InkWell(
                  onTap: () async {
                    await functionGallery();
                  },
                  child: Text(
                    'Dari galeri',
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 15, color: blackColor),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                InkWell(
                  onTap: () async {
                    await functionGalleryMyJourney();
                  },
                  child: Text(
                    'Dari galeri ‘My Journey’',
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 15, color: blackColor),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'CANCEL',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class AlertDialogLogout extends StatelessWidget {
  String title;
  Function() function;
  AlertDialogLogout({required this.title, required this.function, super.key});

  final DoctorProfileController stateDoctor =
      Get.put(DoctorProfileController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
          height: 176,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: subGreyTextStyle.copyWith(
                      fontSize: 17, color: blackColor),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Tidak',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    const SizedBox(width: 30),
                    InkWell(
                      onTap: () async {
                        await function();
                      },
                      child: Text(
                        'Ya',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class AletDialogCache extends StatelessWidget {
  const AletDialogCache({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
          height: 176,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cache Telah Dibersihkan',
                  style: subGreyTextStyle.copyWith(
                      fontSize: 17, color: blackColor),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Oke',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class AlertInfomasi extends StatelessWidget {
  Function function;
  AlertInfomasi({required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0.1),
      content: Container(
          height: 176,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yakin mau dihapus?',
                  style: subGreyTextStyle.copyWith(
                      fontSize: 17, color: blackColor),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Tidak',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    const SizedBox(width: 30),
                    InkWell(
                      onTap: () async {
                        await function();
                      },
                      child: Text(
                        'Ya',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
