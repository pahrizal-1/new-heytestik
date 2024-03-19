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

class TulisUlasanProdukPage extends StatefulWidget {
  String transactionProductId;
  String transactionProductItemId;
  String img;
  String product;
  String type;
  TulisUlasanProdukPage(
      {required this.transactionProductId,
      required this.transactionProductItemId,
      required this.img,
      required this.product,
      required this.type,
      super.key});

  @override
  State<TulisUlasanProdukPage> createState() => _TulisUlasanProdukPageState();
}

class _TulisUlasanProdukPageState extends State<TulisUlasanProdukPage> {
  final ReviewController state = Get.put(ReviewController());

  List<String> titleCirkel = [
    'Kurang dari 1 Minggu',
    '1 Minggu - 1 Bulan',
    '1 - 3 Bulan',
    '3 - 6 Bulan',
    '6 Bulan - 1 Tahun',
    'Lebih dari 1 Tahun',
  ];
  List<String> titleRekomendasi = [
    'Yoi, Pasti dong!',
    'Nggak deh',
  ];
  List<String> iconRekomendasi = [
    'assets/icons/icons-ya.png',
    'assets/icons/icons-tidak.png',
  ];
  List<String> titleProduk = [
    'Ya',
    'Tidak',
  ];
  List<String> iconProduk = [
    'assets/icons/icons-ya.png',
    'assets/icons/icons-tidak.png',
    'assets/icons/icons-mungkin.png'
  ];
  int isRekomendasi = 0;
  int isProduk = 0;
  int isSelected = 0;
  bool isBefore = false;

