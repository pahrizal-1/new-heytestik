import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/detail_perawatan_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/rekomendasi_perawatan_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/tab_bar_galery_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class TabBarChat extends StatefulWidget {
  const TabBarChat({super.key});

  @override
  State<TabBarChat> createState() => _TabBarChatState();
}

class _TabBarChatState extends State<TabBarChat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: fromCssColor('#24A7A0'),
          title: Text(
            "Detail Perawatan",
            style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: bold,
                fontSize: 20,
                letterSpacing: 1),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 55,
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
                    borderRadius: BorderRadius.circular(20)),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.all(10),
                tabs: [
                  Tab(
                    text: 'Rekomendasi',
                  ),
                  Tab(
                    text: 'Detail',
                  ),
                  Tab(
                    text: 'Galeri',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                RekomendasiPerawatan1Page(),
                DetailPerawatanPage(),
                TabBarGaleryPage()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
