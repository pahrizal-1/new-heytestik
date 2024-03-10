// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/filter_concern.dart';
import 'package:heystetik_mobileapps/widget/filter_skincare.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/skincare_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'skincare_search_page.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;

class SolutionSkincare1Page extends StatefulWidget {
  const SolutionSkincare1Page({super.key});

  @override
  State<SolutionSkincare1Page> createState() => _SolutionSkincare1PageState();
}

class _SolutionSkincare1PageState extends State<SolutionSkincare1Page> {
  final TextEditingController searchController = TextEditingController();
  final SkincareController stateSkincare = Get.put(SkincareController());
  final EtalaseController stateEtalase = Get.put(EtalaseController());
  final ScrollController scrollController = ScrollController();
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
  List<Lookup.Data2> lookupCategory = [];

  int page = 1;
  List<Skincare.Data2> skincare = [];
  List<Skincare.Data2> skincareDermatologists = [];
  String? search;
  Map<String, dynamic> filter = {};
  Map? concern;
  String? display;
  String? category;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      lookupCategory
          .addAll(await stateEtalase.getLookup(context, 'SKINCARE_CATEGORY'));
      skincareDermatologists.addAll(await stateSkincare.skincareDermatologists(
        context,
      ));
      skincare.addAll(await stateSkincare.getAllSkincare(
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
            skincare.addAll(await stateSkincare.getAllSkincare(
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
              Text(
                'Skincare',
                style: blackTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              notificasion(context, '1', blackColor),
              const SizedBox(
                width: 14,
              ),
              TotalKeranjang(iconcolor: blackColor),
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
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
            height: 56.0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: fromCssColor('#CCCCCC'),
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
                          builder: (context) => SkincareSearchPage(
                            searchParam: searchController.text,
                          ),
                        ),
                      );
                    },
                    style: const TextStyle(
                        fontSize: 15, fontFamily: "ProximaNova"),
                    decoration: InputDecoration(
                      hintText: "Cari Skincare",
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
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (skincareDermatologists.isNotEmpty)
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
                        child: Center(
                          child: Wrap(
                            spacing: 23,
                            runSpacing: 12,
                            children: skincareDermatologists
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      Get.to(() => DetailSkinCarePage(
                                            productId: e.id!.toInt(),
                                          ));
                                    },
                                    child: SkincareWidget(
                                      produkId: e.id!.toInt(),
                                      namaBrand:
                                          e.skincareDetail!.brand.toString(),
                                      namaProduk: e.name.toString(),
                                      diskonProduk: '20',
                                      hargaDiskon: CurrencyFormat.convertToIdr(
                                          e.price, 0),
                                      harga: CurrencyFormat.convertToIdr(
                                          e.price, 0),
                                      urlImg: e.mediaProducts!.isEmpty
                                          ? ''
                                          : '${Global.FILE}/${e.mediaProducts![0].media!.path}',
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
                    SingleChildScrollView(
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
                          itemCount: lookupCategory.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: borderColor)),
                              child: InkWell(
                                onTap: () {
                                  Get.to(
                                    () => SkincareSearchPage(
                                      category: lookupCategory[index]
                                          .value
                                          .toString(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    lookupCategory[index].value.toString(),
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
                            if (filter.isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  display = null;
                                  category = null;
                                  concern = null;
                                  filter.clear();
                                  skincare.clear();
                                  page = 1;
                                  setState(() {});
                                  skincare.addAll(
                                    await stateSkincare.getAllSkincare(
                                      context,
                                      page,
                                      search: search,
                                      filter: filter,
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: greenColor,
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: greenColor,
                                  ),
                                ),
                              ),
                            InkWell(
                              onTap: () async {
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
                                  builder: (context) => FilterAllSkincare(
                                      display: display, category: category),
                                ).then((value) async {
                                  if (value == null) return;

                                  if (value['display'] != null) {
                                    filter['display[]'] = value['display'];
                                    display = value['display'];
                                  }
                                  if (value['category'] != null) {
                                    filter['category[]'] = value['category'];
                                    category = value['category'];
                                  }
                                  skincare.clear();
                                  page = 1;
                                  setState(() {});
                                  skincare.addAll(
                                    await stateSkincare.getAllSkincare(
                                      context,
                                      page,
                                      search: search,
                                      filter: filter,
                                    ),
                                  );
                                  setState(() {});
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 6, bottom: 6),
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: (filter.containsKey('display[]') ||
                                            filter.containsKey('category[]'))
                                        ? greenColor
                                        : borderColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/filter-icon.png',
                                      color: (filter.containsKey('display[]') ||
                                              filter.containsKey('category[]'))
                                          ? greenColor
                                          : null,
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text(
                                      (filter.containsKey('display[]') ||
                                              filter.containsKey('category[]'))
                                          ? "${filter.containsKey('concern_ids[]') ? (filter.length - 1) : filter.length} Filter"
                                          : 'Filter',
                                      style: TextStyle(
                                        color: (filter
                                                    .containsKey('display[]') ||
                                                filter
                                                    .containsKey('category[]'))
                                            ? greenColor
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () async {
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
                                  builder: (context) => FilterConcern(),
                                ).then((value) async {
                                  if (value == null) return;

                                  concern = value;
                                  filter['concern_ids[]'] = value['id'];
                                  skincare.clear();
                                  page = 1;
                                  setState(() {});
                                  skincare.addAll(
                                    await stateSkincare.getAllSkincare(
                                      context,
                                      page,
                                      search: search,
                                      filter: filter,
                                    ),
                                  );
                                  setState(() {});
                                });
                              },
                              child: Container(
                                height: 30,
                                margin: const EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.only(left: 11.5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: (concern is Map)
                                        ? greenColor
                                        : borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      (concern is Map)
                                          ? (concern?['text'])
                                          : 'Etalase Skincare',
                                      style: TextStyle(
                                        color: (concern is Map)
                                            ? greenColor
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 15,
                                      color:
                                          (concern is Map) ? greenColor : null,
                                    )
                                  ],
                                ),
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
                content: skincare.isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada skincare',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 20,
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Wrap(
                              spacing: 23,
                              runSpacing: 12,
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
                                        namaBrand:
                                            e.skincareDetail!.brand.toString(),
                                        namaProduk: e.name.toString(),
                                        diskonProduk: '20',
                                        hargaDiskon:
                                            CurrencyFormat.convertToIdr(
                                                e.price, 0),
                                        harga: CurrencyFormat.convertToIdr(
                                            e.price, 0),
                                        urlImg: e.mediaProducts!.isEmpty
                                            ? ''
                                            : '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                        rating: '${e.rating} (0k)',
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
