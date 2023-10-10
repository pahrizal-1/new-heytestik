import 'dart:io';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/camera_wajah_depan_pertanyaan.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/hasil_poto_wajah_depan_pertanyaan.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/ringkasan_pembayaran_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dotted_border/dotted_border.dart';

class RiwayatMedis7Page extends StatefulWidget {
  final int? interestConditionId;
  const RiwayatMedis7Page({required this.interestConditionId, super.key});

  @override
  State<RiwayatMedis7Page> createState() => _RiwayatMedis7PageState();
}

class _RiwayatMedis7PageState extends State<RiwayatMedis7Page> {
  final OrderConsultationController state =
      Get.put(OrderConsultationController());

  File? frontFace;
  File? rightSide;
  File? leftSide;
  File? problemPart;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        frontFace = state.initialConditionFrontFace;
        rightSide = state.initialConditionRightSide;
        leftSide = state.initialConditionLeftSide;
        problemPart = state.initialConditionProblemPart;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: greenColor,
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
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Riwayat Medis',
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabBarCustomer(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/icon-home-chat.png',
                width: 18,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
              child: LinearPercentIndicator(
                linearStrokeCap: LinearStrokeCap.butt,
                animation: true,
                lineHeight: 5,
                percent: 0.9,
                progressColor: fromCssColor('#24A7A0'),
                backgroundColor: fromCssColor('#D9D9D9'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 13),
                  RichText(
                    text: TextSpan(
                      text: 'Ambil Gambar',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: fromCssColor('#24A7A0'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: const TextSpan(
                      text: 'Kirimkan foto wajahmu ya :) Privasimu terjaga.',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: const TextSpan(
                      text:
                          'Privasi foto kamu terjaga dan aman. Foto yang jelas akan berguna untuk dokter mengevaluasi wajahmu secara akurat.',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          color: Colors.black,
                          fontSize: 12.5,
                          height: 1.1),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          state.isGallery.value = false;
                          setState(() {});
                          var result =
                              await Get.to(CameraWajahDepanPreassesment());
                          if (result) {
                            setState(() {
                              frontFace = state.initialConditionFrontFace;
                              rightSide = state.initialConditionRightSide;
                              leftSide = state.initialConditionLeftSide;
                              problemPart = state.initialConditionProblemPart;
                            });
                          }
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          color: fromCssColor('#CCCCCC'),
                          strokeWidth: 1,
                          child: SizedBox(
                            height: 145,
                            width: 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/upload-cam.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Ambil Foto',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'ProximaNova',
                                      color: fromCssColor('#24A7A0'),
                                      letterSpacing: 0.7,
                                      fontWeight: bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      text: 'Ambil Foto dengan kamera',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.black,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          state.initialConditionFrontFace =
                              await state.pickImageFromGalery();
                          setState(() {});
                          if (state.initialConditionFrontFace != null) {
                            state.isGallery.value = true;
                            var result =
                                await Get.to(HasilPotoWajahDepanPreassement());
                            if (result) {
                              setState(() {
                                frontFace = state.initialConditionFrontFace;
                                rightSide = state.initialConditionRightSide;
                                leftSide = state.initialConditionLeftSide;
                                problemPart = state.initialConditionProblemPart;
                              });
                            }
                            return;
                          }
                          state.isGallery.value = false;
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          color: fromCssColor('#CCCCCC'),
                          strokeWidth: 1,
                          child: SizedBox(
                            height: 145,
                            width: 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/upload-galery.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Upload Foto',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'ProximaNova',
                                      color: fromCssColor('#24A7A0'),
                                      letterSpacing: 0.7,
                                      fontWeight: bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      text: 'Unggah foto dari Galeri',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.black,
                                        letterSpacing: 0.6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/alert-new.png',
                        width: 20,
                        height: 20,
                        color: greenColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Yuk!! Ambil Foto kamu :)',
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 15,
                            fontFamily: 'ProximaNova',
                            color: fromCssColor('#323232'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (frontFace == null)
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/ambil-poto-kosong.png',
                                ),
                              ),
                            ),
                          )
                        else
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: FileImage(
                                  frontFace!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 8,
                        ),
                        if (problemPart == null)
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/ambil-poto-kosong.png',
                                ),
                              ),
                            ),
                          )
                        else
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: FileImage(
                                  problemPart!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 8,
                        ),
                        if (rightSide == null)
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/ambil-poto-kosong.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        else
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: FileImage(
                                  rightSide!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 8,
                        ),
                        if (leftSide == null)
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/ambil-poto-kosong.png',
                                ),
                              ),
                            ),
                          )
                        else
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: FileImage(
                                  leftSide!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/alert-new.png',
                        width: 20,
                        height: 20,
                        color: greenColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Tips pengambilan foto & panduan foto',
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 15,
                            fontFamily: 'ProximaNova',
                            color: fromCssColor('#323232'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 110,
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/tampak-depan.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: 'Tampak depan',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          height: 110,
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/zoom1.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: 'Zoom area bermasalah',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          height: 110,
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/kanan1.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: 'Tampak samping kanan',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          height: 110,
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/kiri1.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: 'Tampak samping kiri',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: fromCssColor('#24A7A0'),
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 17, right: 19),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/ceklis2.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      text:
                                          'Usahan fokus, jangan blur, dan gunakan kamera belakang',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.black,
                                        fontSize: 12.5,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/ceklis2.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      text:
                                          'Kasih lihat area bermasalah untuk bantu dokter (boleh kamu zoom)',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.black,
                                        fontSize: 12.5,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/icons/ceklis2.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      text:
                                          'Jangan gunakan make up / filter dan ambil foto di tempat terang',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: Colors.black,
                                        fontSize: 12.5,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ButtonGreenWidget(
                    title: 'Konfirmasi Foto',
                    onPressed: () async {
                      if (state.initialConditionFrontFace == null ||
                          state.initialConditionRightSide == null ||
                          state.initialConditionLeftSide == null ||
                          state.initialConditionProblemPart == null) {
                        return await showDialog(
                          context: context,
                          builder: (context) => AlertWidget(
                            subtitle: 'Foto tidak boleh kosong',
                          ),
                        );
                      }

                      await showDialog(
                        context: context,
                        builder: (context) => AlertConfirmationWidget(
                          subtitle:
                              'Apakah anda sudah yakin? Jika sudah yakin kita lanjut ke langkah berikutnya',
                          action: () async {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RingkasanPembayaranPage(
                                  interestConditionId:
                                      widget.interestConditionId,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
