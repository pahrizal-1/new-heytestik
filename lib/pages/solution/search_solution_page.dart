// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/drug_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/widget/drug_widget.dart';
import 'package:heystetik_mobileapps/widget/skincare_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_widget.dart';
import '../../theme/theme.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart'
    as Treat;

class SearchSolutionPage extends StatefulWidget {
  SearchSolutionPage({super.key, t});

  @override
  State<SearchSolutionPage> createState() => _SearchSolutionPageState();
}

class _SearchSolutionPageState extends State<SearchSolutionPage> {
  final DrugController stateDrug = Get.put(DrugController());
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final SkincareController stateSkincare = Get.put(SkincareController());
  TextEditingController searchController = TextEditingController();

  int page = 1;
  String? search;
  Map<String, dynamic> filter = {};
  bool isText = false;
  List<Drug.Data2> drugs = [];
  List<Skincare.Data2> skincare = [];
  List<Treat.Data2> treatment = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: subwhiteColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: TextField(
                    controller: searchController,
                    onChanged: (val) {
                      if (searchController.text.isNotEmpty) {
                        isText = true;
                      } else {
                        isText = false;
                      }
                      setState(() {});
                    },
                    onEditingComplete: () async {
                      search = searchController.text;
                      drugs.clear();
                      skincare.clear();
                      treatment.clear();
                      drugs.addAll(await stateDrug.getDrug(
                        context,
                        page,
                        search: search,
                        filter: filter,
                      ));
                      skincare.addAll(await stateSkincare.getAllSkincare(
                        context,
                        page,
                        search: search,
                        filter: filter,
                      ));
                      treatment.addAll(await stateTreatment.getAllTreatment(
                        context,
                        page,
                        search: search,
                        filter: filter,
                      ));

                      print("A ${drugs.length}");
                      print("B ${skincare.length}");
                      print("C ${treatment.length}");
                      setState(() {});
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 12,
                          color: blackColor,
                        ),
                      ),
                      suffixIcon: isText
                          ? InkWell(
                              onTap: () {
                                searchController.clear();
                                search = null;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  'assets/icons/x-circle-icons.svg',
                                ),
                              ),
                            )
                          : null,
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: (drugs.isEmpty && skincare.isEmpty && treatment.isEmpty)
          ? Center(
              child: Text(
                'Belum ada data',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 20,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (drugs.isNotEmpty)
                      Text(
                        'Obat',
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
                    if (drugs.isNotEmpty)
                      SizedBox(
                        height: 20,
                      ),
                    if (drugs.isNotEmpty)
                      Wrap(
                        runSpacing: 12,
                        spacing: 12,
                        children: drugs.map((drug) {
                          return DrugWidget(
                            drug: drug,
                          );
                        }).toList(),
                      ),
                    if (drugs.isNotEmpty)
                      SizedBox(
                        height: 12,
                      ),
                    if (skincare.isNotEmpty)
                      Text(
                        'Skincare',
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
                    if (skincare.isNotEmpty)
                      SizedBox(
                        height: 20,
                      ),
                    if (skincare.isNotEmpty)
                      Wrap(
                        spacing: 12,
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
                                  namaBrand: e.skincareDetail!.brand.toString(),
                                  namaProduk: e.name.toString(),
                                  diskonProduk: '',
                                  hargaDiskon: '',
                                  harga:
                                      CurrencyFormat.convertToIdr(e.price, 0),
                                  urlImg: e.mediaProducts!.isEmpty
                                      ? ''
                                      : '${Global.FILE}/${e.mediaProducts![0].media!.path}',
                                  rating: '${e.rating} (0k)',
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    if (skincare.isNotEmpty)
                      SizedBox(
                        height: 12,
                      ),
                    if (treatment.isNotEmpty)
                      Text(
                        'Reservasi Treatment',
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
                    if (treatment.isNotEmpty)
                      SizedBox(
                        height: 20,
                      ),
                    if (treatment.isNotEmpty)
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: treatment.map((element) {
                          return ProdukTreatment(
                            treatmentData: element,
                            namaKlinik: element.clinic?.name ?? '-',
                            namaTreatmen: element.name ?? '-',
                            diskonProduk: '0',
                            hargaDiskon: '0',
                            harga: element.price!.toString(),
                            urlImg: element.mediaTreatments!.isEmpty
                                ? ""
                                : "${Global.FILE}/${element.mediaTreatments![0].media!.path!}",
                            rating: '${element.rating} (0k)',
                            km: '${element.distance ?? '0'}',
                            lokasiKlinik: element.clinic?.city?.name ?? '-',
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}
