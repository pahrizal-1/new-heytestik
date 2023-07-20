import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../home/notifikasion_page.dart';

class OnboardingChat extends StatelessWidget {
  const OnboardingChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              Text(
                'Chat',
                style: whiteTextStyle.copyWith(fontSize: 20),
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
                  builder: (context) => const NotifikasionPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/notif-icons.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilCustomerPage(),
                ),
              );
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
          const SizedBox(
            height: 113,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 239,
                  width: 259,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/onboardingchat.png'))),
                ),
                Text(
                  'Kamu belum memiliki konsultasi\napapun :(',
                  style: blackTextStyle.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: lsymetric,
            child: ButtonGreenWidget(
              title: 'Mulai Konsultasi',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectConditionsPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
