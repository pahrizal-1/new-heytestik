import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/riwayat_medis3_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class RiwayatMedis2Page extends StatefulWidget {
  const RiwayatMedis2Page({super.key});

  @override
  State<RiwayatMedis2Page> createState() => _RiwayatMedis2PageState();
}

class _RiwayatMedis2PageState extends State<RiwayatMedis2Page> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isIconSelected3 = false;
  bool isIconSelected4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
                child: LinearPercentIndicator(
                  linearStrokeCap: LinearStrokeCap.butt,
                  animation: true,
                  lineHeight: 5,
                  percent: 0.5,
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
                            "Seberapa sering kamu beraktivitas di bawah matahari?",
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
                          isIconSelected2 = false;
                          isIconSelected3 = false;
                          isIconSelected4 = false;
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
                              RichText(
                                text: TextSpan(
                                  text: "Bekas jerawat kehitaman",
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
                      height: 13,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const PertanyaanAwal3Page()),
                        // );
                        setState(() {
                          isIconSelected2 = !isIconSelected2;
                          isIconSelected4 = false;
                          isIconSelected3 = false;
                          isIconSelected1 = false;
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
                              RichText(
                                text: TextSpan(
                                  text: "Bekas jerawat kehitaman",
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
                    const SizedBox(
                      height: 13,
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
                          isIconSelected2 = false;
                          isIconSelected4 = false;
                          isIconSelected1 = false;
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
                                  text: "Bopeng / Scar Atrofik",
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
                    SizedBox(
                      height: 13,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const PertanyaanAwal3Page()),
                        // );
                        setState(() {
                          isIconSelected4 = !isIconSelected4;
                          isIconSelected2 = false;
                          isIconSelected3 = false;
                          isIconSelected1 = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isIconSelected4
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
                                  (isIconSelected4
                                      ? Icons.radio_button_on
                                      : Icons.circle_outlined),
                                  size: 20,
                                  color: isIconSelected4
                                      ? Colors.white
                                      : fromCssColor('#323232'),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Bekas jerawat menonjol / keloid",
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: isIconSelected4
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
                    // SizedBox(
                    //   height: 190,
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
                title: 'Simpan & Lanjut',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiwayatMedi3Page(),
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
