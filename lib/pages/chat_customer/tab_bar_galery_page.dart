import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/galeri_perawatan_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/gambar_journey_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/home_journey.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class TabBarGaleryPage extends StatelessWidget {
  final int? id;
  const TabBarGaleryPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.white),
              child: TabBar(
                unselectedLabelColor: fromCssColor('#777777'),
                unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ProximaNova',
                  fontSize: 15,
                ),
                indicator: BoxDecoration(
                  color: fromCssColor('#24A7A0'),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    text: 'My Journey',
                  ),
                  Tab(
                    text: 'Gambar',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                JourneyPage(),
                GambarPage(id: id),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 11, top: 11),
          child: Wrap(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                // Atur lebar container sesuai dengan lebar maksimum
                child: RichText(
                  text: TextSpan(
                    text: 'Yuk, buat ',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ‘My Journey’',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: fromCssColor("#24A7A0"),
                        ),
                      ),
                      TextSpan(
                        text:
                            ' untuk melihat progres baikmu menuju skingoals yang kamu inginkan :)',
                        style:
                            TextStyle(fontStyle: FontStyle.normal, height: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonGreenWidget(
                title: "Buat My Journey",
                onPressed: () {
                  Get.to(HomeMyjourney());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
