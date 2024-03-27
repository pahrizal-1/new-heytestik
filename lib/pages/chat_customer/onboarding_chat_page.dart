// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_treatment_widgets.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../core/global.dart';
import '../../widget/pencarian_search_widget.dart';
import '../setings&akun/akun_home_page.dart';
import 'list_chat.dart';

class OnboardingChat extends StatefulWidget {
  const OnboardingChat({super.key});

  @override
  State<OnboardingChat> createState() => _OnboardingChatState();
}

class _OnboardingChatState extends State<OnboardingChat> {
  final ConsultationController state = Get.put(ConsultationController());
  final ProfileController stateProfile = Get.put(ProfileController());

  final TextEditingController searchController = TextEditingController();
  String? search;
  int isSelected = 0;
  @override
  void initState() {
    super.initState();
    state.getRecentChat(context, search: search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            width: 1000,
            color: whiteColor,
            height: 60.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 0;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 9),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 4,
                          bottom: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: isSelected == 0 ? greenColor : borderColor),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Semua',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                                color: isSelected == 0 ? greenColor : const Color(0xff6B6B6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 1;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 9),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 4,
                          bottom: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: isSelected == 1 ? greenColor : borderColor),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Aktif',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                                color: isSelected == 1 ? greenColor : const Color(0xff6B6B6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 2;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 9),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 4,
                          bottom: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: isSelected == 2 ? greenColor : borderColor),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Selesai',
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                                color: isSelected == 2 ? greenColor : const Color(0xff6B6B6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
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
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: stateProfile.imgNetwork.value != "" ? NetworkImage('${Global.FILE}/${stateProfile.imgNetwork.value}') as ImageProvider : AssetImage('assets/images/profiledummy.png'),
                    ),
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
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PencarianPageWidget(
                        onEditingComplete: () {
                          search = searchController.text;
                          state.getRecentChat(context, search: search);
                        },
                        searchController: searchController,
                      ),
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
              notificasion(context, '1', whiteColor),
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
          )
        ],
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: state.totalRecentChat.value == 0
              ? const BelumKonsultasiChat()
              : isSelected == 0
                  ? ListChatPage(
                      recentChat: state.recentChat.value,
                    )
                  : isSelected == 1
                      ? ListChatActivePage(
                          recentChat: state.recentChat.value,
                        )
                      : ListChatDonePage(recentChat: state.recentChat.value),
        ),
      ),
      floatingActionButton: Obx(
        () => state.totalRecentChat.value == 0
            ? Container()
            : SizedBox(
                height: 55,
                width: 55,
                child: FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const SelectConditionsPage());
                  },
                  backgroundColor: greenColor,
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                    size: 35,
                  ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Kamu belum memiliki konsultasi\napapun :(',
            style: blackTextStyle.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 239,
            width: 259,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboardingchat.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              'Yuk, dapatkan solusi terbaik untuk permasalahan kulitmu dari dermatologis terpercaya,\nhanya Rp45K aja!',
              style: blackRegulerTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: lsymetric,
            child: ButtonGreenWidget(
              title: 'Mulai Konsultasi',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertConfirmationWidget(
                        subtitle: 'Konsultasi Ini Berbayar',
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectConditionsPage(),
                            ),
                          ).then((value) => Navigator.pop(context));
                        },
                      );
                    });
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SelectConditionsPage(),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
