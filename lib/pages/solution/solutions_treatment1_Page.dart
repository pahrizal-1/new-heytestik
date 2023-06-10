import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/solution/obat_solutions_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';

class SolutionsTreatment1Page extends StatefulWidget {
  const SolutionsTreatment1Page({super.key});

  @override
  State<SolutionsTreatment1Page> createState() =>
      _SolutionsTreatment1PageState();
}

class _SolutionsTreatment1PageState extends State<SolutionsTreatment1Page> {
  int activeIndex = 0;
  final images = [
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Loksimu',
                        style: blackTextStyle.copyWith(
                            fontSize: 13, fontWeight: regular),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: greenColor,
                      )
                    ],
                  ),
                  Text(
                    'Obat Resep',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/icon-home.png',
            width: 18,
            color: blackColor,
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icons/trello1.png',
            width: 21,
            color: blackColor,
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icons/humberger.png',
            width: 19,
            color: blackColor,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: fromCssColor("#CCCCCC"),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: Image.asset(
                    "assets/icons/search1.png",
                    width: 10,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0, -3, 0),
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15, fontFamily: "ProximaNova"),
                    decoration: InputDecoration(
                      hintText: "Cari Treatment",
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
              ]),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Treatment for you 🥳',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  'Pilihan treatment berdasarkan konsultasimu.',
                  style: subGreyTextStyle.copyWith(
                    fontSize: 14,
                    color: const Color(0xFF9B9B9B),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 111,
                      height: 28,
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: Text(
                          'Bekas Jerawat',
                          style: whiteTextStyle.copyWith(
                              fontWeight: regular, fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 111,
                      height: 28,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: const Color(0xfffCCCCCC))),
                      child: Center(
                        child: Text(
                          'Bekas Jerawat',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 222,
                    width: 164,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/Peliing.png',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(7)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                            colors: [
                              blackColor.withOpacity(0.5),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center),
                      ),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 11),
                            child: Text(
                              'PEELING',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 222,
                    width: 164,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/IPL.png',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(7)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                            colors: [
                              blackColor.withOpacity(0.5),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center),
                      ),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 11),
                            child: Text(
                              'IPL',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: bold),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 222,
                    width: 164,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/images/Laser.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(7)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                            colors: [
                              blackColor.withOpacity(0.5),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 11),
                          child: Text(
                            'LASER',
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final imge = images[index];

              return buildImg1(imge, index);
            },
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: images.length,
              effect: JumpingDotEffect(
                  activeDotColor: greenColor,
                  dotColor: const Color(0xffD9D9D9),
                  dotWidth: 10,
                  dotHeight: 10),
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color(0XFFD9D9D9),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Near me',
                      style: blackTextStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color(0XFFD9D9D9),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Trending',
                      style: blackTextStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color(0XFFD9D9D9),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Klinik',
                      style: blackTextStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: const Color(0XFFD9D9D9),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'TOP Rating!',
                      style: blackTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: lsymetric,
            child: Text(
              'Choose from Concerns',
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CirkelCategory(
                    title: 'Lihat\nSemua',
                    img: 'assets/images/lainnya.png',
                  ),
                  CirkelCategory(
                    title: 'Jerawat',
                    img: 'assets/images/jerawat.png',
                  ),
                  CirkelCategory(
                    title: 'Rambut\nRontok',
                    img: 'assets/images/rambutrontok.png',
                  ),
                  CirkelCategory(
                    title: 'Kerutan',
                    img: 'assets/images/kerutan.png',
                  ),
                  CirkelCategory(
                    title: 'Bekas\nJerawat',
                    img: 'assets/images/bekasjerawat.png',
                  ),
                  CirkelCategory(
                    title: 'ketombe',
                    img: 'assets/images/ketombe.png',
                  ),
                  CirkelCategory(
                    title: 'Kebotakan',
                    img: 'assets/images/kebotakan.png',
                  ),
                  CirkelCategory(
                    title: 'Bekas\nJerawat',
                    img: 'assets/images/dagu.png',
                  ),
                  CirkelCategory(
                    title: 'Kulit\nKusam',
                    img: 'assets/images/kulitkusam.png',
                  ),
                  CirkelCategory(
                    title: 'Skin\nGoals',
                    img: 'assets/images/skingoals.png',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffCCCCCC),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 19, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semua Treatment',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 9,
                ),
                Image.asset(
                  'assets/icons/filters.png',
                  width: 78,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Wrap(
              children: [
                ProdukTreatment(
                  namaKlinik: 'Klinik Utama Lithea',
                  namaTreatmen: 'Radiant Glow Peeling',
                  diskonProduk: '20',
                  hargaDiskon: 'Rp250.000',
                  harga: 'Rp200.000',
                  urlImg: 'assets/images/lheatea.png',
                  rating: '4.9 (120k)',
                  km: '80',
                  lokasiKlinik: 'Bogor Timur',
                ),
                ProdukTreatment(
                  namaKlinik: 'ZAP Plaza Senayan',
                  namaTreatmen: 'Toning Laser',
                  diskonProduk: '20',
                  hargaDiskon: '1,250.000',
                  harga: '1,200.000',
                  urlImg: 'assets/images/zap-senayan.png',
                  rating: '4.9 (120k)',
                  km: '80',
                  lokasiKlinik: 'Bogor Timur',
                ),
                ProdukTreatment(
                  namaKlinik: 'ZAP Plaza Senayan',
                  namaTreatmen: 'IPL Rejuvenation',
                  diskonProduk: '20',
                  hargaDiskon: '100,000.000',
                  harga: '10,200.000',
                  urlImg: 'assets/images/Ipl1.png',
                  rating: '4.9 (120k)',
                  km: '80',
                  lokasiKlinik: 'Bogor Timur',
                ),
                ProdukTreatment(
                  namaKlinik: 'Klinik Utama Lithea',
                  namaTreatmen: 'Radiant Glow Peeling',
                  diskonProduk: '20',
                  hargaDiskon: '250.000',
                  harga: '200.000',
                  urlImg: 'assets/images/laser1.png',
                  rating: '4.9 (120k)',
                  km: '80',
                  lokasiKlinik: 'Bogor Timur',
                ),
                ProdukTreatment(
                  namaKlinik: 'Klinik Utama Lithea',
                  namaTreatmen: 'Radiant Glow Peeling',
                  diskonProduk: '20',
                  hargaDiskon: '250.000',
                  harga: '200.000',
                  urlImg: 'assets/images/laser2.png',
                  rating: '4.9 (120k)',
                  km: '80',
                  lokasiKlinik: 'Bogor Timur',
                ),
                ProdukTreatment(
                  namaKlinik: 'Klinik Utama Lithea',
                  namaTreatmen: 'Radiant Glow Peeling',
                  diskonProduk: '20',
                  hargaDiskon: '250.000',
                  harga: '200.000',
                  urlImg: 'assets/images/lheatea.png',
                  rating: '4.9 (120k)',
                  km: '80',
                  lokasiKlinik: 'Bogor Timur',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
