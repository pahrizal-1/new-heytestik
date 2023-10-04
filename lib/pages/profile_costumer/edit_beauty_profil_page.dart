import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/auth/beauty_profile_page.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_wajah.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class EditBeautyProfilPage extends StatelessWidget {
  const EditBeautyProfilPage({super.key});

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
                  Text(
                    'RINA’S PROFILE',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
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
                        onTap: () {
                          Get.to(BeautyProfilPage());
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
                    'Kering',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Warna Tone Kulit',
                    'Kuning Langsat',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Warna Undertone Kulit',
                    'Netral',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Tipe Rambut',
                    'Bergelombang',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Warna Rambut',
                    'Berwarna',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  beutytext(
                    'Hijabers',
                    'Iya',
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
                        onTap: () {
                          Get.to(SkinGoalsKorektifWajah());
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
                  skingoalstext(
                      'Anggaran Treatment', 'Rp500.000 - Rp1.000.000'),
                ],
              ),
            )
          ],
        ),
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
        SizedBox(
          height: 6,
        ),
        Text(
          title2,
          style: blackRegulerTextStyle.copyWith(
            color: blackColor,
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
          style: blackRegulerTextStyle.copyWith(
            color: Color(
              0xff9B9B9B,
            ),
            fontSize: 13,
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(EditBeautyProfilPage());
          },
          child: Text(
            title2,
            style: blackRegulerTextStyle.copyWith(
              color: blackColor,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
