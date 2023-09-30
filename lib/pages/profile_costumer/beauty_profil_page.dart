import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/edit_beauty_profil_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class BeautyProfil extends StatelessWidget {
  const BeautyProfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
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
                  Get.to(EditBeautyProfilPage());
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
            'Netral',
            'Tipe Rambut',
            'Bergelombang',
          ),
          SizedBox(
            height: 19,
          ),
          tipeKulit(
            'Warna Rambut',
            'Berwarna',
            'Hijabers',
            'Iya',
          ),
          SizedBox(
            height: 29,
          ),
          skingoalstext('Skin Goals - Korektif Wajah',
              'Bekas Jerawat, Kemerahan, Kulit Kering, Flek Hitam, Melasma'),
          SizedBox(
            height: 19,
          ),
          skingoalstext('Skin Goals - Korektif Tubuh', '-'),
          SizedBox(
            height: 19,
          ),
          skingoalstext('Skin Goals - Augmentation Wajah & Tubuh',
              'Hidung Mancung, Rahang Tegas'),
          SizedBox(
            height: 19,
          ),
          skingoalstext('Pernah Treatment', 'Facial, Peeling'),
          SizedBox(
            height: 19,
          ),
          skingoalstext('Anggaran Skincare', 'Rp500.000 - Rp1.000.000'),
          SizedBox(
            height: 19,
          ),
          skingoalstext('Anggaran Treatment', 'Rp500.000 - Rp1.000.000'),
        ],
      ),
    );
  }

  Column skingoalstext(String title1, String title2) {
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
