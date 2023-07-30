// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/pencarian_search_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../theme/theme.dart';
import '../../widget/card_widget.dart';
import '../../widget/filter_tap_widget.dart';
import '../../widget/produk_height_widget.dart';
import 'view_detail_skincare_page.dart';

class CategorySkinCare extends StatefulWidget {
  String category;
  CategorySkinCare({required this.category, super.key});

  @override
  State<CategorySkinCare> createState() => _CategorySkinCareState();
}

class _CategorySkinCareState extends State<CategorySkinCare> {
  final SkincareController state = Get.put(SkincareController());
  bool isSelecteTampilan = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getSkincareByCategory(context, widget.category);
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
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PencarianPageWidget(),
                    ),
                  );
                },
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
                        Text(
                          'Cari Skincare',
                          style: blackRegulerTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          StickyHeader(
              header: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 9),
                color: whiteColor,
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
                              onTap: () {
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
                                  builder: (context) => Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 25,
                                            top: 36,
                                            bottom: 40),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Filter',
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 31,
                                            ),
                                            Text(
                                              'Pilihan Klinik',
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                CardSearch(
                                                  title: 'Promo',
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CardSearch(
                                                  title: 'Buka Sekarang',
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 28,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      fillColor: greenColor,
                                                      hoverColor: greenColor,
                                                      hintText: 'Min.',
                                                      hintStyle: TextStyle(
                                                          color: subgreyColor,
                                                          fontSize: 12),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color:
                                                                    greenColor,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              12),
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
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      fillColor: greenColor,
                                                      hoverColor: greenColor,
                                                      hintText: 'Max',
                                                      hintStyle: TextStyle(
                                                          color: subgreyColor,
                                                          fontSize: 12),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color:
                                                                    greenColor,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              12),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 29,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: 165,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  greenColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                      height: 50,
                                                      child: Center(
                                                        child: Text(
                                                          'Batal',
                                                          style: grenTextStyle
                                                              .copyWith(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      bold),
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
                                                    onTap: () {},
                                                    child: Container(
                                                      width: 165,
                                                      decoration: BoxDecoration(
                                                          color: greenColor,
                                                          border: Border.all(
                                                              color:
                                                                  greenColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                      height: 50,
                                                      child: Center(
                                                        child: Text(
                                                          'Simpan',
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      bold),
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
                                    ],
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/icons/filters.png',
                                width: 78,
                              ),
                            ),
                            InkWell(
                              onTap: () {
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
                                  builder: (context) => Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 25,
                                            top: 36,
                                            bottom: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/danger-icons.png',
                                                    width: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 22,
                                                ),
                                                Text(
                                                  'Filter',
                                                  style: blackHigtTextStyle
                                                      .copyWith(fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 31,
                                            ),
                                            const FilterTapTreatment(
                                              title: 'Rating Tertinggi',
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            const FilterTapTreatment(
                                              title: 'Ulasan Terbanyaki',
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            const FilterTapTreatment(
                                              title: 'Treatment Terlaris',
                                            ),
                                            const SizedBox(
                                              height: 29,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 9),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 6, bottom: 6),
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(color: borderColor),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Urutkan'),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         const EtalaseTreatMentPage(),
                                //   ),
                                // );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 9),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 6, bottom: 6),
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(color: borderColor),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Retalase Treatment'),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
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
                        Obx(
                          () => Text(
                            '${state.filterData.length} Produk',
                            style: greyTextStyle.copyWith(fontSize: 15),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSelecteTampilan = !isSelecteTampilan;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Tampilan',
                                style: subTitleTextStyle.copyWith(
                                    color: const Color(0xff6B6B6B)),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              isSelecteTampilan
                                  ? SvgPicture.asset(
                                      'assets/icons/tampilan1.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/tampillan2.svg')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 19),
                    child: Obx(
                      () => LoadingWidget(
                        isLoading: state.isLoadingSkincare.value,
                        child: state.filterData.isEmpty
                            ? Center(
                                child: Text(
                                  'Belum ada data',
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
                                children: state.filterData
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {
                                          Get.to(DetailSkinCarePage(
                                            id: e.id!.toInt(),
                                            productId: e
                                                .mediaProducts![0].productId!
                                                .toInt(),
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
                                          kota: 'Amerika Serikat',
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                      ),
                    ),
                  )
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
