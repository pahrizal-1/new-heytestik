import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_skincare2_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../widget/share_solusion_widget_page.dart';

class DetailPageUlasan extends StatelessWidget {
  const DetailPageUlasan({super.key});

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
      body: ListView(
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 21, bottom: 26),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: borderColor),
                      color:
                          Color.fromRGBO(204, 204, 204, 0.80).withOpacity(0.4)),
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
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/stars-new.png',
                      width: 12,
                      height: 12,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '11 Juni 2019',
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  'Baguuuuuusss, teksturnya lembut, nampol banget buat ngatasin kulitku yang lagi jerawatan. Recommended bangeeeeeettttt!!!',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 13,
                ),
                dividergrey(),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      width: 3,
                      height: 47,
                      decoration: BoxDecoration(
                        color: Color(0xffECECEC),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'oleh',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              ' MinHey',
                              style: blackTextStyle.copyWith(
                                  fontSize: 13, color: const Color(0xFF6B6B6B)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Sama-sama kak, senang bisa membantu :)\nDitunggu pembelian selanjutnya yaaa :)',
                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 26, bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bagaimana penilaianmu terhadap produk ini?',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 26,
                ),
                const StartUlasan(
                  widtStarrs: 20,
                  fonstsizeTitle: 13,
                  title: 'Efektivitas',
                  iconColor: Color(0xffFFC36A),
                ),
                dividergrey(),
                const SizedBox(
                  height: 19,
                ),
                const StartUlasan(
                  widtStarrs: 20,
                  fonstsizeTitle: 13,
                  title: 'Tekstur',
                  iconColor: Color.fromRGBO(155, 155, 155, 0.61),
                ),
                dividergrey(),
                const SizedBox(
                  height: 19,
                ),
                const StartUlasan(
                  widtStarrs: 20,
                  fonstsizeTitle: 13,
                  iconColor: Color(0xffFFC36A),
                  title: 'Packaging',
                ),
                const SizedBox(
                  height: 29,
                ),
                Text(
                  'Penilaianmu',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 13, color: blackColor),
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
                      width: 19,
                      color: const Color(0xffFFC36A),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '4.7',
                      style: blackHigtTextStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
