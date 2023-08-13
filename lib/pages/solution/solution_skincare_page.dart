import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/home/notifikasion_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/keranjang_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_height_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../widget/pencarian_search_widget.dart';
import 'category_skincare.dart';

class SolutionSkincare1Page extends StatefulWidget {
  const SolutionSkincare1Page({super.key});

  @override
  State<SolutionSkincare1Page> createState() => _SolutionSkincare1PageState();
}

class _SolutionSkincare1PageState extends State<SolutionSkincare1Page> {
  final SkincareController state = Get.put(SkincareController());

  int _current = 0;
  final List<String> images = [
    'assets/images/001.png',
    'assets/images/002.png',
    'assets/images/003.png',
  ];
  List<String> imageList = [
    'assets/images/cleanser01.png',
    'assets/images/serum02.png',
    'assets/images/mosturizer03.png',
    'assets/images/toner04.png',
    'assets/images/eyecream05.png',
    'assets/images/sunscreen06.png',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getLookup(context);
      state.getSkincare(context);
    });
  }

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
              Text(
                'Skincare',
                style: blackTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotifikasionPage()));
            },
            child: Image.asset(
              'assets/icons/icon-home.png',
              width: 18,
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KeranjangPage()));
            },
            child: Image.asset(
              'assets/icons/trello1.png',
              width: 21,
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AkunHomePage()));
            },
            child: Image.asset(
              'assets/icons/humberger.png',
              width: 19,
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: InkWell(
              onTap: () {
                Get.to(PencarianPageWidget());
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: fromCssColor('#CCCCCC'),
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 10,
                        ),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 10,
                        ),
                      ),
                      Text(
                        'Cari SkinCare',
                        style: subTitleTextStyle,
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: whiteColor,
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dermatologist’s choice for you👌🏻',
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 18,
                                letterSpacing: 0.5,
                                color: fromCssColor(
                                  '#323232',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 320),
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      'Pilihan skincare berdasarkan konsultasimu.',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: fromCssColor('#A3A3A3'),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Obx(
                            () => LoadingWidget(
                              isLoading: state.isLoadingSkincare.value,
                              child: Center(
                                child: Wrap(
                                  spacing: 23,
                                  runSpacing: 12,
                                  children: state.skincare
                                      .map(
                                        (e) => InkWell(
                                          onTap: () {
                                            Get.to(DetailSkinCarePage(
                                              productId: e.id!.toInt(),
                                            ));
                                          },
                                          child: Produkheight(
                                            produkId: e.id!.toInt(),
                                            namaBrand: e.skincareDetail!.brand
                                                .toString(),
                                            namaProduk: e.name.toString(),
                                            diskonProduk: '20',
                                            hargaDiskon:
                                                CurrencyFormat.convertToIdr(
                                                    e.price, 0),
                                            harga: CurrencyFormat.convertToIdr(
                                                e.price, 0),
                                            urlImg:
                                                '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                            // rating: '4.9 (120k)',
                                            rating: e.rating.toString(),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 195,
                      initialPage: 0,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: images.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(imagePath),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: _current,
                      count: images.length,
                      effect: ScaleEffect(
                          activeDotColor: greenColor,
                          dotColor: const Color(0xffD9D9D9),
                          dotWidth: 6,
                          dotHeight: 6),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop by Category',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: fromCssColor(
                              '#323232',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => LoadingWidget(
                            isLoading: state.isLoadingLookup.value,
                            child: SingleChildScrollView(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: state.lookup.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: borderColor)),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(
                                            CategorySkinCare(
                                              category: state
                                                  .lookup[index].value
                                                  .toString(),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            state.lookup[index].value
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'ProximaNova'),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StickyHeader(
                    header: Container(
                      color: whiteColor,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semua Produk',
                            style: blackHigtTextStyle.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/filters.png',
                                  width: 78,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.only(left: 11.5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: borderColor),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Terbaru',
                                        style: blackRegulerTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.only(left: 11.5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: borderColor),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Etalase Skincare',
                                        style: blackRegulerTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      const Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    content: Obx(
                      () => LoadingWidget(
                        isLoading: state.isLoadingSkincare.value,
                        child: Center(
                          child: Wrap(
                            spacing: 23,
                            runSpacing: 12,
                            children: state.skincare
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      Get.to(DetailSkinCarePage(
                                        // id: e.id!.toInt(),
                                        productId: e.id!.toInt(),
                                      ));
                                    },
                                    child: Produkheight(
                                      produkId: e.id!.toInt(),
                                      namaBrand:
                                          e.skincareDetail!.brand.toString(),
                                      namaProduk: e.name.toString(),
                                      diskonProduk: '20',
                                      hargaDiskon: CurrencyFormat.convertToIdr(
                                          e.price, 0),
                                      harga: CurrencyFormat.convertToIdr(
                                          e.price, 0),
                                      urlImg:
                                          '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                      // rating: '4.9 (120k)',
                                      rating: e.rating.toString(),
                                      kota: 'Amerika Serikat',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
