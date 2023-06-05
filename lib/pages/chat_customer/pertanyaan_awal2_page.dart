import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/pertanyaan_awal3_page.dart';
import 'package:heystetik_mobileapps/pages/home/home_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class PertanyaanAwal2Page extends StatefulWidget {
  const PertanyaanAwal2Page({super.key});

  @override
  State<PertanyaanAwal2Page> createState() => _PertanyaanAwal2PageState();
}

class _PertanyaanAwal2PageState extends State<PertanyaanAwal2Page> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isIconSelected3 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarChat(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
              child: LinearPercentIndicator(
                linearStrokeCap: LinearStrokeCap.butt,
                animation: true,
                lineHeight: 5,
                percent: 0.2,
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
                      text: "Apakah kamu mempunyai kulit yang sensitif?",
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
                  RichText(
                    text: const TextSpan(
                      text:
                          "Kulit sensitif termasuk jika kulitmu sering bermasalah saat menggunakan skincare/kosmetik yang tidak cocok.",
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.black,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PertanyaanAwal3Page()),
                      );
                      setState(() {
                        isIconSelected1 = !isIconSelected1;
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
                    height: 13,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PertanyaanAwal3Page()),
                      );
                      setState(() {
                        isIconSelected2 = !isIconSelected2;
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
                  const SizedBox(
                    height: 13,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PertanyaanAwal3Page()),
                      );
                      setState(() {
                        isIconSelected3 = !isIconSelected3;
                        isIconSelected2 = false;
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
                                text: "Tidak Tahu",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
