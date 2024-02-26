// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/core/download_file.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/image_gallery_my_journey.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../theme/theme.dart';

class TulisUlasanTreament extends StatefulWidget {
  String transactionTreatmentId;
  String transactionTreatmentItemIid;
  String img;
  String treatment;
  String clinic;
  TulisUlasanTreament(
      {required this.transactionTreatmentId,
      required this.transactionTreatmentItemIid,
      required this.img,
      required this.treatment,
      required this.clinic,
      super.key});

  @override
  State<TulisUlasanTreament> createState() => _TulisUlasanTreamentState();
}

class _TulisUlasanTreamentState extends State<TulisUlasanTreament> {
  final ReviewController state = Get.put(ReviewController());

  @override
  void initState() {
    super.initState();
    state.clearForm();
  }

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
                  Navigator.pop(context);
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
                'Tulis Ulasan',
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5,
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(top: 10, bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                image: NetworkImage(widget.img),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.treatment,
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            widget.clinic,
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 13, color: blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  'Bagaimana Penilaianmu Terhadap Treatment Ini?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Care Rating',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              state.ratingAvaregeTreatment(index, 'care');
                              setState(() {});
                            },
                            child: Obx(
                              () => Image.asset(
                                'assets/icons/stars-new.png',
                                width: 25,
                                color: state.careRating.value > index
                                    ? const Color(0xffFFC36A)
                                    : Color.fromRGBO(155, 155, 155, 0.61),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                dividergrey(),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Service Rating',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              state.ratingAvaregeTreatment(index, 'service');
                              setState(() {});
                            },
                            child: Obx(
                              () => Image.asset(
                                'assets/icons/stars-new.png',
                                width: 25,
                                color: state.serviceRating.value > index
                                    ? const Color(0xffFFC36A)
                                    : Color.fromRGBO(155, 155, 155, 0.61),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                dividergrey(),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Management Rating',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              state.ratingAvaregeTreatment(index, 'management');
                              setState(() {});
                            },
                            child: Obx(
                              () => Image.asset(
                                'assets/icons/stars-new.png',
                                width: 25,
                                color: state.managementRating.value > index
                                    ? const Color(0xffFFC36A)
                                    : Color.fromRGBO(155, 155, 155, 0.61),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Penilaianmu',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 15, color: blackColor),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Obx(
                      () => Text(
                        state.description[state.average.value < 1
                            ? 0
                            : state.average.value.toInt() - 1],
                        style: grenTextStyle.copyWith(fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 25,
                      color: const Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Obx(
                      () => Text(
                        state.average.value.toString().substring(0, 3),
                        style: blackHigtTextStyle.copyWith(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Tulis Ulasan',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    Text(
                      '${state.review.text.length}/150',
                      style: subTitleTextStyle.copyWith(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                  ),
                  child: TextField(
                    controller: state.review,
                    onChanged: (value) {
                      if (state.review.text.length <= 150) {
                        setState(() {});
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        bottom: 2,
                      ),
                      hintText: 'Ceritakan pengalaman treatment kamu',
                      hintStyle: subTitleTextStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  'Ulasan maksimal 150 karakter',
                  style: blackRegulerTextStyle.copyWith(
                      color: redColor,
                      fontSize: 10,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambahkan foto Penilaian',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: state.listImage.map((e) {
                    return Stack(
                      children: [
                        Container(
                          height: 72,
                          width: 82,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Image.file(
                            File(e),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              state.listImage.removeWhere((item) => item == e);
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.delete,
                              color: greenColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => state.isMinorLoading.value
                      ? LoadingMore()
                      : InkWell(
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialogUlasan(
                                functionCamera: () async {
                                  await openCamera();
                                  setState(() {});
                                },
                                functionGallery: () async {
                                  await openGallery();
                                  setState(() {});
                                },
                                functionGalleryMyJourney: () async {
                                  await openGalleryMyJourney();
                                  setState(() {});
                                },
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/icons/add-poto-icons.png',
                            width: 82,
                            height: 78,
                          ),
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(bottom: 30),
            child: Obx(
              () => LoadingWidget(
                isLoading: state.isLoading.value,
                child: ButtonGreenWidget(
                  title: 'Kirim',
                  onPressed: () async {
                    await state.reviewTreatment(
                      context,
                      widget.transactionTreatmentId,
                      widget.transactionTreatmentItemIid,
                      doInPost: () async {
                        Get.back();
                        Get.back();
                        SnackbarWidget.getSuccessSnackbar(
                          context,
                          'Info',
                          "Terima kasih atas ulasannya",
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  File? imagePath;
  // image from camera
  Future openCamera() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);

      print('img camera $imagePath');
      state.listImage.add(imagePath!.path);
      setState(() {});
      print('img camera ${state.listImage}');
    } else {
      print('image not selected');
    }
  }

  // image fromo gallery
  Future openGallery() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);

      print('img galeri $imagePath');
      state.listImage.add(imagePath!.path);
      setState(() {});
      print('img galeri ${state.listImage}');
    } else {
      print('image not selected');
    }
  }

  Future openGalleryMyJourney() async {
    List hasil = await Get.to(ImageGalleryMyJourney());
    print("hasil $hasil");
    Get.back();

    if (hasil.isEmpty) {
      print("hasil kosong");
      return;
    }

    state.isMinorLoading.value = true;
    for (int i = 0; i < hasil.length; i++) {
      String path = await downloadFileFromUrl(hasil[i]);
      state.listImage.add(path);
      setState(() {});
      print('oGalleryMyJourney ${state.listImage}');
    }
    state.isMinorLoading.value = false;
    print("beres");
  }
}
