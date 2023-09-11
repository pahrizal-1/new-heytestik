import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';
import 'package:heystetik_mobileapps/widget/tampilan_right_widget.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../widget/filter_all_widgets.dart';
import '../../widget/produk_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';

import '../../widget/treatment_widgets.dart';

class NearMePage extends StatefulWidget {
  const NearMePage({super.key});

  @override
  State<NearMePage> createState() => _NearMePageState();
}

class _NearMePageState extends State<NearMePage> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  int page = 1;
  String? search;
  List<Data2> treatments = [];
  bool isSelecteSearch = true;
  bool isSelecteTampilan = true;
  bool isSelecteColor = true;
  Map<String, dynamic> filter = {};
  bool promo = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(
          await stateTreatment.getNearTreatment(context, page, search: search));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            treatments.addAll(await stateTreatment
                .getNearTreatment(context, page, search: search));
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
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: isSelecteSearch
              ? Row(
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
                    Text(
                      'Near Me',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelecteSearch = !isSelecteSearch;
                        });
                      },
                      child: Image.asset(
                        'assets/icons/search1.png',
                        width: 18,
                        color: blackColor,
                      ),
                    )
                  ],
                )
              : Row(
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
                      width: 7,
                    ),
                    Expanded(
                        child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffF1F1F1),
                        border: Border.all(
                          color: fromCssColor("#CCCCCC"),
                        ),
                        borderRadius: BorderRadius.circular(7),
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
                                  search = searchController.text;
                                  treatments.clear();
                                  treatments.addAll(await stateTreatment
                                      .getNearTreatment(context, page,
                                          search: search));
                                  setState(() {});
                                },
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: "ProximaNova"),
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
                          ]),
                    )),
                  ],
                ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: SizedBox(
            height: 60.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 9),
                      padding: const EdgeInsets.only(left: 9, right: 9),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: borderColor),
                      ),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(25),
                                topStart: Radius.circular(25),
                              ),
                            ),
                            builder: (context) => FilterAllWidget(),
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
                                await stateTreatment.getNearTreatment(
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
                          'assets/icons/filter-icon.png',
                          width: 13,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(25),
                              topStart: Radius.circular(25),
                            ),
                          ),
                          builder: (context) => TreatmentFilter(),
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
                            Text(
                              'Treatment',
                              style: blackTextStyle.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    FiklterTreatment(
                      title: 'Bintang 4.5+',
                      onTap: () async {
                        if (filter.containsKey("rating[]")) {
                          filter.remove('rating[]');
                          treatments.clear();
                          treatments
                              .addAll(await stateTreatment.getNearTreatment(
                            context,
                            page,
                            search: search,
                            filter: filter,
                          ));
                          setState(() {});
                        } else {
                          filter['rating[]'] = '4';
                          filter['rating[]'] = '5';
                          treatments.clear();
                          treatments
                              .addAll(await stateTreatment.getNearTreatment(
                            context,
                            page,
                            search: search,
                            filter: filter,
                          ));
                          setState(() {});
                        }
                      },
                    ),
                    FiklterTreatment(
                      title: 'Buka Sekarang',
                      onTap: () async {
                        if (filter.containsKey("open_now")) {
                          filter['open_now'] = false;
                          treatments.clear();
                          treatments
                              .addAll(await stateTreatment.getNearTreatment(
                            context,
                            page,
                            search: search,
                            filter: filter,
                          ));
                          setState(() {});
                        } else {
                          filter['open_now'] = true;
                          treatments.clear();
                          treatments
                              .addAll(await stateTreatment.getNearTreatment(
                            context,
                            page,
                            search: search,
                            filter: filter,
                          ));
                          setState(() {});
                        }
                      },
                    ),
                    FiklterTreatment(
                      title: 'Promo',
                      onTap: () async {
                        if (promo) {
                          promo = false;
                          treatments.clear();
                          treatments
                              .addAll(await stateTreatment.getNearTreatment(
                            context,
                            page,
                            search: search,
                            filter: filter,
                          ));
                          setState(() {});
                        } else {
                          promo = true;
                          treatments.clear();
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 25, right: 25),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelecteTampilan = !isSelecteTampilan;
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
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
                            ? SvgPicture.asset('assets/icons/tampilan1.svg')
                            : SvgPicture.asset('assets/icons/tampillan2.svg')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
            ),
            isSelecteTampilan
                ? Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      runSpacing: 12,
                      spacing: 12,
                      children: treatments.map((element) {
                        return ProdukTreatment(
                          namaKlinik: element.clinic?.name ?? '-',
                          namaTreatmen: element.name!,
                          diskonProduk: '0',
                          hargaDiskon: '',
                          harga: element.price.toString(),
                          urlImg:
                              "${Global.FILE}/${element.mediaTreatments![0].media!.path!}",
                          rating: '${element.rating} (120k)',
                          km: element.distance ?? '-',
                          lokasiKlinik: element.clinic?.city?.name ?? '-',
                          treatmentData: element,
                        );
                      }).toList(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 19),
                    child: Column(
                      children: treatments
                          .map(
                            (e) => TampilanRight(
                              treatment: e,
                              urlImg:
                                  "${Global.FILE}/${e.mediaTreatments![0].media!.path!}",
                            ),
                          )
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
