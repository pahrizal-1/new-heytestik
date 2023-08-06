// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/location_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/home/notifikasion_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/nearme_page.dart';
import 'package:heystetik_mobileapps/pages/solution/obat_solutions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_treatment_klinik_page.dart';
import 'package:heystetik_mobileapps/pages/solution/top_rating_treatment.dart';
import 'package:heystetik_mobileapps/pages/solution/treatment_search.dart';
import 'package:heystetik_mobileapps/pages/solution/trending_treatment.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/pencarian_search_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import '../../controller/customer/solution/etalase_controller.dart';
import '../../controller/customer/treatment/treatment_controller.dart';
import '../../models/lookup_treatment.dart';
import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';

class SolutionsTreatment1Page extends StatefulWidget {
  const SolutionsTreatment1Page({super.key});

  @override
  State<SolutionsTreatment1Page> createState() => _SolutionsTreatment1PageState();
}

class _SolutionsTreatment1PageState extends State<SolutionsTreatment1Page> {
  final LocationController state = Get.put(LocationController());
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final EtalaseController etalaseController = Get.put(EtalaseController());

  String type = '';
  int rating = 0;
  int page = 1;
  List<Data2> treatments = [];
  String? search;
  int activeIndex = 0;
  final List<String> images = [
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
  ];
  Map<String, dynamic> filter = {};
  final List<String> asset = ['assets/images/Peliing.png', 'assets/images/IPL.png', 'assets/images/Laser.png'];

