import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../controller/customer/chat/chat_controller.dart';
import '../../widget/chat_doctor_widget.dart';
import '../../widget/pencarian_search_widget.dart';
import '../home/notifikasion_page.dart';
import '../setings&akun/akun_home_page.dart';
import 'onboarding_chat2_page.dart';

class OnboardingChat extends StatefulWidget {
  const OnboardingChat({super.key});

  @override
  State<OnboardingChat> createState() => _OnboardingChatState();
}

class _OnboardingChatState extends State<OnboardingChat> {
  final CustomerChatController state = Get.put(CustomerChatController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state.getListRecentChat();
  }

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
                'assets/icons/notification-dot-black.svg',
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
                    builder: (context) => const AkunHomePage(),
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
        body: Obx(() {
          if (state.listRecentChat.value == null) {
            return Column(
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
                                AssetImage('assets/images/onboardingchat.png'),
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
            );
          }
          return Container(
            height: Get.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.listRecentChat.length,
                itemBuilder: (context, index) {
                  return DoctorChat(
                    nametile: state.listRecentChat[index]['doctor']
                        ['fullname'],
                    sendBy: state.listRecentChat[index]['customer']['fullname'],
                    menit: '11:30 PM',
                    pesanChat: state.listRecentChat[index]['unseen_count'],
                    chat: state.listRecentChat[index]['last_chat']['message'],
                    roomCode: state.listRecentChat[index]['code'],
                    roomId: state.listRecentChat[index]['id'],
                    senderId: state.listRecentChat[index]['customer']['id'],
                    receiverId: state.listRecentChat[index]['doctor']['id'],
                  );
                }),
          );
        }));
  }
}
