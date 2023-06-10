import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/controller/interest/interest_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_dua.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsTubuh extends StatefulWidget {
  const SkinGoalsTubuh({super.key});

  @override
  State<SkinGoalsTubuh> createState() => _SkinGoalsTubuhState();
}

class _SkinGoalsTubuhState extends State<SkinGoalsTubuh> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<InterestController>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: 'assets/images/iphone1.png',
                  width: 18,
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
                  width: 30,
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
                  width: 20,
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
                  width: 25,
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
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            const Divider(
              thickness: 1,
              color: Color(0XffCCCCCC),
            ),
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
                    'Skin Goals Korektif Tubuh',
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
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      CardSkinGoals(
                        title: 'Lemak Membandel',
                        width: 150,
                        type: 2,
                      ),
                      CardSkinGoals(
                        title: 'Stretch Mark',
                        width: 115,
                        type: 2,
                      ),
                      CardSkinGoals(
                        title: 'Selulit',
                        width: 80,
                        type: 2,
                      ),
                      CardSkinGoals(
                        title: 'Vitiligo',
                        width: 80,
                        type: 2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 220,
                  ),
                  ButtonGreenWidget(
                    title: 'Lanjut',
                    onPressed: () async {
                      await state.bodyCorrectiveGoals(context,
                          doInPost: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SkinGoalsDua(),
                          ),
                        );
                      });
                    },
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
    );
  }
}
