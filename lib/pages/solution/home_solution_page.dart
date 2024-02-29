// ignore_for_file: use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/location_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/treatment/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/drug_solutions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/pencarian_klinik_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/solution/search_solution_page.dart';
import 'package:heystetik_mobileapps/pages/solution/skincare_search_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_skincare_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solutions_treatment1_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/maps_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart'
    as DrugRecipe;
import '../../controller/customer/solution/skincare_controller.dart';
import '../../core/currency_format.dart';
import '../../core/global.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;
import '../../widget/skincare_widget.dart';
import '../../widget/produk_widget.dart';

class SolutionPage extends StatefulWidget {
  const SolutionPage({super.key});

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  final LocationController state = Get.put(LocationController());
  final DrugController stateDrug = Get.put(DrugController());
  final SkincareController stateSkincare = Get.put(SkincareController());
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final EtalaseController stateEtalase = Get.put(EtalaseController());

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
  List<DrugRecipe.Data2> drugRecipe = [];
  List<Lookup.Data2> lookupCategory = [];
  List<Skincare.Data2> skincare = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.getLocation(context);
      drugRecipe.addAll(await stateDrug.getDrugRecipe(context, page));
      lookupCategory
          .addAll(await stateEtalase.getLookup(context, 'SKINCARE_CATEGORY'));
      skincare.addAll(await stateSkincare.getAllSkincare(context, page));
      stateTreatment.getTreatment(context);
      setState(() {});
    });
  }

  _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: spaceHeigt,
              ),
              Text(
                'Pilih Lokasi',
                style: blackHigtTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: spaceHeigt,
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () async {
                  await state.createLocation(
                    context,
                    state.currentLatitude.value,
                    state.currentLongitude.value,
                    state.currentAddress.value,
                  );
                  Get.back();
                },
                leading: CircleAvatar(
                  backgroundColor: greenColor,
                  child: Icon(
                    Icons.my_location_rounded,
                    color: whiteColor,
                  ),
                ),
                title: Text(
                  'Lokasi saat ini',
                  style: blackRegulerTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Obx(
                  () => Text(
                    state.currentAddress.value,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  Get.to(() => MapsWidget());
                },
                leading: CircleAvatar(
                  backgroundColor: greenColor,
                  child: Icon(
                    Icons.location_on_rounded,
                    color: whiteColor,
                  ),
                ),
                title: Text(
                  'Pilih lewat map',
                  style: blackRegulerTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        );
      },
    );
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
                  builder: (context) => SearchSolutionPage(),
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
          Row(
            children: [
              notificasion(context, '1', whiteColor),
              const SizedBox(
                width: 14,
              ),
              TotalKeranjang(iconcolor: whiteColor),
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
          )
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
            height: 10,
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
                          Get.to(() => const DrugSolutionsPage());
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
                          Get.to(() => const SolutionSkincare1Page());
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
                          Get.to(() => const SolutionsTreatment1Page());
                        },
                        child: Image.asset(
                          'assets/images/treatmean.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: InkWell(
                  onTap: () async {
                    state.getCurrentPosition(context);
                    await _showModal(context);
                  },
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
                            state.myCity.value.isNotEmpty
                                ? state.myCity.value
                                : state.currentCity.value,
                            style: blackTextStyle.copyWith(fontWeight: regular),
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
              ),
              if (drugRecipe.isNotEmpty)
                SizedBox(
                  height: 29,
                ),
              if (drugRecipe.isNotEmpty)
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
                      InkWell(
                        onTap: () {
                          Get.to(() => const DrugSolutionsPage());
                        },
                        child: Text(
                          'Lihat Semua',
                          style: grenTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              if (drugRecipe.isNotEmpty)
                SizedBox(
                  height: 16,
                ),
              if (drugRecipe.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 25),
                    child: Row(
                      children: drugRecipe.map((e) {
                        return ProdukObat(
                          productId: e.product!.id!.toInt(),
                          namaBrand: e.product?.name ?? '-',
                          harga:
                              CurrencyFormat.convertToIdr(e.product?.price, 0),
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SolutionSkincare1Page(),
                          ),
                        );
                      },
                      child: Text(
                        'Lihat Semua',
                        style: grenTextStyle.copyWith(fontSize: 12),
                      ),
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
                    children: lookupCategory.map(
                      (item) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => SkincareSearchPage(
                                category: item.value.toString(),
                              ),
                            );
                          },
                          child: CardSkincare(
                            title: item.value.toString(),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Center(
                    child: Wrap(
                      spacing: 23,
                      children: skincare
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Get.to(() => DetailSkinCarePage(
                                      productId: e.id!.toInt(),
                                    ));
                              },
                              child: SkincareWidget(
                                produkId: e.id!.toInt(),
                                namaBrand: e.skincareDetail!.brand.toString(),
                                namaProduk: e.name.toString(),
                                diskonProduk: '20',
                                hargaDiskon:
                                    CurrencyFormat.convertToIdr(e.price, 0),
                                harga: CurrencyFormat.convertToIdr(e.price, 0),
                                urlImg:
                                    '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                rating: '${e.rating} (0k)',
                              ),
                            ),
                          )
                          .toList(),
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
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stateTreatment.treatment.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => PencarianKlinikTraetmentPage(
                                  treatmentType: stateTreatment
                                      .treatment[index].treatmentType,
                                ));
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
