import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/rekomendasi_perawatan_page.dart';

import 'package:heystetik_mobileapps/pages/setings&akun/ulasan_settings_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class UlasanCheck extends StatefulWidget {
  const UlasanCheck({super.key});

  @override
  State<UlasanCheck> createState() => _UlasanCheckState();
}

class _UlasanCheckState extends State<UlasanCheck> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: blackColor,
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  'Ulasan',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(color: whiteColor),
              child: TabBar(
                labelColor: greenColor,
                unselectedLabelColor: greenColor,
                unselectedLabelStyle: TextStyle(
                  color: subgreenColor,
                  fontFamily: 'ProximaNova',
                  fontSize: 15,
                ),
                padding: EdgeInsets.only(right: 25),
                indicator: BoxDecoration(
                    border: Border.all(color: greenColor),
                    color: subgreenColor,
                    borderRadius: BorderRadius.circular(7)),
                indicatorPadding: EdgeInsets.all(10),
                tabs: [
                  Tab(
                    text: 'Rekomendasi',
                  ),
                  Tab(
                    text: 'Detail',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                RekomendasiPerawatan1Page(),
                UlasanSetingsPage(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
