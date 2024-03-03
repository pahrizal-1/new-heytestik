// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/etalase_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/pages/solution/drug_search_page.dart';
import 'package:heystetik_mobileapps/pages/solution/concern_page.dart';
import 'package:heystetik_mobileapps/widget/cirkel_category.dart';
import 'package:heystetik_mobileapps/widget/drug_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_drug.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';
import '../../controller/customer/solution/drug_controller.dart';
import '../../core/global.dart';
import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';
import '../setings&akun/akun_home_page.dart';

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
  String? concernName = "Semua";

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
                          builder: (context) => DrugSearchPage(
                            searchParam: searchController.text,
                          ),
                        ),
                      );
                    },
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "ProximaNova",
                    ),
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
        controller: scrollController,
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
                          children: etalaseController.filterData
                              .asMap()
                              .entries
                              .map((element) {
                            return InkWell(
                              onTap: () async {
                                if (element.key == 0) {
                                  var res = await Get.to(() => ConcernPage());
                                  filter['concern_ids[]'] = res[0];
                                  concernName = res[1];
                                  page = 1;
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
                                } else {
                                  concernName = element.value.name;
                                  filter['concern_ids[]'] = element.value.id;
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
                                }
                              },
                              child: element.key == 0
                                  ? Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/lainnya.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            'Lihat Semua',
                                            textAlign: TextAlign.center,
                                            style:
                                                blackRegulerTextStyle.copyWith(
                                              fontSize: 12,
                                              color: blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : CirkelCategory(
                                      title: element.value.name ?? '-',
                                      img:
                                          '${Global.FILE}/${element.value.mediaConcern!.media!.path}',
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
                            concernName.toString(),
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
                                      filter.clear();
                                      concernName = "Semua";
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
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                          topEnd: Radius.circular(25),
                                          topStart: Radius.circular(25),
                                        ),
                                      ),
                                      builder: (context) => FilterAllDrug(),
                                    ).then((value) async {
                                      if (value == null) return;

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
              content: drugs.isEmpty
                  ? Center(
                      child: Text(
                        'Belum ada obat',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Center(
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 12,
                        children: drugs.map((drug) {
                          return DrugWidget(
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
