import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/ringkasan_pembayaran_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:dotted_border/dotted_border.dart';

class RiwayatMedis7Page extends StatefulWidget {
  const RiwayatMedis7Page({super.key});

  @override
  State<RiwayatMedis7Page> createState() => _RiwayatMedis7PageState();
}

class _RiwayatMedis7PageState extends State<RiwayatMedis7Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
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
                  backgroundColor: fromCssColor("#D9D9D9"),
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
                        text: "Ambil Gambar",
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
                        text: "Kirimkan foto wajahmu ya :) Privasimu terjaga.",
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
                            "Privasi foto kamu terjaga dan aman. Foto yang jelas akan berguna untuk dokter mengevaluasi wajahmu secara akurat.",
                        style: TextStyle(
                            fontFamily: 'ProximaNova',
                            color: Colors.black,
                            fontSize: 12.5,
                            height: 1.1),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            color: fromCssColor('#CCCCCC'),
                            strokeWidth: 1,
                            child: Container(
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
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/upload-cam.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Ambil Foto",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'ProximaNova',
                                        color: fromCssColor('#24A7A0'),
                                        letterSpacing: 0.7,
                                        fontWeight: bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: const TextSpan(
                                        text: "Ambil Foto dengan kamera",
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
                          onTap: () {},
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            color: fromCssColor('#CCCCCC'),
                            strokeWidth: 1,
                            child: Container(
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
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/upload-galery.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Upload Foto",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'ProximaNova',
                                        color: fromCssColor('#24A7A0'),
                                        letterSpacing: 0.7,
                                        fontWeight: bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: const TextSpan(
                                        text: "Unggah foto dari Galeri",
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/icons/alert-circle1.png"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Tips pengambilan foto & panduan foto",
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
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 110,
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
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
                                      text: "Tampak depan",
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
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 110,
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
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
                                      text: "Zoom area bermasalah",
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
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 110,
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/kanan1.png'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      text: "Tampak samping kanan",
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
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 110,
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
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
                                      text: "Tampak samping kiri",
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
                    SizedBox(
                      height: 20,
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
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/ceklis2.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: RichText(
                                      text: const TextSpan(
                                        text:
                                            "Usahan fokus, jangan blur, dan gunakan kamera belakang",
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
                              SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/ceklis2.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: RichText(
                                      text: const TextSpan(
                                        text:
                                            "Kasih lihat area bermasalah untuk bantu dokter (boleh kamu zoom)",
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
                              SizedBox(
                                height: 13,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/ceklis2.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: RichText(
                                      text: const TextSpan(
                                        text:
                                            "Jangan gunakan make up / filter dan ambil foto di tempat terang",
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
                      title: "Konfirmasi Foto",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RingkasanPembayaranPage(),
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
        ));
  }
}
