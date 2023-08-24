import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/galeri_perawatan_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/gambar_journey_page.dart';

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
      ),
    );
  }
}