  @override
  void initState() {
    super.initState();
    etalaseController.getConcern(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.initgetCurrentPosition(context);
      treatments.addAll(await stateTreatment.getAllTreatment(
        context,
        page,
        search: search,
        filter: filter,
      ));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            treatments.addAll(await stateTreatment.getAllTreatment(
              context,
              page,
              search: search,
              filter: filter,
            ));
            setState(() {});
          });
        }
      }
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
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Lokasimu',
                            style: blackTextStyle.copyWith(fontSize: 13, fontWeight: regular),
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
                      Obx(
                        () => Text(
                          state.myAddress.value,
                          style: blackTextStyle.copyWith(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
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
                        builder: (context) => AkunHomePage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/humberger-icons.svg',
                  ),
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
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
                    Container(
                      transform: Matrix4.translationValues(0, -2, 0),
                      constraints: const BoxConstraints(maxWidth: 250),
                      child: TextFormField(
                        controller: searchController,
                        onEditingComplete: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TreatmentSearch(search: searchController.text),
                            ),
                          );
                          // page = 1;
                          // treatments.clear();
                          // search = searchController.text;
                          // treatments.addAll(await stateTreatment.getAllTreatment(context, page, search: search));
                          // setState(() {});
                        },
                        style: const TextStyle(fontSize: 15, fontFamily: "ProximaNova"),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          title: 'Mencari lokasi ...',
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
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
                            decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.circular(24)),
                            child: Center(
                              child: Text(
                                'Bekas Jerawat',
                                style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: 13),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xffcccccc))),
                            child: Center(
                              child: Text(
                                'Jerawat',
                                style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 13),
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
                SizedBox(
                  height: 222,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stateTreatment.treatment.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 222,
                          width: 164,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(asset[index % 3]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              gradient: LinearGradient(
                                colors: [blackColor.withOpacity(0.5), Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 11),
                                child: Text(
                                  stateTreatment.treatment[index].treatmentType,
                                  style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
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
                    onPageChanged: (index, reason) => setState(() => activeIndex = index),
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
                      dotHeight: 6,
                    ),
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NearMePage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/nearme_icons.png'),
                                ),
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Near me',
                            style: blackTextStyle.copyWith(fontSize: 13),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrendingTreatment(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/icons/trending_icons.png',
                                  ),
                                ),
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Trending',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TreatmentKlink(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/icons/klnik_icons.png',
                                  ),
                                ),
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Klinik',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TopRatingTreatment(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/top_rating.png'),
                                ),
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'TOP Rating!',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                StickyHeader(
                  header: Container(
                    color: whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: etalaseController.filterData.map((element) {
                                return CirkelCategory(
                                  title: element.name!,
                                  img: '${Global.FILE}/${element.mediaConcern!.media!.path}',
                                );
                              }).toList(),
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
                          padding: const EdgeInsets.only(left: 25),
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
                              InkWell(
                                onTap: () async {
                                  return showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadiusDirectional.only(
                                        topEnd: Radius.circular(25),
                                        topStart: Radius.circular(25),
                                      ),
                                    ),
                                    builder: (context) => FilterAll(),
                                  ).then((value) async {
                                    if (value['promo'] == true) {
                                      treatments.clear();
                                      page = 1;
                                      setState(() {});
                                    } else {
                                      filter['treatment_type[]'] = value['treatment'];
                                      filter['order_by'] = value['orderBy'];
                                      filter['open_now'] = value['openNow'];
                                      filter['min_price'] = value['minPrice'];
                                      filter['max_price'] = value['maxPrice'];

                                      treatments.clear();
                                      page = 1;
                                      treatments.addAll(
                                        await stateTreatment.getAllTreatment(
                                          context,
                                          page,
                                          search: search,
                                          filter: filter,
                                        ),
                                      );
                                    }
                                    setState(() {});
                                  });
                                },
                                child: Image.asset(
                                  'assets/icons/filters.png',
                                  width: 78,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Wrap(
                          spacing: 15,
                          runSpacing: 12,
                          children: treatments.map((element) {
                            return ProdukTreatment(
                              treatmentData: element,
                              namaKlinik: element.clinic!.name!,
                              namaTreatmen: element.name!,
                              diskonProduk: '0',
                              hargaDiskon: '0',
                              harga: element.price!.toString(),
                              urlImg: "${Global.FILE}/${element.mediaTreatments![0].media!.path!}",
                              rating: '${element.rating} (120k)',
                              km: '${element.distance}',
                              lokasiKlinik: element.clinic!.city!.name!,
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterAll extends StatefulWidget {
  FilterAll({super.key});

  @override
  State<FilterAll> createState() => _FilterAllState();
}

class _FilterAllState extends State<FilterAll> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  List<String> filter = [];
  List<LookupTreatmentModel> treatments = [];
  String orderBy = "";
  bool promo = false;
  bool openNow = false;
  int? minPrice;
  int? maxPrice;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(await stateTreatment.getLookupTreatment(context));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                'Urutkan',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              FilterTap(
                title: 'Rating',
                img: 'assets/icons/stars-icons.png',
                onTap: () {
                  if (orderBy == "RATING") {
                    orderBy = "";
                  } else {
                    orderBy = "RATING";
                  }
                  setState(() {});
                },
                isActive: orderBy == "RATING",
              ),
              FilterTap(
                title: 'Popularitas',
                img: 'assets/icons/popularity.png',
                onTap: () {
                  if (orderBy == "POPULARITY") {
                    orderBy = "";
                  } else {
                    orderBy = "POPULARITY";
                  }
                  setState(() {});
                },
                isActive: orderBy == "POPULARITY",
              ),
              FilterTap(
                title: 'Jarak',
                img: 'assets/icons/mapgrey.png',
                onTap: () {
                  if (orderBy == "DISTANCE") {
                    orderBy = "";
                  } else {
                    orderBy = "DISTANCE";
                  }
                  print(orderBy);
                  setState(() {});
                },
                isActive: orderBy == "DISTANCE",
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Pilihan Klinik',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CardSearch(
                    title: 'Promo',
                    onTap: () {
                      promo = !promo;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CardSearch(
                    title: 'Buka Sekarang',
                    onTap: () {
                      openNow = !openNow;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Pilihan Klinik',
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: minPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: greenColor,
                        hoverColor: greenColor,
                        hintText: 'Min.',
                        hintStyle: TextStyle(color: subgreyColor, fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Text(
                    'hingga',
                    style: subGreyTextStyle,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: maxPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: greenColor,
                        hoverColor: greenColor,
                        hintText: 'Max',
                        hintStyle: TextStyle(
                          color: subgreyColor,
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 29,
              ),
              Text(
                'Treatment',
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              ...treatments.map((treatment) {
                return FilterTapTreatment(
                  title: treatment.name,
                  function: () {
                    filter.add(treatment.name);
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Batal',
                        style: grenTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    minPrice = minPriceController.text == "" ? null : int.parse(minPriceController.text);
                    minPrice = maxPriceController.text == "" ? null : int.parse(maxPriceController.text);

                    Navigator.pop(context, {
                      "treatment": filter,
                      "orderBy": orderBy,
                      "openNow": openNow,
                      "promo": promo,
                      "minPrice": minPrice,
                      "maxPrice": maxPrice,
                    });
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                      color: greenColor,
                      border: Border.all(color: greenColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Simpan',
                        style: whiteTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterTap extends StatefulWidget {
  final String img;
  final String title;
  final Function()? onTap;
  final bool isActive;

  const FilterTap({
    Key? key,
    required this.img,
    required this.title,
    this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  State<FilterTap> createState() => _FilterTapState();
}

class _FilterTapState extends State<FilterTap> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            widget.onTap == null ? () {} : widget.onTap!();
            setState(() {
              isSelected = !widget.isActive;
            });
          },
          child: Row(
            children: [
              Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.img))),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.title,
                style: blackRegulerTextStyle.copyWith(color: blackColor),
              ),
              const Spacer(),
              Icon(
                isSelected ? Icons.radio_button_on : Icons.circle_outlined,
                color: isSelected ? greenColor : blackColor,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: borderColor,
        )
      ],
    );
  }
}

class FilterTapTreatment extends StatefulWidget {
  final String title;
  Function()? function;

  FilterTapTreatment({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);

  @override
  State<FilterTapTreatment> createState() => _FilterTapTreatmentState();
}

class _FilterTapTreatmentState extends State<FilterTapTreatment> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.function == null ? () {} : widget.function!();
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: blackTextStyle.copyWith(color: blackColor, fontSize: 15),
                ),
                const Spacer(),
                Icon(
                  isSelected ? Icons.radio_button_on : Icons.circle_outlined,
                  color: isSelected ? greenColor : blackColor,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: borderColor,
          )
        ],
      ),
    );
  }
}
