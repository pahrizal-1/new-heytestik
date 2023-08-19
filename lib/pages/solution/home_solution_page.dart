// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/location_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/medicine_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/treatment/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/models/medicine.dart';
import 'package:heystetik_mobileapps/pages/home/notifikasion_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/keranjang_page.dart';
import 'package:heystetik_mobileapps/pages/solution/obat_solutions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_skincare_page.dart';

import 'package:heystetik_mobileapps/pages/solution/solutions_treatment1_Page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';
import '../../controller/customer/solution/skincare_controller.dart';
import '../../core/currency_format.dart';
import '../../core/global.dart';
import '../../widget/card_widget.dart';
import '../../widget/pencarian_search_widget.dart';
import '../../widget/produk_height_widget.dart';
import '../../widget/produk_widget.dart';

class SolutionPage extends StatefulWidget {
  const SolutionPage({super.key});

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  final LocationController state = Get.put(LocationController());
  final MedicineController medicineController = Get.put(MedicineController());
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final SkincareController stateSkincare = Get.put(SkincareController());

  int activeIndex = 0;
  final images = [
    'assets/images/bg-solutions1.png',
    'assets/images/bg-solutions2.png',
    'assets/images/bg-solutions3.png'
  ];
  int currentIndex = 0;

  List<String> asset = [
    'Peliing.png',
    'IPL.png',
    'Laser.png',
  ];
  List<Data2> drugRecipe = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.initgetCurrentPosition(context);
      drugRecipe.addAll(await medicineController.getDrugRecipe(context, page));
      stateSkincare.getSkincare(context);
      stateTreatment.getTreatment(context);
    });
  }

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
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PencarianPageWidget(),
                ),
              );
            },
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
                    style: subGreyTextStyle.copyWith(
                        color: const Color(0Xff9B9B9B)),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotifikasionPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              color: whiteColor,
              'assets/icons/notif-icons.svg',
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
            child: SvgPicture.asset(
              color: whiteColor,
              'assets/icons/trello-icons.svg',
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
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: ListView(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ObatSolutionsPage(),
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
                    padding: const EdgeInsets.only(left: 25, right: 25),
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
                          Obx(
                            () => Text(
                              state.city.value,
                              style:
                                  blackTextStyle.copyWith(fontWeight: regular),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/icons/icon_gps.svg',
                            width: 15,
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
                      padding: EdgeInsets.only(right: 20, left: 25),
                      child: Row(
                        children: drugRecipe.map((e) {
                          return ProdukObat(
                            medicine: MedicineModel.fromJson(
                                jsonDecode(jsonEncode(e.product))),
                            productId: e.product!.id!.toInt(),
                            namaBrand: e.product?.name ?? '-',
                            harga: CurrencyFormat.convertToIdr(
                                e.product?.price, 0),
                            urlImg:
                                '${Global.FILE}/${e.product!.mediaProducts?[0].media?.path}',
                            duedate:
                                ConvertDate.defaultDate(e.dueDate.toString()),
                          );
                        }).toList(),
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
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
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
                  Obx(
                    () => LoadingWidget(
                      isLoading: stateSkincare.isLoadingSkincare.value,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Center(
                            child: Wrap(
                              spacing: 23,
                              children: stateSkincare.skincare
                                  .map(
                                    (e) => InkWell(
                                      onTap: () {
                                        Get.to(DetailSkinCarePage(
                                          productId: e.id!.toInt(),
                                        ));
                                      },
                                      child: Produkheight(
                                        produkId: e.id!.toInt(),
                                        namaBrand:
                                            e.skincareDetail!.brand.toString(),
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
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: stateTreatment.treatment.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const PeelinngTraetmentPage(),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 230,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${asset[index % 3]}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  gradient: LinearGradient(
                                    colors: [
                                      blackColor.withOpacity(0.5),
                                      Colors.transparent
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 11),
                                    child: Text(
                                      stateTreatment
                                          .treatment[index].treatmentType,
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 18, fontWeight: bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
