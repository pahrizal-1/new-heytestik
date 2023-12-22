// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_obat_page.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;
import 'package:heystetik_mobileapps/models/customer/concern_model.dart'
    as Concern;

class ConcernObatPage extends StatefulWidget {
  int idConcern;
  ConcernObatPage({required this.idConcern, super.key});

  @override
  State<ConcernObatPage> createState() => _ConcernObatPageState();
}

class _ConcernObatPageState extends State<ConcernObatPage> {
  final TextEditingController searchController = TextEditingController();
  final DrugController state = Get.put(DrugController());
  bool isSelecteTampilan = true;
  final ScrollController scrollController = ScrollController();
  int page = 1;
  List<Drug.Data2> drugs = [];
  String? search;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    filter['concern_ids[]'] = [widget.idConcern];
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      drugs.addAll(await state.getDrug(
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
            drugs.addAll(await state.getDrug(
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
    super.initState();
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
                            page = 1;
                            search = searchController.text;
                            drugs.clear();
                            drugs.addAll(
                              await state.getDrug(
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
                            hintText: "Cari Obat",
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
                                drugs.clear();
                                page = 1;
                                drugs.addAll(
                                  await state.getDrug(
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
                                builder: (context) => FilterEtalase(),
                              ).then((value) async {
                                filter['concern_ids[]'] = value['concern_ids'];
                                drugs.clear();
                                page = 1;
                                drugs.addAll(
                                  await state.getDrug(
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
                                  Text('Etalase Treatment'),
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
            content: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: drugs.isEmpty
                  ? Center(
                      child: Text(
                        'Tidak ada produk obat',
                        style: TextStyle(
                          fontWeight: bold,
                          fontFamily: 'ProximaNova',
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Wrap(
                      children: drugs.map((drug) {
                        return KonsultasiProduk(
                          drug: drug,
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class KonsultasiProduk extends StatelessWidget {
  KonsultasiProduk({
    Key? key,
    required this.drug,
  }) : super(key: key);

  final Drug.Data2 drug;
  DrugController medicineController = Get.put(DrugController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailObatPage(
            drugId: drug.id!,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: borderColor, width: 0.2),
          borderRadius: BorderRadius.circular(7),
        ),
        width: 164,
        height: 315,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: NetworkImage(
                      "${Global.FILE}/${drug.mediaProducts?[0].media?.path}"),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 11, bottom: 11, right: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    drug.name ?? '-',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 13, color: const Color(0xFF323232)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(drug.price, 2),
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    drug.drugDetail?.specificationPackaging ?? '-',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 12, color: const Color(0xFF9B9B9B)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Bisa dibeli apabila telah melakukan konsultasi',
                    style: subGreyTextStyle.copyWith(
                      color: const Color(0XFF9B9B9B),
                      fontSize: 11,
                      fontWeight: medium,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  drug.consultationRecipeDrugs!.isNotEmpty
                      ? Container(
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              medicineController.addDrugToCart(
                                context,
                                drug.id!,
                              );
                              SnackbarWidget.getSuccessSnackbar(
                                context,
                                'Info',
                                'Produk ditambahkan ke keranjang',
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: greenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '+ Keranjang',
                                style: whiteTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          decoration: BoxDecoration(
                              border: Border.all(color: greenColor),
                              borderRadius: BorderRadius.circular(7)),
                          child: Text(
                            'Harus Dengan Resep Dokter',
                            style: grenTextStyle.copyWith(fontSize: 10),
                          ),
                        ),
                ],
              ),
            ),
          ],
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
