import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/onboarding_chat_page.dart';
import 'package:heystetik_mobileapps/pages/home/home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/home_solution_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../stream_page/stream_home_page.dart';

class TabBarCustomer extends StatefulWidget {
  const TabBarCustomer({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  final int? currentIndex;

  @override
  State<TabBarCustomer> createState() => _TabBarCustomerState();
}

class _TabBarCustomerState extends State<TabBarCustomer> {
  List<Widget> widgetList = [
    const HomepageCutomer(),
    const OnboardingChat(),
    const StreamHomePage(),
    const SolutionPage(),
  ];

  void onTap(int index) {
    setState(() {
      myIndex = index;
    });
  }

  int myIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myIndex = widget.currentIndex ?? 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetList[myIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: myIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: fromCssColor('#6DC0B3'),
          unselectedItemColor: fromCssColor('#616161'),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: SvgPicture.asset(
                    'assets/icons/icon_home.svg',
                    color: myIndex == 0 ? greenColor : greyColor,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: SvgPicture.asset(
                    'assets/icons/icon_chat.svg',
                    color: myIndex == 1 ? greenColor : greyColor,
                  ),
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: SvgPicture.asset(
                    'assets/icons/icon_stream.svg',
                    color: myIndex == 2 ? greenColor : greyColor,
                  ),
                ),
                label: 'Stream'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/solutions.png',
                  width: 30,
                  color: myIndex == 3 ? greenColor : greyColor,
                ),
                label: 'Solutions'),
          ],
          selectedFontSize: 12,
          unselectedFontSize: 12,
        ),
      ),
    );
  }
}
