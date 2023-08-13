import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_skincare_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';
import '../../widget/rating_dengan_ulasan_widgets.dart';
import '../../widget/share_solusion_widget_page.dart';

class DetailSkinUlasanSkincare extends StatelessWidget {
  const DetailSkinUlasanSkincare({super.key});

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
                'Detail Ulasan',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: false,
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(25),
                    topStart: Radius.circular(25),
                  ),
                ),
                builder: (context) => ShareShowWidget(),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/share-icons.svg',
            ),
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                  color: Color.fromRGBO(204, 204, 204, 0.80).withOpacity(0.4)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/alert-new.png',
                    width: 20,
                    color: Color.fromARGB(255, 146, 146, 146),
                    height: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Ulasan tidak bisa diubah karena kamu sudah mengubah 2 kali atau lebih dari 30 hari sejak ulasan terkirim.',
                      style: blackRegulerTextStyle.copyWith(fontSize: 11),
                    ),
                  ),
                ],
              ),
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
              height: 9,
            ),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return Image.asset('assets/icons/stars-new.png',
                        width: 12, color: const Color(0xffFFC36A));
                  }),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '8 Jam',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              'Produk Bagus',
              style: blackRegulerTextStyle.copyWith(fontSize: 13),
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
              title: 'Effectiveness Rating',
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
              title: 'Packaging Rating',
              widtStarrs: 25,
              fonstsizeTitle: 15,
            ),
            const SizedBox(
              height: 40,
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
                  style: grenTextStyle.copyWith(fontSize: 15),
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
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Berapa lama kamu menggunakan produk ini?',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '1 Minggu',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Apakah kamu akan merekomendasikan produk ini?',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Ya',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Apakah kamu akan membeli lagi produk ini?',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Tidak',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
