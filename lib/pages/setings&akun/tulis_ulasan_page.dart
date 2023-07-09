import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan2_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class TulisUlasaPage extends StatelessWidget {
  const TulisUlasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Tulis Ulasan',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 216,
                  height: 5,
                  decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(7)),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                        color: const Color(0xffF1F1F1),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  '2/3',
                  style: subTitleTextStyle.copyWith(
                      fontSize: 15, fontWeight: bold),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/penting1.png'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ISISPHARMA',
                        style: blackHigtTextStyle.copyWith(fontSize: 13),
                      ),
                      Text(
                        'Teenderm Hydra 40ml',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 13, color: blackColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Bagaimana penilaianmu terhadap produk ini?',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            const SizedBox(
              height: 26,
            ),
            const StartUlasan(
              title: 'Efektivitas',
              widtStarrs: 25,
              fonstsizeTitle: 15,
              iconColor: Color(0xffFFC36A),
            ),
            dividergrey(),
            const SizedBox(
              height: 19,
            ),
            const StartUlasan(
              title: 'Tekstur',
              widtStarrs: 25,
              fonstsizeTitle: 15,
              iconColor: Color.fromRGBO(155, 155, 155, 0.61),
            ),
            dividergrey(),
            const SizedBox(
              height: 19,
            ),
            const StartUlasan(
              iconColor: Color(0xffFFC36A),
              title: 'Packaging',
              widtStarrs: 25,
              fonstsizeTitle: 15,
            ),
            const SizedBox(
              height: 78,
            ),
            Text(
              'Penilaianmu',
              style: blackRegulerTextStyle.copyWith(
                  fontSize: 15, color: blackColor),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  'Excellent Product!',
                  style: grenTextStyle.copyWith(fontSize: 20),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/stars-new.png',
                  width: 25,
                  color: const Color(0xffFFC36A),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '4.7',
                  style: blackHigtTextStyle.copyWith(fontSize: 25),
                ),
              ],
            ),
            const SizedBox(
              height: 44,
            ),
            ButtonGreenWidget(
              title: 'Lanjut',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TulisUlasan2Page()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class StartUlasan extends StatelessWidget {
  final double? fonstsizeTitle;
  final double? widtStarrs;
  final String title;
  final Color? iconColor;
  const StartUlasan({
    super.key,
    required this.title,
    this.iconColor,
    this.fonstsizeTitle,
    this.widtStarrs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: blackRegulerTextStyle.copyWith(
                  fontSize: fonstsizeTitle, color: blackColor),
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/stars-new.png',
              width: widtStarrs,
              color: const Color(0xffFFC36A),
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              'assets/icons/stars-new.png',
              width: widtStarrs,
              color: const Color(0xffFFC36A),
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              'assets/icons/stars-new.png',
              width: widtStarrs,
              color: const Color(0xffFFC36A),
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              'assets/icons/stars-new.png',
              width: widtStarrs,
              color: const Color(0xffFFC36A),
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              'assets/icons/stars-new.png',
              width: widtStarrs,
              color: iconColor,
            )
          ],
        ),
        const SizedBox(
          height: 19,
        ),
      ],
    );
  }
}
