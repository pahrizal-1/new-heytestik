import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/bantuan_mihey/pilih_transaksi_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/theme.dart';
import '../../widget/appar_cutome.dart';

class HomeMinheyPage extends StatelessWidget {
  const HomeMinheyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        colorIcons: blackColor,
        colorTitle: blackColor,
        title: 'Bantuan MinHey',
        bgColor: whiteColor,
      ),
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 26, right: 26, top: 20, bottom: 17),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/icons/bg_wekkly.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, sobat Hey 👋🏻',
                  style: whiteTextStyle.copyWith(
                      fontWeight: regular, fontSize: 15),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Ada yang bisa Minhey bantu?',
                  style: whiteTextStyle.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 13,
                          right: 10,
                        ),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 15,
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -4, 0),
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: TextFormField(
                          // controller: searchController,
                          // onEditingComplete: () async {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => TreatmentSearch(
                          //           search: searchController.text),
                          //     ),
                          //   );
                          // page = 1;
                          // treatments.clear();
                          // search = searchController.text;
                          // treatments.addAll(await stateTreatment.getAllTreatment(context, page, search: search));
                          // setState(() {});
                          // },
                          style: const TextStyle(
                              fontSize: 15, fontFamily: "ProximaNova"),
                          decoration: InputDecoration(
                            hintText: "Cari topik atau ketik pertanyaanmu",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: "ProximaNova",
                              color: fromCssColor(
                                '#9B9B9B',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(top: 20, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ada kendala dalam transaksimu?',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Pilih transaksi yang berkendala dalam 1 bulan terakhir',
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 288,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: borderColor),
                        ),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '12 Jun 2023',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 10),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xff24A7A0).withOpacity(0.2),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Text(
                                  'Selesai',
                                  style: grenTextStyle.copyWith(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/penting1.png',
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Teenderm Hydra 40ml',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 13),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '1 Barang',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: ' +2 barang lainnya',
                                          style: grenTextStyle.copyWith(
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Total :',
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: ' Rp915.000',
                                          style: grenTextStyle.copyWith(
                                            fontSize: 12,
                                            color: Color(
                                              0xffF76707,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Pilih Solusi Cepat',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: whiteColor,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                InkWell(
                  onTap: () {
                    Get.to(PilihTranskasiMinheyPage());
                  },
                  child: Text(
                    'Pilih Transaksi Lain',
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          dividergreen(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: lsymetric.copyWith(top: 20),
                child: Text(
                  'Pilih topik sesuai kendalamu',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/akun&keamanan.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Akun &\nKeamanan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/pesanan.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pesanan\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/pengriman.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pengiriman\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/icons/pembayraan.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pembayaran\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/promosi.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Promosi\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/komplanPesanan.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Komplan \nPesanan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/pengembaliandana.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pengembalian\nDana',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/lainnya.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Lainya',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 46,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yang sering ditanyakan',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                TextArrow(
                  title1: 'Apakah Heystetik itu Klinik?',
                ),
                TextArrow(
                  title1:
                      'Apakah saya bisa mengajukan pengembalian\ndana apabila saya membatalkan konsultasi?',
                ),
                TextArrow(
                  title1: 'Apakah Heystetik itu Klinik?',
                ),
                TextArrow(
                  title1: 'Apakah Heystetik itu Klinik?',
                ),
                SizedBox(
                  height: 47,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 22, bottom: 41),
            color: Color(0xffCCCCCC).withOpacity(0.3),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Hubungi Customer Support',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Kami siap membantu :)',
                style: blackRegulerTextStyle.copyWith(fontSize: 13),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/mail-icons-cirkel.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () =>
                        launchUrl(Uri.parse('mailto:Care@heystetik.com')),
                    child: Text(
                      'Care@heystetik.com',
                      style: grenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/wa-icons-Wassap.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse('https://wa.link/tk5uzg')),
                    child: Text(
                      '+62 8517 120 2394',
                      style: grenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
          Padding(
            padding: lsymetric.copyWith(bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextArrow(
                  title1: 'Syarat & Ketentuan Penggunaan Heystetik',
                ),
                TextArrow(
                  title1: 'Kebijakan Privasi Heystetik',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextArrow extends StatelessWidget {
  final String title1;
  final VoidCallback? onPressed;
  const TextArrow({
    super.key,
    required this.title1,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Text(
            title1,
            style: blackRegulerTextStyle.copyWith(fontSize: 14),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right,
            color: greenColor,
          ),
        ],
      ),
    );
  }
}
