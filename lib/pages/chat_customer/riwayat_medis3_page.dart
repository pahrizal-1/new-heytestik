import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/riwayat_medis4_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class RiwayatMedi3Page extends StatefulWidget {
  const RiwayatMedi3Page({super.key});

  @override
  State<RiwayatMedi3Page> createState() => _RiwayatMedi3PageState();
}

class _RiwayatMedi3PageState extends State<RiwayatMedi3Page> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isIconSelected3 = false;

  bool isTextFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          children: [
            Container(
              height: 500,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, right: 14, top: 30),
                    child: LinearPercentIndicator(
                      linearStrokeCap: LinearStrokeCap.butt,
                      animation: true,
                      lineHeight: 5,
                      percent: 0.6,
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
                            text: "Informasi Kesehatan",
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
                            text:
                                "Apakah ada produk skincare yang rutin kamu gunakkan untuk wajahmu?",
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
                          height: 16,
                        ),
                        // RichText(
                        //   text: const TextSpan(
                        //     text: "Kamu bisa pilih dari satu.",
                        //     style: TextStyle(
                        //       fontFamily: 'ProximaNova',
                        //       color: Colors.black,
                        //       fontSize: 12.5,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 16,
                        // ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const PertanyaanAwal3Page()),
                            // );
                            setState(() {
                              isIconSelected1 = !isIconSelected1;
                              isTextFieldVisible = false;
                              isIconSelected2 = false;
                              isIconSelected3 = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isIconSelected1
                                  ? fromCssColor('#24A7A0')
                                  : Colors.transparent,
                              border: Border.all(
                                color: fromCssColor('#CCCCCC'),
                                width: 1,
                              ),
                            ),
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      (isIconSelected1
                                          ? Icons.radio_button_on
                                          : Icons.circle_outlined),
                                      size: 20,
                                      color: isIconSelected1
                                          ? Colors.white
                                          : fromCssColor('#323232'),
                                    ),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            "Ya, saat ini saya sedang memakai cream dokter / racikan",
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          height: 1.1,
                                          color: isIconSelected1
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),

                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => PertanyaanAwal2Page()),
                            // );
                            setState(() {
                              isIconSelected2 = !isIconSelected2;
                              isTextFieldVisible = isIconSelected2;
                              isIconSelected1 = false;
                              isIconSelected3 = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isIconSelected2
                                  ? fromCssColor('#24A7A0')
                                  : Colors.transparent,
                              border: Border.all(
                                color: fromCssColor('#CCCCCC'),
                                width: 1,
                              ),
                            ),
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      (isIconSelected2
                                          ? Icons.radio_button_on
                                          : Icons.circle_outlined),
                                      size: 20,
                                      color: isIconSelected2
                                          ? Colors.white
                                          : fromCssColor('#323232'),
                                    ),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            "Ya, saat ini saya sedang memakai produk skincare yang dibeli bebas di pasaran",
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          color: isIconSelected2
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.5),
                        Visibility(
                          visible: isTextFieldVisible,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: fromCssColor('#CCCCCC'),
                                width: 1,
                              ),
                            ),
                            child: const TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText:
                                    'Produk apa yang sedang kamu pakai dan apakah ada efeknya ke kulitmu? Bila tahu kandungannya, bisa dituliskan ya (optional)',
                                hintMaxLines: 5,
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    height: 1.3,
                                    fontFamily: 'ProximaNova'),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 6.5,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const PertanyaanAwal3Page()),
                            // );
                            setState(() {
                              isIconSelected3 = !isIconSelected3;
                              isTextFieldVisible = false;
                              isIconSelected1 = false;
                              isIconSelected2 = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isIconSelected3
                                  ? fromCssColor('#24A7A0')
                                  : Colors.transparent,
                              border: Border.all(
                                color: fromCssColor('#CCCCCC'),
                                width: 1,
                              ),
                            ),
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      (isIconSelected3
                                          ? Icons.radio_button_on
                                          : Icons.circle_outlined),
                                      size: 20,
                                      color: isIconSelected3
                                          ? Colors.white
                                          : fromCssColor('#323232'),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Tidak ada",
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: isIconSelected3
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        // SizedBox(
                        //   height: 190,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: ButtonGreenWidget(
                title: 'Simpan & Lanjut',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiwayatMedis4Page(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
