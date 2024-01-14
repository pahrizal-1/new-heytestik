// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/pages/solution/concern_obat.dart';
import 'package:heystetik_mobileapps/pages/solution/drug_search.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_drug_page.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';
import '../../controller/customer/solution/drug_controller.dart';
import '../../core/global.dart';
import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';
import '../setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;
import 'package:heystetik_mobileapps/models/customer/concern_model.dart'
    as Concern;

class DrugSolutionsPage extends StatefulWidget {
  const DrugSolutionsPage({super.key});

  @override
  State<DrugSolutionsPage> createState() => _DrugSolutionsPageState();
}

class _DrugSolutionsPageState extends State<DrugSolutionsPage> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final DrugController state = Get.put(DrugController());
  final EtalaseController etalaseController = Get.put(EtalaseController());
  int page = 1;
  List<Drug.Data2> drugs = [];
  List<Data2> drugRecipe = [];
  List<Concern.Data2> concern = [];
  String? search;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      concern.addAll(await etalaseController.getConcern(context));
      drugRecipe.addAll(await state.getDrugRecipe(context, page));
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
                'Obat Resep',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
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
                          builder: (context) => DrugSearch(
                            search: searchController.text,
                          ),
                        ),
                      );
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
              ]),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (drugRecipe.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      'Obat Resep buat kamu 💊',
                      style: blackHigtTextStyle.copyWith(fontSize: 18),
                    ),
                    Text(
                      'Obat yang sudah diresepkan oleh Dokter',
                      style: subGreyTextStyle.copyWith(
                        fontSize: 14,
                        color: const Color(0xFF9B9B9B),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
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
                        harga: CurrencyFormat.convertToIdr(e.product?.price, 0),
                        urlImg:
                            '${Global.FILE}/${e.product!.mediaProducts?[0].media?.path}',
                        duedate: ConvertDate.defaultDate(e.dueDate.toString()),
                      );
                    }).toList(),
                  ),
                ),
              ),
            if (drugRecipe.isNotEmpty)
              const SizedBox(
                height: 25,
              ),
            StickyHeader(
              header: Container(
                color: const Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 34,
                      width: 258,
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 25,
                        bottom: 7,
                      ),
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Obat berdasarkan Concern',
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: etalaseController.filterData.map((element) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => ConcernObatPage(
                                      idConcern: element.id!.toInt(),
                                    ));
                              },
                              child: CirkelCategory(
                                title: element.name ?? "-",
                                img:
                                    "${Global.FILE}/${element.mediaConcern!.media!.path!}",
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semua',
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
                                        borderRadius:
                                            BorderRadiusDirectional.only(
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
                                        'Etalase Obat',
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
                  ],
                ),
              ),
              content: Center(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 12,
                  children: drugs.map((drug) {
                    return KonsultasiProduk(
                      drug: drug,
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
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
  DrugController state = Get.put(DrugController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailDrugPage(
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
                    CurrencyFormat.convertToIdr(drug.price ?? 0, 2),
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
                  if (drug.consultationRecipeDrugs?.isNotEmpty ??
                      drug.consultationRecipeDrugs != null)
                    Container(
                      height: 30,
                      child: TextButton(
                        onPressed: () {
                          state.addDrugToCart(
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
                  else
                    Container(
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

class CirkelCategory extends StatelessWidget {
  final String img;
  final String title;
  const CirkelCategory({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 0.2),
              borderRadius: BorderRadius.circular(30),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70,
            child: Text(title,
                textAlign: TextAlign.center,
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 12, color: blackColor)),
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
