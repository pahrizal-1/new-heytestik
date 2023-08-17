// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

import '../../theme/theme.dart';

class TulisUlasanKonsultasi extends StatefulWidget {
  String transactionConsultationId;
  String img;
  String doctor;
  String interest;
  TulisUlasanKonsultasi(
      {required this.transactionConsultationId,
      required this.img,
      required this.doctor,
      required this.interest,
      super.key});

  @override
  State<TulisUlasanKonsultasi> createState() => _TulisUlasanKonsultasiState();
}

class _TulisUlasanKonsultasiState extends State<TulisUlasanKonsultasi> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                SizedBox(
                  height: 30,
                ),
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
                            widget.doctor,
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            widget.interest,
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
                Text(
                  'Bagaimana penilaianmu terhadap konsultasi ini?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return InkWell(
                      onTap: () {
                        print("index $index");

                        state.starRating.value = index + 1;
                        state.ratingTitle.value =
                            state.description[state.starRating.value - 1];
                      },
                      child: Obx(
                        () => Image.asset(
                          'assets/icons/stars-new.png',
                          width: 25,
                          color: state.starRating.value > index
                              ? const Color(0xffFFC36A)
                              : Color.fromRGBO(155, 155, 155, 0.61),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Penilaianmu',
                          style: blackRegulerTextStyle.copyWith(
                              fontSize: 15, color: blackColor),
                        ),
                        Obx(
                          () => Text(
                            state.ratingTitle.value,
                            style: grenTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/stars.svg',
                      width: 23,
                      color: const Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Obx(
                      () => Text(
                        '${state.starRating.value}.0',
                        style: blackHigtTextStyle.copyWith(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(top: 15, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          counterText: '',
                          isDense: true,
                          contentPadding: const EdgeInsets.only(
                            top: 0,
                            bottom: 2,
                          ),
                          hintText: 'Ceritakan pengalaman konsultasi kamu',
                          hintStyle: subTitleTextStyle,
                          border: InputBorder.none)),
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
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: lsymetric.copyWith(bottom: 30),
            child: Obx(
              () => LoadingWidget(
                isLoading: state.isLoading.value,
                child: ButtonGreenWidget(
                  title: 'Kirim',
                  onPressed: () async {
                    await state.reviewConsultation(
                      context,
                      widget.transactionConsultationId,
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
}
