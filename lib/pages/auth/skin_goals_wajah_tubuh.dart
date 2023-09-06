import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_treameant.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../controller/customer/interest/interest_controller.dart';
import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsTiga extends StatefulWidget {
  const SkinGoalsTiga({super.key});

  @override
  State<SkinGoalsTiga> createState() => _SkinGoalsSatuState();
}

class _SkinGoalsSatuState extends State<SkinGoalsTiga> {
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
          ),
          content: Column(
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
                padding: lsymetric,
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
                      'Kamu pernah treatment apa aja?',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Kamu bisa pilih lebih dari satu treatment yang pernah kamu lakukan :)',
                      style: greyTextStyle.copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        CardSkinGoals(
                          title: 'Cryolipolysis',
                          width: 120,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Facial',
                          width: 80,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Electrocauter',
                          width: 120,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Filler',
                          width: 80,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'HIFU',
                          width: 80,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'IPL',
                          width: 60,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Laser CO2',
                          width: 100,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Laser Erbium',
                          width: 110,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Laser Pico',
                          width: 100,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Laser Nd:YAG',
                          width: 110,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Laser Pulsed Dye',
                          width: 130,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'LED Light Therapy',
                          width: 140,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Mesotherapy',
                          width: 110,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Microneedling',
                          width: 120,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Peeling',
                          width: 80,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Mikrodermabrasi',
                          width: 130,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Oxygen Facial',
                          width: 120,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'PRP',
                          width: 60,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Radio Frekuensi',
                          width: 130,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Skin Booster',
                          width: 110,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Subsisi',
                          width: 80,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Suntik Botulinum Toxic',
                          width: 160,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Suntik DNA Salmon',
                          width: 140,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Suntik Jerawat',
                          width: 120,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Suntik Keloid',
                          width: 110,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Tanam Benang',
                          width: 120,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Blepharoplasty',
                          width: 120,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Facelift',
                          width: 80,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Facial Fat Transfer',
                          width: 140,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Rhinoplasty',
                          width: 100,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Liposuction',
                          width: 100,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Transfer Lemak',
                          width: 118,
                          type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Tummy Tuck',
                          width: 105,
                          type: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 39,
                    ),
                    ButtonGreenWidget(
                      title: 'Lanjut',
                      onPressed: () async {
                        await state.pastTreatmentGoals(context,
                            doInPost: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SkinGoalsEmpat(),
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
