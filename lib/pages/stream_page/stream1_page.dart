import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/stream_page/tabbar_stream_home_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../chat_customer/detail_perawatan_page.dart';

class Stream1Page extends StatelessWidget {
  const Stream1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderColor, width: 0.2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TabBar(
                labelColor: greenColor,
                labelPadding: EdgeInsets.zero,
                // labelStyle: grenTextStyle.copyWith(fontSize: 15),
                unselectedLabelColor: subTitleColor,
                labelStyle: blackHigtTextStyle.copyWith(
                  fontSize: 12,
                  color: const Color(0XFF9B9B9B),
                ),
                dividerColor: greenColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2,
                indicatorColor: greenColor,

                tabs: const [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Your Interest',
                  ),
                  Tab(
                    text: 'Trending',
                  ),
                  Tab(
                    text: 'Followed',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  TabbarStreamHomePage(),
                  DetailPerawatanPage(),
                  TabbarStreamHomePage(),
                  TabbarStreamHomePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
