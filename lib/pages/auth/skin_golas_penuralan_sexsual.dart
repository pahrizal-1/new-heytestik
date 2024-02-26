// ignore_for_file: must_be_immutable, use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_gloals_pilih_treamtmnet.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_skin_goals_model.dart';
import '../../controller/customer/interest/interest_controller.dart';
import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsPenularan extends StatefulWidget {
  bool isEdit;
  bool isCompleteProfile;
  SkinGoalsPenularan({
    required this.isEdit,
    required this.isCompleteProfile,
    super.key,
  });

  @override
  State<SkinGoalsPenularan> createState() => _SkinGoalsPenularanState();
}

class _SkinGoalsPenularanState extends State<SkinGoalsPenularan> {
  final ProfileController stateProfile = Get.put(ProfileController());
  final InterestController state = Get.put(InterestController());
  List<Data2>? data = [];
  List sexuallySkin = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.sexuallySkinDiseases.value.clear();
      data?.addAll(
        await state.lookupSkinGoals(
            context, "SKIN_GOALS_SEXUALLY_SKIN_DISEASES"),
      );

      if (widget.isEdit) {
        for (int i = 0;
            i < stateProfile.skinGoalsSexuallySkinLength.value;
            i++) {
          state.sexuallySkinDiseases.value.add(
            stateProfile.interestData.value.data!
                .skinGoalsSexuallyAndSkinDiseases![i].name
                .toString(),
          );
        }
        for (int i = 0; i < data!.length; i++) {
          var adaGak = state.sexuallySkinDiseases.firstWhereOrNull(
            (item) => item == data?[i].value.toString(),
          );
          if (adaGak == null) {
            sexuallySkin
                .add({'sexuallySkin': data?[i].value, 'checked': false});
          } else {
            sexuallySkin.add({'sexuallySkin': data?[i].value, 'checked': true});
          }
        }
      } else {
        for (int i = 0; i < data!.length; i++) {
          sexuallySkin.add({'sexuallySkin': data?[i].value, 'checked': false});
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return NantiSajaDialog();
                  },
                );
                if (widget.isCompleteProfile) {
                  Get.back(result: true);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SkinGloalsPilihTreamtmnet(
                        isEdit: widget.isEdit,
                        isCompleteProfile: widget.isCompleteProfile,
                      ),
                    ),
                  );
                }
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
                      children: [
                        for (int index = 0;
                            index < sexuallySkin.length;
                            index++)
                          InkWell(
                            onTap: () {
                              var adaGak =
                                  state.sexuallySkinDiseases.firstWhereOrNull(
                                (item) =>
                                    item == sexuallySkin[index]['sexuallySkin'],
                              );

                              if (adaGak == null) {
                                sexuallySkin[index]['checked'] = true;
                                state.sexuallySkinDiseases
                                    .add(sexuallySkin[index]['sexuallySkin']);
                              } else {
                                sexuallySkin[index]['checked'] = false;
                                state.sexuallySkinDiseases.remove(
                                    sexuallySkin[index]['sexuallySkin']);
                              }
                              setState(() {});
                            },
                            child: CardSkinGoals(
                              checked: sexuallySkin[index]['checked'],
                              title: sexuallySkin[index]['sexuallySkin'],
                              width: 99,
                            ),
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
                            await state.sexuallySkinSkinGoals(context,
                                doInPost: () async {
                              if (widget.isCompleteProfile) {
                                Get.back(result: true);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SkinGloalsPilihTreamtmnet(
                                      isEdit: widget.isEdit,
                                      isCompleteProfile:
                                          widget.isCompleteProfile,
                                    ),
                                  ),
                                );
                              }
                            });
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
