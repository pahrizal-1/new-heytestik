import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_tubuh.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/interest/interest_controller.dart';
import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsSatu extends StatefulWidget {
  const SkinGoalsSatu({super.key});

  @override
  State<SkinGoalsSatu> createState() => _SkinGoalsSatuState();
}

class _SkinGoalsSatuState extends State<SkinGoalsSatu> {
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
                  ButtonGreenWidget(
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
