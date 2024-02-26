import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/stream_page/trend_lifestyle_news_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'all_info_news_page.dart';
import 'beauty_info_news_page.dart';
import 'celebrity_info_news_page.dart';

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: Column(
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
                  indicatorPadding: EdgeInsets.zero,
                  indicatorColor: greenColor,

                  tabs: const [
                    Tab(
                      text: 'Semua',
                    ),
                    Tab(
                      text: 'Beauty',
                    ),
                    Tab(
                      text: 'Trend & Lifestyle',
                    ),
                    Tab(
                      text: 'Celebrity',
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    AllInfoNewsPage(),
                    BeautyInfoNewsPage(),
                    TrenLifestyleNewsPage(),
                    CelebrityNewsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
