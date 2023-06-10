import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profile2_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Profile1Page extends StatefulWidget {
  const Profile1Page({super.key});

  @override
  State<Profile1Page> createState() => _Profile1PageState();
}

class _Profile1PageState extends State<Profile1Page> {
  bool isIconSelected1 = false;
  bool isIconSelected2 = false;
  bool isIconSelected3 = false;
  bool isIconSelected4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProfile(context),
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
              backgroundColor: fromCssColor("#D9D9D9"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13),
                RichText(
                  text: TextSpan(
                    text: "Data Umum",
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: fromCssColor('#24A7A0'),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: "Menurutmu, kulit wajahmu termasuk tipe yang mana?",
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile2Page()),
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
                              text: "Normal",
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
                SizedBox(
                  height: 13,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile2Page()),
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
                              text: "Kering",
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
                SizedBox(
                  height: 13,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile2Page()),
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
                              text: "Berminyak",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile2Page()),
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
                              text: "Kombinasi",
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
