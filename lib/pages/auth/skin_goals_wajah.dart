// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_skin_goals_model.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_tubuh.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../controller/customer/interest/interest_controller.dart';
import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsKorektifWajah extends StatefulWidget {
  bool isContinue = false;
  bool isEdit = false;
  SkinGoalsKorektifWajah(
      {this.isContinue = false, this.isEdit = false, super.key});
  @override
  State<SkinGoalsKorektifWajah> createState() => _SkinGoalsKorektifWajahState();
}

class _SkinGoalsKorektifWajahState extends State<SkinGoalsKorektifWajah> {
  final InterestController state = Get.put(InterestController());
  final ProfileController stateProfile = Get.put(ProfileController());
  List<Data2>? data = [];
  List face = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.faceCorrective.value.clear();
      data?.addAll(
        await state.lookupSkinGoals(context, "SKIN_GOALS_CORRECTIVE_FACE"),
      );

      if (widget.isEdit) {
        for (int i = 0;
            i <
                stateProfile
                    .interestData.value.data!.skinGoalsFaceCorrective!.length;
            i++) {
          state.faceCorrective.value.add(
            stateProfile.interestData.value.data!.skinGoalsFaceCorrective![i]
                .nameFaceCorrective
                .toString(),
          );
        }
        for (int i = 0; i < data!.length; i++) {
          var adaGak = state.faceCorrective.firstWhereOrNull(
            (item) => item == data?[i].value.toString(),
          );
          if (adaGak == null) {
            face.add({'face': data?[i].value, 'checked': false});
          } else {
            face.add({'face': data?[i].value, 'checked': true});
          }
        }
      } else {
        for (int i = 0; i < data!.length; i++) {
          face.add({'face': data?[i].value, 'checked': false});
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => SkinGoalsTubuh(
                      isEdit: true,
                    ),
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
                        for (int index = 0; index < face.length; index++)
                          InkWell(
                            onTap: () {
                              var adaGak =
                                  state.faceCorrective.firstWhereOrNull(
                                (item) => item == face[index]['face'],
                              );

                              if (adaGak == null) {
                                face[index]['checked'] = true;

                                state.faceCorrective.add(face[index]['face']);
                              } else {
                                face[index]['checked'] = false;

                                state.faceCorrective
                                    .remove(face[index]['face']);
                              }
                              setState(() {});
                            },
                            child: CardSkinGoals(
                              checked: face[index]['checked'],
                              title: face[index]['face'],
                              width: 99,
                            ),
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
                          title: widget.isContinue ? 'Simpan' : 'Lanjut',
                          onPressed: () async {
                            await state.faceCorrectiveGoals(context,
                                doInPost: () async {
                              if (widget.isContinue) {
                                Get.back(result: true);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SkinGoalsTubuh(
                                      isEdit: true,
                                    ),
                                  ),
                                );
                              }
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