  @override
  void initState() {
    super.initState();
    state.clearForm();
    state.usageDuration.value = titleCirkel[isSelected];
    state.wouldRecommend.value = titleRekomendasi[isRekomendasi];
    state.wouldRepurchase.value = titleProduk[isProduk];
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
            padding: lsymetric.copyWith(top: 22, bottom: 22),
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
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product,
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            widget.type,
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 13, color: blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
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
                    maxLength: 150,
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
                      hintText: 'Ceritakan pengalaman kamu memakai produk ini',
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
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Bagaimana penilaianmu terhadap produk ini?',
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
                        'Effectiveness Rating',
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
                              state.ratingAvaregeProduct(
                                  index, 'effectiveness');
                              setState(() {});
                            },
                            child: Obx(
                              () => Image.asset(
                                'assets/icons/stars-new.png',
                                width: 25,
                                color: state.effectivenessRating.value > index
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
                        'Texture Rating',
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
                              state.ratingAvaregeProduct(index, 'texture');
                              setState(() {});
                            },
                            child: Obx(
                              () => Image.asset(
                                'assets/icons/stars-new.png',
                                width: 25,
                                color: state.textureRating.value > index
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
                        'Packaging Rating',
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
                              state.ratingAvaregeProduct(index, 'packaging');
                              setState(() {});
                            },
                            child: Obx(
                              () => Image.asset(
                                'assets/icons/stars-new.png',
                                width: 25,
                                color: state.packagingRating.value > index
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
                  height: 20,
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
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berapa lama kamu menggunakan produk ini?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                bottom: 22,
              ),
              child: Row(
                children: List.generate(titleCirkel.length, (index) {
                  return InkWell(
                    onTap: () {
                      isSelected = index;
                      state.usageDuration.value = titleCirkel[index];
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 12),
                      decoration: BoxDecoration(
                          color: isSelected == index ? greenColor : whiteColor,
                          border: Border.all(
                            color:
                                isSelected == index ? greenColor : borderColor,
                          ),
                          borderRadius: BorderRadius.circular(23)),
                      child: Text(
                        titleCirkel[index],
                        style: blackRegulerTextStyle.copyWith(
                          fontSize: 12,
                          color: isSelected == index ? whiteColor : blackColor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambahkan foto ‘My Journey’?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Upload foto before-after setelah menggunakan produk ini untuk melihat perubahan yang terjadi pada kulitmu. ',
                  style: subTitleTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Before',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: state.beforeConditions.map((e) {
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
                              state.beforeConditions
                                  .removeWhere((item) => item == e);
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
                      ? isBefore
                          ? LoadingMore()
                          : Container()
                      : InkWell(
                          onTap: () async {
                            setState(() {
                              isBefore = true;
                            });
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialogUlasan(
                                functionCamera: () async {
                                  await openCamera('before');
                                  setState(() {});
                                },
                                functionGallery: () async {
                                  await openGallery('before');
                                  setState(() {});
                                },
                                functionGalleryMyJourney: () async {
                                  await openGalleryMyJourney('before');
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
                const SizedBox(
                  height: 25,
                ),
                dividergrey(),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'After',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: state.afterConditions.map((e) {
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
                              state.afterConditions
                                  .removeWhere((item) => item == e);
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
                      ? isBefore
                          ? Container()
                          : LoadingMore()
                      : InkWell(
                          onTap: () async {
                            setState(() {
                              isBefore = false;
                            });
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialogUlasan(
                                functionCamera: () async {
                                  await openCamera('after');
                                  setState(() {});
                                },
                                functionGallery: () async {
                                  await openGallery('after');
                                  setState(() {});
                                },
                                functionGalleryMyJourney: () async {
                                  await openGalleryMyJourney('after');
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
          const dividergreen(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 22,
                bottom: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apakah kamu akan merekomendasikan produk ini?',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: List.generate(2, (index) {
                      return InkWell(
                        onTap: () {
                          isRekomendasi = index;
                          state.wouldRecommend.value = titleRekomendasi[index];
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 12),
                          decoration: BoxDecoration(
                              color: isRekomendasi == index
                                  ? greenColor
                                  : whiteColor,
                              border: Border.all(
                                color: isRekomendasi == index
                                    ? greenColor
                                    : borderColor,
                              ),
                              borderRadius: BorderRadius.circular(23)),
                          child: Row(
                            children: [
                              Image.asset(
                                iconRekomendasi[index],
                                width: 13,
                                color: isRekomendasi == index
                                    ? whiteColor
                                    : blackColor,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                titleRekomendasi[index],
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 12,
                                  color: isRekomendasi == index
                                      ? whiteColor
                                      : blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const dividergreen(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 22,
                bottom: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apakah kamu akan membeli lagi produk ini?',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: List.generate(2, (index) {
                      return InkWell(
                        onTap: () {
                          isProduk = index;
                          state.wouldRepurchase.value = titleProduk[index];
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          decoration: BoxDecoration(
                              color:
                                  isProduk == index ? greenColor : whiteColor,
                              border: Border.all(
                                color: isProduk == index
                                    ? greenColor
                                    : borderColor,
                              ),
                              borderRadius: BorderRadius.circular(23)),
                          child: Row(
                            children: [
                              Text(
                                titleProduk[index],
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 12,
                                  color: isProduk == index
                                      ? whiteColor
                                      : blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
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
                    await state.reviewProduct(
                      context,
                      widget.transactionProductId,
                      widget.transactionProductItemId,
                      doInPost: () async {
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

  Future openCamera(String condition) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);
      if (condition == 'after') {
        state.afterConditions.add(imagePath!.path);
        setState(() {});
      }
      if (condition == 'before') {
        state.beforeConditions.add(imagePath!.path);
        setState(() {});
      }
    }
  }

  Future openGallery(String condition) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);
      if (condition == 'after') {
        state.afterConditions.add(imagePath!.path);
        setState(() {});
      }
      if (condition == 'before') {
        state.beforeConditions.add(imagePath!.path);
        setState(() {});
      }
    }
  }

  Future openGalleryMyJourney(String condition) async {
    List hasil = await Get.to(() => ImageGalleryMyJourney());
    Get.back();

    if (hasil.isEmpty) return;

    state.isMinorLoading.value = true;
    for (int i = 0; i < hasil.length; i++) {
      String path = await downloadFileFromUrl(hasil[i]);
      if (condition == 'after') {
        state.afterConditions.add(path);
        setState(() {});
      }
      if (condition == 'before') {
        state.beforeConditions.add(path);
        setState(() {});
      }
    }
    state.isMinorLoading.value = false;
  }
}
