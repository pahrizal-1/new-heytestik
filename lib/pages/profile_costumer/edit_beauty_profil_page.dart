// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/beauty_profile_page.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_wajah.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class EditBeautyProfilPage extends StatefulWidget {
  EditBeautyProfilPage({super.key});

  @override
  State<EditBeautyProfilPage> createState() => _EditBeautyProfilPageState();
}

class _EditBeautyProfilPageState extends State<EditBeautyProfilPage> {
  final ProfileController state = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 31, right: 31, top: 45, bottom: 28),
              child: Column(
                children: [
                  Obx(
                    () => Text(
                      '${state.fullName.value.toUpperCase()} PROFILE',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Beauty Profile',
                        style: blackTextStyle.copyWith(fontSize: 15),
                      ),
                      InkWell(
                        onTap: () async {
                          bool check = await Get.to(BeautyProfilPage(
                            isContinue: false,
                          ));
                          if (check) {
                            await state.getInterest(context);
                          }
                          setState(() {});
                        },
                        child: Text(
                          'Edit',
                          style: grenTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  beutytext(
                    'Tipe Kulit',
                    state.interestData.value.data?.beautyProfile?.skinType ??
                        '-',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Warna Tone Kulit',
                    state.interestData.value.data?.beautyProfile
                            ?.skinToneColor ??
                        '-',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Warna Undertone Kulit',
                    state.interestData.value.data?.beautyProfile
                            ?.skinUndertoneColor ??
                        '-',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Tipe Rambut',
                    state.interestData.value.data?.beautyProfile?.hairType ??
                        '-',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Warna Rambut',
                    state.interestData.value.data?.beautyProfile?.hairColor ??
                        '-',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Hijabers',
                    state.interestData.value.data?.beautyProfile?.hijabers ==
                            true
                        ? 'Iya'
                        : 'Tidak',
                  ),
                ],
              ),
            ),
            dividergreen(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 31, right: 31, top: 28, bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skin Goals',
                        style: blackTextStyle.copyWith(fontSize: 15),
                      ),
                      InkWell(
                        onTap: () async {
                          bool check = await Get.to(SkinGoalsKorektifWajah(
                            isEdit: true,
                            isCompleteProfile: false,
                          ));
                          if (check) {
                            await state.getInterest(context);
                          }
                          setState(() {});
                        },
                        child: Text(
                          'Edit',
                          style: grenTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  skinGoalKorektifWajah('Skin Goals - Korektif Wajah'),
                  SizedBox(
                    height: 19,
                  ),
                  skinGoalKorektifTubuh('Skin Goals - Korektif Tubuh'),
                  SizedBox(
                    height: 19,
                  ),
                  skinGoalAugmentation(
                      'Skin Goals - Augmentation Wajah & Tubuh'),
                  SizedBox(
                    height: 19,
                  ),
                  skinGoalsSexuallyAndSkinDiseases(
                      'Skin Goals - Penyakit Menular Seksual dan Masalah Kulit Lainnya'),
                  SizedBox(
                    height: 19,
                  ),
                  skinGoalPernahTreatment('Pernah Treatment'),
                  SizedBox(
                    height: 19,
                  ),
                  skinGoalsBudget(
                    'Anggaran Skincare',
                    state.interestData.value.data?.skinGoalsBudget
                            ?.budgetForSkincare ??
                        '',
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  skinGoalsBudget(
                    'Anggaran Treatment',
                    state.interestData.value.data?.skinGoalsBudget
                            ?.budgetForTreatment ??
                        '',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column skinGoalKorektifWajah(String title1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 15,
          ),
        ),
        ...?state.interestData.value.data?.skinGoalsFaceCorrective
            ?.map(
              (value) => Text(
                value.nameFaceCorrective.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            )
            .toList()
      ],
    );
  }

  Column skinGoalKorektifTubuh(String title1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 15,
          ),
        ),
        ...?state.interestData.value.data?.skinGoalsBodyCorrective
            ?.map(
              (value) => Text(
                value.nameBodyCorrective.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            )
            .toList()
      ],
    );
  }

  Column skinGoalAugmentation(String title1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 15,
          ),
        ),
        ...?state.interestData.value.data?.skinGoalsAugmentation
            ?.map(
              (value) => Text(
                value.nameAugmentation.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            )
            .toList()
      ],
    );
  }

  Column skinGoalsSexuallyAndSkinDiseases(String title1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 15,
          ),
        ),
        ...?state.interestData.value.data?.skinGoalsSexuallyAndSkinDiseases
            ?.map(
              (value) => Text(
                value.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            )
            .toList()
      ],
    );
  }

  Column skinGoalPernahTreatment(String title1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 15,
          ),
        ),
        ...?state.interestData.value.data?.skinGoalsHistoryTreatment
            ?.map(
              (value) => Text(
                value.nameHistoryTreatment.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            )
            .toList()
      ],
    );
  }

  Column skinGoalsBudget(String title1, String title2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 15,
          ),
        ),
        Text(
          title2,
          style: blackTextStyle.copyWith(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Row beutytext(String title1, String title2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          textAlign: TextAlign.left,
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 13,
          ),
        ),
        Text(
          title2,
          textAlign: TextAlign.right,
          style: blackRegulerTextStyle.copyWith(
            color: blackColor,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
