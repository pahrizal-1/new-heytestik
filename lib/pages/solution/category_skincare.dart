// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/widget/filter_concern.dart';
import 'package:heystetik_mobileapps/widget/filter_skincare.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import '../../theme/theme.dart';
import '../../widget/skincare_widget.dart';
import 'view_detail_skincare_page.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/search1.png',
                        width: 10,
                        color: blackColor,
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -2, 0),
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: TextFormField(
                          controller: searchController,
                          onEditingComplete: () async {
                            page = 1;
                            search = searchController.text;
                            skincare.clear();
                            skincare.addAll(
                              await state.getAllSkincare(
                                context,
                                page,
                                search: search,
                                filter: filter,
                              ),
                            );
                            setState(() {});
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
                            if (filter.isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  filter.clear();
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
                                  builder: (context) => FilterAllSkincare(),
                                ).then((value) async {
                                  if (value == null) return;

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
                                    Text('Etalase Skincare'),
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
                        Text(
                          '${skincare.length} Produk',
                          style: greyTextStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 19),
                    child: skincare.isEmpty
                        ? Center(
                            child: Text(
                              'Belum ada skincare',
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 20,
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
