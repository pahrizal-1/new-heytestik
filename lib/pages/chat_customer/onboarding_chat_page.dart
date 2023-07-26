// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../widget/pencarian_search_widget.dart';
import '../home/notifikasion_page.dart';
import '../setings&akun/akun_home_page.dart';
import 'list_chat.dart';

class OnboardingChat extends StatefulWidget {
  const OnboardingChat({super.key});

  @override
  State<OnboardingChat> createState() => _OnboardingChatState();
}

class _OnboardingChatState extends State<OnboardingChat> {
  final ConsultationController state = Get.put(ConsultationController());
  @override
  void initState() {
    super.initState();
    state.getRecentChat(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: state.totalRecentChat.value == 0
              ? const BelumKonsultasiChat()
              : ListChatPage(
                  recentChat: state.recentChat.value,
                ),
        ),
      ),
      floatingActionButton: state.totalRecentChat == 0
          ? Container()
          : SizedBox(
              height: 55,
              width: 55,
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(const BelumKonsultasiChat());
                },
                backgroundColor: greenColor,
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                  size: 35,
                ),
              ),
            ),
    );
  }
}

class BelumKonsultasiChat extends StatelessWidget {
  const BelumKonsultasiChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greenColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
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
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/profiledummy.png')),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Chat',
                style: whiteTextStyle.copyWith(fontSize: 18),
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
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
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
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AkunHomePage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 26,
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
                      image: AssetImage('assets/images/onboardingchat.png'),
                    ),
                  ),
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
