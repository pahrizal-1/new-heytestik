import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/pencarian_search_widget.dart';
import '../chat_customer/detail_perawatan_page.dart';
import '../chat_customer/rekomendasi_perawatan_page.dart';

class StreamHomePage extends StatelessWidget {
  const StreamHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Row(
              children: [
                Text(
                  'Stream',
                  style: blackTextStyle.copyWith(fontSize: 20),
                )
              ],
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PencarianPageWidget(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                color: blackColor,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const NotifikasionPage(),
                //   ),
                // );
              },
              child: SvgPicture.asset(
                'assets/icons/notif-icons.svg',
                color: blackColor,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProfilCustomerPage(),
                //   ),
                // );
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profiledummy.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 19),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor, width: 0.2),
                    borderRadius: BorderRadius.circular(7)),
                child: TabBar(
                  labelColor: greenColor,
                  labelStyle: grenTextStyle.copyWith(fontSize: 15),
                  unselectedLabelColor: blackColor,
                  unselectedLabelStyle: blackHigtTextStyle.copyWith(
                      fontSize: 15, color: blackColor),
                  dividerColor: greenColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 1,
                  indicatorColor: greenColor,
                  indicatorPadding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 2),
                  tabs: [
                    Tab(
                      text: 'Stream',
                    ),
                    Tab(
                      text: 'News',
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(children: [
                RekomendasiPerawatan1Page(),
                DetailPerawatanPage(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
