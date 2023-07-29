import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/profil_doctor_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/halaman_chat_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/pengaturan_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/doctor_home_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../core/socket_class.dart';

class TabBarDoctor extends StatefulWidget {
  const TabBarDoctor({super.key});

  @override
  State<TabBarDoctor> createState() => _TabBarDoctorState();
}

class _TabBarDoctorState extends State<TabBarDoctor> {
  List<Widget> widgetList = [
    const HomePageDoctor(),
    const HalamanChatPage(),
    const PengaturanPage(),
    const ProfilDoctorPage()
  ];
  void onTap(int index) {
    setState(() {
      myIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // InitSocket().connectSocket(context);
  }

  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: fromCssColor('#6DC0B3'),
        unselectedItemColor: fromCssColor('#616161'),
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
                  'assets/icons/icon_pengaturan.svg',
                  color: myIndex == 2 ? greenColor : greyColor,
                ),
              ),
              label: 'Pengaturan'),
          BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  // child: Image.asset(
                  //   'assets/images/jpgsolutions.jpg',
                  //   color: greenColor,
                  // ),
                  child: Icon(
                    Icons.person_add_outlined,
                    size: 26,
                    color: myIndex == 3 ? greenColor : greyColor,
                  ),
                ),
              ),
              label: 'Profil'),
        ],
      ),
    );
  }
}
