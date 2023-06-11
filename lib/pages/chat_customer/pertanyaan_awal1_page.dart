import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/pertanyaan_awal2_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../home/home_page.dart';

class PertanyaanAwalPage extends StatefulWidget {
  const PertanyaanAwalPage({super.key});

  @override
  State<PertanyaanAwalPage> createState() => _PertanyaanAwalPageState();
}

class _PertanyaanAwalPageState extends State<PertanyaanAwalPage> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isIconSelected3 = false;
  bool isIconSelected4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            const Text('Pertanyaan Awal'),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomepageCutomer(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/icon-home-chat.png',
                width: 18,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
            child: LinearPercentIndicator(
              linearStrokeCap: LinearStrokeCap.butt,
              animation: true,
              lineHeight: 5,
              percent: 0.1,
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
                    text: 'Data Umum',
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
                    text: 'Menurutmu, kulit wajahmu termasuk tipe yang mana?',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PertanyaanAwal2Page()),
                    );
                    setState(() {
                      isIconSelected1 = !isIconSelected1;
                      isIconSelected2 = false;
                      isIconSelected3 = false;
                      isIconSelected4 = false;
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
                              text: 'Normal',
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
                          builder: (context) => const PertanyaanAwal2Page()),
                    );
                    setState(() {
                      isIconSelected2 = !isIconSelected2;
                      isIconSelected1 = false;
                      isIconSelected3 = false;
                      isIconSelected4 = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(16),
                      //   borderSide: BorderSide.none,
                      // ),
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
                              text: 'Kering',
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
                          builder: (context) => const PertanyaanAwal2Page()),
                    );
                    setState(() {
                      isIconSelected3 = !isIconSelected3;
                      isIconSelected1 = false;
                      isIconSelected2 = false;
                      isIconSelected4 = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
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
                              text: 'Berminyak',
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PertanyaanAwal2Page()),
                    );
                    setState(() {
                      isIconSelected4 = !isIconSelected4;
                      isIconSelected1 = false;
                      isIconSelected2 = false;
                      isIconSelected3 = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
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
                              text: 'Kombinasi',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
