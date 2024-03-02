import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/location_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/edit_beauty_profil_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class BeautyProfil extends StatelessWidget {
  BeautyProfil({
    super.key,
  });
  final ProfileController state = Get.put(ProfileController());
  final LocationController stateLocation = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BEAUTY PROFILE',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => EditBeautyProfilPage());
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
              height: 37,
            ),
            Obx(
              () => Text(
                state.fullName.value,
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
            ),
            Obx(
              () => Text(
                '${stateLocation.myCity.value}${state.age.value == 0 ? '' : ', ${state.age.value} tahun'}',
                style: blackRegulerTextStyle.copyWith(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => tipeKulit(
                'Tipe Kulit',
                state.interestData.value.data?.beautyProfile?.skinType ?? '',
                'Warna Tone Kulit',
                state.interestData.value.data?.beautyProfile?.skinToneColor ??
                    '',
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => tipeKulit(
                'Warna Undertone Kulit',
                state.interestData.value.data?.beautyProfile
                        ?.skinUndertoneColor ??
                    '',
                'Tipe Rambut',
                state.interestData.value.data?.beautyProfile?.hairType ?? '',
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => tipeKulit(
                'Warna Rambut',
                state.interestData.value.data?.beautyProfile?.hairColor ?? '',
                'Hijabers',
                state.interestData.value.data?.beautyProfile?.hijabers == true
                    ? 'Iya'
                    : 'Tidak',
              ),
            ),
            SizedBox(
              height: 29,
            ),
            Obx(
              () => skinGoalKorektifWajah('Skin Goals - Korektif Wajah'),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => skinGoalKorektifTubuh('Skin Goals - Korektif Tubuh'),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => skinGoalAugmentation(
                  'Skin Goals - Augmentation Wajah & Tubuh'),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => skinGoalsSexuallyAndSkinDiseases(
                  'Skin Goals - Penyakit Menular Seksual dan Masalah Kulit Lainnya'),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => skinGoalPernahTreatment('Pernah Treatment'),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => skinGoalsBudget(
                'Anggaran Skincare',
                state.interestData.value.data?.skinGoalsBudget
                        ?.budgetForSkincare ??
                    '',
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Obx(
              () => skinGoalsBudget(
                'Anggaran Treatment',
                state.interestData.value.data?.skinGoalsBudget
                        ?.budgetForTreatment ??
                    '',
              ),
            ),
          ],
        ),
      ),
    ));
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
            .toList(),
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

  Row tipeKulit(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: blackRegulerTextStyle.copyWith(
                color: Color(
                  0xff9B9B9B,
                ),
              ),
            ),
            Text(
              text2,
              style: blackTextStyle.copyWith(fontSize: 15),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text3,
              style: blackRegulerTextStyle.copyWith(
                color: Color(0xff9B9B9B),
              ),
            ),
            Text(
              text4,
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
          ],
        )
      ],
    );
  }
}
