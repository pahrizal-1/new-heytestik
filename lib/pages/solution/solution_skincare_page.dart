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
import 'package:heystetik_mobileapps/pages/solution/skincare_search.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/produk_height_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'category_skincare.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;
import 'package:heystetik_mobileapps/models/customer/concern_model.dart'
    as Concern;

class SolutionSkincare1Page extends StatefulWidget {
  const SolutionSkincare1Page({super.key});

  @override
  State<SolutionSkincare1Page> createState() => _SolutionSkincare1PageState();
}

class _SolutionSkincare1PageState extends State<SolutionSkincare1Page> {
  final TextEditingController searchController = TextEditingController();
  final SkincareController state = Get.put(SkincareController());
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
  String? search;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      lookupCategory
          .addAll(await state.getLookup(context, 'SKINCARE_CATEGORY'));
      skincare.addAll(await state.getAllSkincare(
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
            skincare.addAll(await state.getAllSkincare(
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
              keranjang(context, '2', blackColor),
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
                      if (searchController.text.isEmpty) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SkincareSearch(
                            search: searchController.text,
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
                          children: skincare
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
                                        CurrencyFormat.convertToIdr(e.price, 0),
                                    harga:
                                        CurrencyFormat.convertToIdr(e.price, 0),
                                    urlImg: e.mediaProducts!.isEmpty
                                        ? ''
                                        : '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                    rating: e.rating.toString(),
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
                                    CategorySkinCare(
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
                                  builder: (context) => FilterAll(),
                                ).then((value) async {
                                  filter['display[]'] = value['display'];
                                  filter['category[]'] = value['category'];
                                  skincare.clear();
                                  page = 1;
                                  skincare.addAll(
                                    await state.getAllSkincare(
                                      context,
                                      page,
                                      search: search,
                                      filter: filter,
                                    ),
                                  );
                                  setState(() {});
                                });
                              },
                              child: Image.asset(
                                'assets/icons/filters.png',
                                width: 78,
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
                                  builder: (context) => FilterEtalase(),
                                ).then((value) async {
                                  filter['concern_ids[]'] =
                                      value['concern_ids'];
                                  skincare.clear();
                                  page = 1;
                                  skincare.addAll(
                                    await state.getAllSkincare(
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
                content: Column(
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
                                  Get.to(DetailSkinCarePage(
                                    productId: e.id!.toInt(),
                                  ));
                                },
                                child: Produkheight(
                                  produkId: e.id!.toInt(),
                                  namaBrand: e.skincareDetail!.brand.toString(),
                                  namaProduk: e.name.toString(),
                                  diskonProduk: '20',
                                  hargaDiskon:
                                      CurrencyFormat.convertToIdr(e.price, 0),
                                  harga:
                                      CurrencyFormat.convertToIdr(e.price, 0),
                                  urlImg: e.mediaProducts!.isEmpty
                                      ? ''
                                      : '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                  rating: e.rating.toString(),
                                  kota: 'Amerika Serikat',
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

class FilterAll extends StatefulWidget {
  const FilterAll({super.key});

  @override
  State<FilterAll> createState() => _FilterAllState();
}

class _FilterAllState extends State<FilterAll> {
  final SkincareController state = Get.put(SkincareController());
  List<Lookup.Data2> lookupDisplay = [];
  List<Lookup.Data2> lookupCategory = [];
  List display = [];
  List category = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      lookupDisplay.addAll(await state.getLookup(context, 'SKINCARE_DISPLAY'));
      lookupCategory
          .addAll(await state.getLookup(context, 'SKINCARE_CATEGORY'));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
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
              'Pilih Display',
              style: blackRegulerTextStyle.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            ...lookupDisplay.map((e) {
              return FilterTapProduct(
                title: e.value.toString(),
                function: () {
                  display.add(e.value.toString());
                },
              );
            }),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Pilih Category',
              style: blackRegulerTextStyle.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            ...lookupCategory.map((e) {
              return FilterTapProduct(
                title: e.value.toString(),
                function: () {
                  category.add(e.value.toString());
                },
              );
            }),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, {
                      "display": [],
                      "category": [],
                    });
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Batal',
                        style: grenTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context, {
                        "display": display,
                        "category": category,
                      });
                    },
                    child: Container(
                      width: 165,
                      decoration: BoxDecoration(
                          color: greenColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterEtalase extends StatefulWidget {
  const FilterEtalase({super.key});

  @override
  State<FilterEtalase> createState() => _FilterEtalaseState();
}

class _FilterEtalaseState extends State<FilterEtalase> {
  final EtalaseController state = Get.put(EtalaseController());
  List<Concern.Data2> concern = [];
  List concernIds = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      concern.addAll(await state.getConcern(context));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
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
              'Pilih Concern',
              style: blackRegulerTextStyle.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            ...concern.map((e) {
              return FilterTapProduct(
                title: e.name.toString(),
                function: () {
                  concernIds.add(e.id.toString());
                },
              );
            }),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, {
                      "concern_ids": [],
                    });
                  },
                  child: Container(
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Batal',
                        style: grenTextStyle.copyWith(
                            fontSize: 15, fontWeight: bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context, {
                        "concern_ids": concernIds,
                      });
                    },
                    child: Container(
                      width: 165,
                      decoration: BoxDecoration(
                          color: greenColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterTapProduct extends StatefulWidget {
  final String title;
  Function()? function;

  FilterTapProduct({
    Key? key,
    required this.title,
    this.function,
  }) : super(key: key);

  @override
  State<FilterTapProduct> createState() => _FilterTapProductState();
}

class _FilterTapProductState extends State<FilterTapProduct> {
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
                  style:
                      blackTextStyle.copyWith(color: blackColor, fontSize: 15),
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
