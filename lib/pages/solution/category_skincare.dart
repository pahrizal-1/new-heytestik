// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/skincare_search.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import '../../theme/theme.dart';
import '../../widget/produk_height_widget.dart';
import 'view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;

class CategorySkinCare extends StatefulWidget {
  String category;
  CategorySkinCare({required this.category, super.key});

  @override
  State<CategorySkinCare> createState() => _CategorySkinCareState();
}

class _CategorySkinCareState extends State<CategorySkinCare> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final SkincareController state = Get.put(SkincareController());
  bool isSelecteTampilan = true;

  int page = 1;
  List<Skincare.Data2> skincare = [];
  String? search;
  Map<String, dynamic> filter = {};
  @override
  void initState() {
    super.initState();
    filter['category[]'] = [widget.category];
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
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
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: blackColor,
              ),
            ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 13, right: 14),
                height: 35,
                decoration: BoxDecoration(
                  color: subwhiteColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/search1.png',
                        width: 10,
                        color: blackColor,
                      ),
                      const SizedBox(
                        width: 10,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        controller: scrollController,
        children: [
          StickyHeader(
              header: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 9),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: lsymetric,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            // InkWell(
                            //   onTap: () {
                            //     showModalBottomSheet(
                            //       isDismissible: false,
                            //       context: context,
                            //       backgroundColor: Colors.white,
                            //       shape: const RoundedRectangleBorder(
                            //         borderRadius: BorderRadiusDirectional.only(
                            //           topEnd: Radius.circular(25),
                            //           topStart: Radius.circular(25),
                            //         ),
                            //       ),
                            //       builder: (context) => Wrap(
                            //         children: [
                            //           Padding(
                            //             padding: const EdgeInsets.only(
                            //                 left: 25,
                            //                 right: 25,
                            //                 top: 36,
                            //                 bottom: 20),
                            //             child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.start,
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     InkWell(
                            //                       onTap: () {
                            //                         Navigator.pop(context);
                            //                       },
                            //                       child: Image.asset(
                            //                         'assets/icons/danger-icons.png',
                            //                         width: 14,
                            //                       ),
                            //                     ),
                            //                     const SizedBox(
                            //                       width: 22,
                            //                     ),
                            //                     Text(
                            //                       'Filter',
                            //                       style: blackHigtTextStyle
                            //                           .copyWith(fontSize: 20),
                            //                     ),
                            //                   ],
                            //                 ),
                            //                 const SizedBox(
                            //                   height: 31,
                            //                 ),
                            //                 const FilterTapTreatment(
                            //                   title: 'Rating Tertinggi',
                            //                 ),
                            //                 const SizedBox(
                            //                   height: 18,
                            //                 ),
                            //                 const FilterTapTreatment(
                            //                   title: 'Ulasan Terbanyaki',
                            //                 ),
                            //                 const SizedBox(
                            //                   height: 18,
                            //                 ),
                            //                 const FilterTapTreatment(
                            //                   title: 'Treatment Terlaris',
                            //                 ),
                            //                 const SizedBox(
                            //                   height: 29,
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     );
                            //   },
                            //   child: Container(
                            //     margin: const EdgeInsets.only(left: 9),
                            //     padding: const EdgeInsets.only(
                            //         left: 10, right: 10, top: 6, bottom: 6),
                            //     height: 30,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(7),
                            //       border: Border.all(color: borderColor),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text('Urutkan'),
                            //         SizedBox(
                            //           width: 9,
                            //         ),
                            //         Icon(
                            //           Icons.keyboard_arrow_down,
                            //           size: 15,
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.push(
                            //     //   context,
                            //     //   MaterialPageRoute(
                            //     //     builder: (context) =>
                            //     //         const EtalaseTreatMentPage(),
                            //     //   ),
                            //     // );
                            //   },
                            //   child: Container(
                            //     margin: const EdgeInsets.only(left: 9),
                            //     padding: const EdgeInsets.only(
                            //         left: 10, right: 10, top: 6, bottom: 6),
                            //     height: 30,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(7),
                            //       border: Border.all(color: borderColor),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text('Retalase Treatment'),
                            //         SizedBox(
                            //           width: 9,
                            //         ),
                            //         Icon(
                            //           Icons.keyboard_arrow_down,
                            //           size: 15,
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: lsymetric.copyWith(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${skincare.length} Produk',
                          style: greyTextStyle.copyWith(fontSize: 15),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       isSelecteTampilan = !isSelecteTampilan;
                        //     });
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         'Tampilan',
                        //         style: subTitleTextStyle.copyWith(
                        //             color: const Color(0xff6B6B6B)),
                        //       ),
                        //       const SizedBox(
                        //         width: 4,
                        //       ),
                        //       isSelecteTampilan
                        //           ? SvgPicture.asset(
                        //               'assets/icons/tampilan1.svg')
                        //           : SvgPicture.asset(
                        //               'assets/icons/tampillan2.svg')
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 19),
                    child: skincare.isEmpty
                        ? Center(
                            child: Text(
                              'Tidak ada produk',
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 15,
                              ),
                            ),
                          )
                        : Wrap(
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
                                      hargaDiskon: CurrencyFormat.convertToIdr(
                                          e.price, 0),
                                      harga: CurrencyFormat.convertToIdr(
                                          e.price, 0),
                                      urlImg:
                                          '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                      rating: e.rating.toString(),
                                      kota: 'Amerika Serikat',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                ],
              )),
          const SizedBox(
            height: 14,
          ),
        ],
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
                    Navigator.pop(context);
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
