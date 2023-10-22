import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_tubuh.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../controller/customer/interest/interest_controller.dart';
import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsKorektifWajah extends StatefulWidget {
  const SkinGoalsKorektifWajah({super.key});

  @override
  State<SkinGoalsKorektifWajah> createState() => _SkinGoalsKorektifWajahState();
}

class _SkinGoalsKorektifWajahState extends State<SkinGoalsKorektifWajah> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<InterestController>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return NantiSajaDialog();
                  },
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SkinGoalsTubuh(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StickyHeader(
          header: Container(
            color: whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: 'assets/icons/iphone1.png',
                  width: 15,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Email',
                  img: 'assets/icons/email-icons.png',
                  width: 25,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Info Personal',
                  img: 'assets/images/iphone1.png',
                  width: 25,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Beauty Profile',
                  img: 'assets/icons/logo-person.png',
                  width: 20,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: true,
                  title: 'Skin Goals',
                  img: 'assets/icons/logo-person.png',
                  width: 20,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
            // const SizedBox(
            //   height: 23,
            // ),
            // const Divider(
            //   thickness: 1,
            //   color: Color(0XffCCCCCC),
            // ),,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dividergrey(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skin Goals',
                      style: blackHigtTextStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Skin Goals Korektif Wajah',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '"Semoga aku bisa bebas dari...."',
                      style: grenTextStyle.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bisa pilih lebih dari satu ya :)',
                      style: greyTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        CardSkinGoals(
                          title: 'Jerawat',
                          width: 80,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'bekas jerawat',
                          width: 115,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Mata Panda',
                          width: 100,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Flek Hitam & Melasma',
                          width: 160,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kemerahan',
                          width: 100,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kulit Sensitif',
                          width: 105,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kulit Kusam',
                          width: 100,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Bibir Gelap',
                          width: 100,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kulit Berminyak',
                          width: 130,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kulit Kering',
                          width: 110,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kutil',
                          width: 60,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kerutan',
                          width: 90,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Double Chin',
                          width: 110,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kebotakan Rambut',
                          width: 140,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Kantong Mata',
                          width: 120,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Gummy Smile',
                          width: 120,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Tahi Lalat',
                          width: 100,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Rambut Rontok',
                          width: 130,
                          type: 1,
                        ),
                        CardSkinGoals(
                          title: 'Bekas Luka (Scar)',
                          width: 140,
                          type: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Obx(
                      () => LoadingWidget(
                        isLoading: state.isLoading.value,
                        child: ButtonGreenWidget(
                          title: 'Lanjut',
                          onPressed: () async {
                            await state.faceCorrectiveGoals(context,
                                doInPost: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SkinGoalsTubuh(),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
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
