import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';

class BeautyFollower extends StatelessWidget {
  BeautyFollower({
    super.key,
  });

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
              'Rina',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            Text(
              'Jakarta, 20 tahun',
              style: blackRegulerTextStyle.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 19,
            ),
            tipeKulit(
              'Tipe Kulit',
              'Kering',
              'Warna Tone Kulit',
              'Kuning Langsat',
            ),
            SizedBox(
              height: 19,
            ),
            tipeKulit(
              'Warna Undertone Kulit',
              'Nettral',
              'Tipe Rambut',
              'Bergelombang',
            ),
            SizedBox(
              height: 19,
            ),
            tipeKulit('Warna Rambut', 'Berwarna', 'Hijabers', 'Iya'),
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
        Text(
          '-',
          style: blackTextStyle.copyWith(
            fontSize: 15,
          ),
        ),
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
        Text(
          'Bekas Jerawat, Kemerahan, Kulit Kering, Flek Hitam, Melasma',
          style: blackTextStyle.copyWith(
            fontSize: 15,
          ),
        ),
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
      Text(
        'Bekas Jerawat, Kemerahan, Kulit Kering, Flek Hitam, Melasma',
        style: blackTextStyle.copyWith(
          fontSize: 15,
        ),
      ),
    ]);
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
