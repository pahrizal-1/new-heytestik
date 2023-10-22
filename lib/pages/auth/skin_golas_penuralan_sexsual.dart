import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_gloals_pilih_treamtmnet.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../controller/customer/interest/interest_controller.dart';
import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsPenularan extends StatefulWidget {
  const SkinGoalsPenularan({super.key});

  @override
  State<SkinGoalsPenularan> createState() => _SkinGoalsPenularanState();
}

class _SkinGoalsPenularanState extends State<SkinGoalsPenularan> {
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
              dividergrey(),
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
                      'Penyakit Menular Seksual dan Masalah Kulit Lainnya',
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '“Semoga aku bisa sembuh dari...”',
                      style: grenTextStyle.copyWith(
                          fontSize: 16, fontStyle: FontStyle.italic),
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
                          title: 'Kencing Nanah',
                          width: 120,
                          // type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Keputihan',
                          width: 100,
                          // type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Sifilis',
                          width: 70,
                          // type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Luka Lecet Pada Kemaluan',
                          width: 190,
                          // type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Kutil Kelamin',
                          width: 110,
                          // type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Psoriaris',
                          width: 100,
                          // type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Kutu Kemaluan',
                          width: 120,
                          // type: 4,
                        ),
                        CardSkinGoals(
                          title: 'Eksim',
                          width: 80,
                          // type: 4,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Obx(
                      () => LoadingWidget(
                        isLoading: state.isLoading.value,
                        child: ButtonGreenWidget(
                          title: 'Lanjut',
                          onPressed: () async {
                            // await state.pastTreatmentGoals(context,
                            //     doInPost: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SkinGloalsPilihTreamtmnet(),
                              ),
                            );
                            // });
                          },
                        ),
                      ),
                    ),
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
