import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/pages/solution/obat_solutions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/peliing_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_skincare_page.dart';

import 'package:heystetik_mobileapps/pages/solution/solutions_treatment1_Page.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/card_widget.dart';
import '../../widget/produk_widget.dart';

class SolutionPage extends StatefulWidget {
  const SolutionPage({super.key});

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  int activeIndex = 0;
  final images = [
    'assets/images/bg-solutions1.png',
    'assets/images/bg-solutions2.png',
    'assets/images/bg-solutions3.png'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Container(
          padding: const EdgeInsets.only(left: 13),
          width: 237,
          height: 35,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 20,
                  color: greyColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Cari',
                  style: subGreyTextStyle.copyWith(
                      color: const Color(0Xff9B9B9B), fontSize: 15),
                ),
                Text(
                  "'Solution'",
                  style: subGreyTextStyle.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      color: const Color(0Xff9B9B9B),
                      fontWeight: bold),
                ),
                Text(
                  '-mu disini',
                  style:
                      subGreyTextStyle.copyWith(color: const Color(0Xff9B9B9B)),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/icon-home.png',
            width: 18,
            color: whiteColor,
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icons/trello1.png',
            width: 21,
            color: whiteColor,
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icons/humberger.png',
            width: 20,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, realIndex) {
              final imge = images[index];

              return buildImg1(imge, index);
            },
            options: CarouselOptions(
              height: 210,
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
              effect: ScaleEffect(
                  activeDotColor: greenColor,
                  dotColor: const Color(0xffD9D9D9),
                  dotWidth: 6,
                  dotHeight: 6),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ObatSolutionsPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/obat_resep.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SolutionSkincare1Page(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/skincare.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SolutionsTreatment1Page(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/treatmean.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 14, top: 8, bottom: 7, right: 14),
                  width: 340,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor, width: 0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/map.svg'),
                      const SizedBox(
                        width: 11,
                      ),
                      Text(
                        'Jakarta Selatan',
                        style: blackTextStyle.copyWith(fontWeight: regular),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/icon_gps.svg',
                        width: 15,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  children: [
                    Text(
                      'Resep solusi buat kamu ✨',
                      style: blackHigtTextStyle.copyWith(fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      'Lihat Semua',
                      style: grenTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: subwhiteColor, width: 0.4),
                        ),
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 107,
                              width: 127,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/noroid.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                padding: const EdgeInsets.only(left: 8),
                                constraints:
                                    const BoxConstraints(maxWidth: 120),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Noroid Soothing Cream 80ml'),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Rp152.500',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Per Tube',
                                      style: subGreyTextStyle.copyWith(
                                          fontSize: 12,
                                          color: const Color(0xFF9B9B9B)),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Dapat dibeli hingga 20 April 2023',
                                      style: grenTextStyle.copyWith(
                                        fontSize: 11,
                                        fontWeight: medium,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: greenColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '+ Keranjang',
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: subwhiteColor, width: 0.4),
                        ),
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 107,
                              width: 127,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/degenda_cream.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              constraints: const BoxConstraints(maxWidth: 120),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text('Digenta Cream 10g'),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'Rp152.500',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Per Tube',
                                    style: subGreyTextStyle.copyWith(
                                        fontSize: 12,
                                        color: const Color(0xFF9B9B9B)),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Dapat dibeli hingga 20 April 2023',
                                    style: grenTextStyle.copyWith(
                                      fontSize: 11,
                                      fontWeight: medium,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: greenColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+ Keranjang',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 12),
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
                      const ProdukKeranjang(
                          namaBrand: 'ISISPHARMA',
                          namaProduk: 'Teenderm Gel',
                          diskonProduk: '20%',
                          hargaDiskon: 'Rp250.000',
                          harga: 'Rp200.000',
                          urlImg: 'assets/images/catabria.png',
                          rating: '4.9 (120k)')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      'Skincare buat ',
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      'skin goals-mu!',
                      style: blackHigtTextStyle.copyWith(
                          fontSize: 15, fontStyle: FontStyle.italic),
                    ),
                    const Spacer(),
                    Text(
                      'Lihat Semua',
                      style: grenTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: const [
                      CardSkincare(
                        title: 'Cleanser',
                      ),
                      CardSkincare(
                        title: 'Serum',
                      ),
                      CardSkincare(
                        title: 'Moisturizer',
                      ),
                      CardSkincare(
                        title: 'Toner',
                      ),
                      CardSkincare(
                        title: 'Eye Cream',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: const [
                      ProdukKeranjang(
                        namaBrand: 'ISISPHARMA',
                        namaProduk: 'Teenderm Gel',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp1,100,00',
                        harga: 'Rp900.000',
                        urlImg: 'assets/images/plasma.png',
                        rating: '4.9 (120k)',
                      ),
                      ProdukKeranjang(
                        namaBrand: 'CANTABRIA',
                        namaProduk:
                            'Neoretin Discrom Control Pigment Neutralizer Serum',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp500.000',
                        harga: 'Rp200.000',
                        urlImg: 'assets/images/catabria.png',
                        rating: '4.9 (120k)',
                      ),
                      ProdukKeranjang(
                        namaBrand: 'ISISPHARMA',
                        namaProduk: 'Teenderm Gel',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp250.000',
                        harga: 'Rp200.000',
                        urlImg: 'assets/images/catabria2.png',
                        rating: '4.9 (120k)',
                      ),
                      ProdukKeranjang(
                        namaBrand: 'ISISPHARMA',
                        namaProduk: 'Endocare Tensage Cream',
                        diskonProduk: '20%',
                        hargaDiskon: 'Rp250.000',
                        harga: 'Rp200.000',
                        urlImg: 'assets/images/catabria.png',
                        rating: '4.9 (120k)',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 41,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'Rekomendasi Treatment  ',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PeelinngTraetmentPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 222,
                          width: 127,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/Peliing.png'),
                              ),
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
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 222,
                        width: 127,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/IPL.png'),
                            ),
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
                        width: 127,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/Laser.png'),
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
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
