import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/stream_page/folowed_stream_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/home_stream_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/trending_stream_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/your_interest_stream_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class AllInfoStreamPage extends StatelessWidget {
  const AllInfoStreamPage({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              controller: tabController,
              labelColor: greenColor,
              labelPadding: EdgeInsets.zero,
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
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                HomeStreamPage(),
                InterestStreamPage(),
                TrendingStreamPage(),
                FollowedStreamPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
