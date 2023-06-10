import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/riwayat_medis1_page.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class PertanyaanAwal3Page extends StatefulWidget {
  const PertanyaanAwal3Page({super.key});

  @override
  State<PertanyaanAwal3Page> createState() => _PertanyaanAwal3PageState();
}

class _PertanyaanAwal3PageState extends State<PertanyaanAwal3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarChat(context),
      body: Stack(
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, right: 14, top: 30),
                    child: LinearPercentIndicator(
                      linearStrokeCap: LinearStrokeCap.butt,
                      animation: true,
                      lineHeight: 5,
                      percent: 0.3,
                      progressColor: fromCssColor('#24A7A0'),
                      backgroundColor: fromCssColor("#D9D9D9"),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: RichText(
                      text: TextSpan(
                        text: "Hai, kami mendengar keluhanmu",
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: fromCssColor('#24A7A0'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 45),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/chat-costumer-1.png'),
                        ),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -35, 0),
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "Sekarang lanjut ke riwayat medismu ya :)",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text:
                                  "Dokter akan mengevaluasi pengobatan yang tepat berdasarkan riwayat medis dan kondisi tubuhmu.",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 12.5,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 120,
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 25, right: 25),
              child: ButtonGreenWidget(
                title: 'Lanjut',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiwayatMedis1Page(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
