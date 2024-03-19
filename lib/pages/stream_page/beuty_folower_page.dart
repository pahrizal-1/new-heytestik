// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/models/customer/interest_model.dart'
    as Interest;
import 'package:heystetik_mobileapps/models/customer/user_profile_overview_model.dart'
    as Overview;
import 'package:heystetik_mobileapps/theme/theme.dart';

class BeautyFollower extends StatelessWidget {
  Overview.Data? userOverview;
  Interest.Data? userInterest;
  BeautyFollower(
      {super.key, required this.userInterest, required this.userOverview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
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
              ],
            ),
            SizedBox(
              height: 37,
            ),
            Text(
              userOverview?.fullname ?? "",
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            Text(
              '${userOverview?.city is String ? "${userOverview?.city}" : ""}${userOverview?.city is String && userOverview?.age is int ? ", " : ""}${userOverview?.age is int ? '${userOverview?.age} tahun' : ''}',
              style: blackRegulerTextStyle.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 19,
            ),
            tipeKulit(
              'Tipe Kulit',
              userInterest?.beautyProfile?.skinType ?? '',
              'Warna Tone Kulit',
              userInterest?.beautyProfile?.skinToneColor ?? '',
            ),
            SizedBox(
              height: 19,
            ),
            tipeKulit(
              'Warna Undertone Kulit',
              userInterest?.beautyProfile?.skinUndertoneColor ?? '',
              'Tipe Rambut',
              userInterest?.beautyProfile?.hairType ?? '',
            ),
            SizedBox(
              height: 19,
            ),
            tipeKulit(
              'Warna Rambut',
              userInterest?.beautyProfile?.hairColor ?? '',
              'Hijabers',
              userInterest?.beautyProfile?.hijabers == true ? 'Iya' : 'Tidak',
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
            skinGoalAugmentation('Skin Goals - Augmentation Wajah & Tubuh'),
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
              userInterest?.skinGoalsBudget?.budgetForSkincare ?? '',
            ),
            skinGoalsBudget(
              'Anggaran Treatment',
              userInterest?.skinGoalsBudget?.budgetForTreatment ?? '',
            ),
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
        ...?userInterest?.skinGoalsFaceCorrective
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
        ...?userInterest?.skinGoalsBodyCorrective
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title1,
        style: blackRegulerTextStyle.copyWith(
          color: Color(
            0xff9B9B9B,
          ),
          fontSize: 15,
        ),
      ),
      ...?userInterest?.skinGoalsAugmentation
          ?.map(
            (value) => Text(
              value.nameAugmentation.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
          )
          .toList()
    ]);
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
        ...?userInterest?.skinGoalsSexuallyAndSkinDiseases
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
        ...?userInterest?.skinGoalsHistoryTreatment
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
