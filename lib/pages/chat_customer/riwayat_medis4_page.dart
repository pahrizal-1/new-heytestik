import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/riwayat_medis5_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class RiwayatMedis4Page extends StatefulWidget {
  const RiwayatMedis4Page({super.key});

  @override
  State<RiwayatMedis4Page> createState() => _RiwayatMedis4PageState();
}

class _RiwayatMedis4PageState extends State<RiwayatMedis4Page> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isTextFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRiwayat(context),
      body: ListView(
        children: [
          Container(
            height: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
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
                          text: "Pertanyaan Awal",
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
                          text: "Apakah kamu punya riwayat alergi?",
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            isIconSelected1 = !isIconSelected1;
                            isTextFieldVisible = isIconSelected1;
                            isIconSelected2 = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
                                RichText(
                                  text: TextSpan(
                                    text: "Ya",
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      color: isIconSelected1
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
                        height: 6.5,
                      ),
                      Visibility(
                        visible: isTextFieldVisible,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: fromCssColor('#CCCCCC'),
                              width: 1,
                            ),
                          ),
                          child: const TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Boleh sebutkan alergimu disini ya :)',
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
                          setState(() {
                            isIconSelected2 = !isIconSelected2;
                            isIconSelected1 = false;
                            isTextFieldVisible = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
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
                                RichText(
                                  text: TextSpan(
                                    text: "Tidak",
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
                              ],
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
          Padding(
            padding: const EdgeInsets.only(right: 25, left: 25),
            child: ButtonGreenWidget(
              title: 'Simpan & Lanjut',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiwayatMedis5Page(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
