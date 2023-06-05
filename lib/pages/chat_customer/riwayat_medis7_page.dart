import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class RiwayatMedis7Page extends StatefulWidget {
  const RiwayatMedis7Page({super.key});

  @override
  State<RiwayatMedis7Page> createState() => _RiwayatMedis7PageState();
}

class _RiwayatMedis7PageState extends State<RiwayatMedis7Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          text:
                              "Kirimkan foto wajahmu ya :) Privasimu terjaga.",
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
                          Container(
                            height: 100,
                            width: 100,
                            color: Colors.blueGrey,
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            color: Colors.lightGreenAccent,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
