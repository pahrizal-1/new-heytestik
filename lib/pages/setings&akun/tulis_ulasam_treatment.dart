import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_page.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class TulisUlasanTreatMent extends StatefulWidget {
  const TulisUlasanTreatMent({super.key});

  @override
  State<TulisUlasanTreatMent> createState() => _TulisUlasanTreatMentState();
}

class _TulisUlasanTreatMentState extends State<TulisUlasanTreatMent> {
  List<String> titleCirkel = [
    'Kurang dari 1 Minggu',
    '1 Minggu - 1 Bulan',
    '1 - 3 Bulan',
    '3 - 6 Bulan',
    '6 Bulan - 1 Tahun',
    'Lebih dari 1 Tahun',
  ];
  List<String> titleRekomendasi = [
    'Yoi, Pasti dong!',
    'Nggak deh',
  ];
  List<String> iconRekomendasi = [
    'assets/icons/icons-ya.png',
    'assets/icons/icons-tidak.png',
  ];
  List<String> titleProduk = [
    'Yoi, Pasti dong!',
    'Nggak deh',
    'Mungkin',
  ];
  List<String> iconProduk = [
    'assets/icons/icons-ya.png',
    'assets/icons/icons-tidak.png',
    'assets/icons/icons-mungkin.png'
  ];
  int isRekomendasi = 0;
  int isProduk = 0;
  int isSelected = 0;
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5,
                        decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(
                      '2/2',
                      style: subTitleTextStyle.copyWith(
                          fontSize: 15, fontWeight: bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
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
                                image: AssetImage('assets/images/lheatea.png'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fecial Treament',
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
                  'Bagaimana penilaianmu terhadap Treamrnt ini?',
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
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Penilaianmu',
                          style: blackRegulerTextStyle.copyWith(
                              fontSize: 15, color: blackColor),
                        ),
                        Text(
                          'Excellent Product!',
                          style: grenTextStyle.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/stars.svg',
                      width: 23,
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
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: lsymetric.copyWith(bottom: 30),
            child: const ButtonGreenWidget(title: 'Kirim'),
          )
        ],
      ),
    );
  }
}
