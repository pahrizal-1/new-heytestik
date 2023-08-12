// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_skincare2_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/pages/myJourney/galery_my_journey.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

import '../../theme/theme.dart';

class TulisUlasanTreament extends StatefulWidget {
  String transactionTreatmentId;
  String img;
  String treatment;
  String clinic;
  TulisUlasanTreament(
      {required this.transactionTreatmentId,
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
                // const SizedBox(
                //   width: 14,
                // ),
                // Text(
                //   '2/2',
                //   style: subTitleTextStyle.copyWith(
                //       fontSize: 15, fontWeight: bold),
                // )
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
                  'Bagaimana Penilaiyan Mu Terhadap Produk Ini',
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
                              print("index $index");

                              state.careRating.value = index + 1;
                              state.ratingTitle.value =
                                  state.description[state.careRating.value - 1];
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
                              print("index $index");

                              state.serviceRating.value = index + 1;

                              state.ratingTitle.value = state
                                  .description[state.serviceRating.value - 1];
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
                              print("index $index");

                              state.managementRating.value = index + 1;
                              state.ratingTitle.value = state.description[
                                  state.managementRating.value - 1];
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
                    Text(
                      'Excellent Product!',
                      style: grenTextStyle.copyWith(fontSize: 20),
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
                    Text(
                      '4.7',
                      style: blackHigtTextStyle.copyWith(fontSize: 25),
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
                      '0/150',
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
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(
                            top: 0,
                            bottom: 2,
                          ),
                          hintText:
                              'Ceritakan pengalaman kamu memakai produk ini',
                          hintStyle: subTitleTextStyle,
                          border: InputBorder.none)),
                ),
                Text(
                  'Ulasan minimal 150 karakter',
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
                  'Tambahkan foto Penilaiyan',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 16,
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
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          'Tambahkan gambar',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 20, color: blackColor),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 21,
                                      ),
                                      Text(
                                        'Kamera',
                                        style: blackRegulerTextStyle.copyWith(
                                            fontSize: 15, color: blackColor),
                                      ),
                                      const SizedBox(
                                        height: 21,
                                      ),
                                      InkWell(
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
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const GaleryMyJourney()));
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'CANCEL',
                                              style: blackRegulerTextStyle
                                                  .copyWith(
                                                      fontSize: 15,
                                                      color: blackColor),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/icons/add-poto-icons.png',
                        width: 82,
                        height: 78,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(bottom: 30),
            child: ButtonGreenWidget(
              title: 'Kirim',
              onPressed: () async {
                await state.reviewTreatment(
                  context,
                  widget.transactionTreatmentId,
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
          )
        ],
      ),
    );
  }
}
