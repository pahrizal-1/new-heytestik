import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_klinik_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_klinik_widget.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../models/clinic.dart';
import '../../widget/filter_all_widgets.dart';
import '../../widget/treatment_widgets.dart';

class TreatmentKlink extends StatefulWidget {
  const TreatmentKlink({super.key});

  @override
  State<TreatmentKlink> createState() => _TreatmentKlinkState();
}

class _TreatmentKlinkState extends State<TreatmentKlink> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  int page = 1;
  String? search;
  List<ClinicDataModel> clinics = [];
  bool isSelecteSearch = true;
  bool isSelecteTampilan = true;
  bool promo = false;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      clinics.addAll(await stateTreatment.getClinic(context, page,
          search: search, filter: filter));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            clinics.addAll(await stateTreatment.getClinic(context, page,
                search: search, filter: filter));
            setState(() {});
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                      'Klinik',
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
                                left: 10,
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
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "ProximaNova",
                                ),
                                onEditingComplete: () async {
                                  page = 1;
                                  search = searchController.text;
                                  clinics.clear();
                                  clinics.addAll(await stateTreatment.getClinic(
                                      context, page,
                                      search: search));
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintText: "Cari Klinik",
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
                  ],
                ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            //Refactor
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
                                clinics.clear();
                                page = 1;
                                setState(() {});
                              } else {
                                filter['treatment_type[]'] = value['treatment'];
                                filter['order_by'] = value['orderBy'];
                                filter['open_now'] = value['openNow'];
                                filter['min_price'] = value['minPrice'];
                                filter['max_price'] = value['maxPrice'];

                                clinics.clear();
                                page = 1;
                                clinics.addAll(
                                  await stateTreatment.getClinic(
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
                          ).then((value) async {
                            page = 1;
                            filter['treatment_type[]'] = value;
                            clinics.clear();
                            clinics.addAll(await stateTreatment.getClinic(
                                context, page,
                                search: search, filter: filter));
                            setState(() {});
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 9),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 6,
                            bottom: 6,
                          ),
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
                            clinics.clear();
                            clinics.addAll(await stateTreatment.getClinic(
                                context, page,
                                search: search, filter: filter));
                            setState(() {});
                          } else {
                            filter['rating[]'] = '4';
                            filter['rating[]'] = '5';
                            clinics.clear();
                            clinics.addAll(await stateTreatment.getClinic(
                                context, page,
                                search: search, filter: filter));
                            setState(() {});
                          }
                        },
                      ),
                      FiklterTreatment(
                        title: 'Buka Sekarang',
                        onTap: () async {
                          if (filter.containsKey("open_now")) {
                            filter['open_now'] = false;
                            clinics.clear();
                            clinics.addAll(await stateTreatment.getClinic(
                                context, page,
                                search: search, filter: filter));
                            setState(() {});
                          } else {
                            filter['open_now'] = true;
                            clinics.clear();
                            clinics.addAll(await stateTreatment.getClinic(
                                context, page,
                                search: search, filter: filter));
                            setState(() {});
                          }
                        },
                      ),
                      FiklterTreatment(
                        title: 'Promo',
                        onTap: () async {
                          if (promo) {
                            promo = false;
                            clinics.clear();
                            clinics.addAll(await stateTreatment.getClinic(
                                context, page,
                                search: search, filter: filter));
                            setState(() {});
                          } else {
                            promo = true;
                            clinics.clear();
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
      body: ListView.builder(
        itemCount: clinics.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => DetailKlinikPage(
                    clinicId: clinics[index].id,
                  ));
            },
            child: CardKlinik(
              namaKlink: '${clinics[index].name}, ${clinics[index].city}',
              rating: '${clinics[index].rating} (0k)',
              km: clinics[index].distance,
              urlImg: "${Global.FILE}/${clinics[index].logo}",
              price: clinics[index].price,
              // buttonTitle: 'Lihat semua cabang klinik',
            ),
          );
        },
      ),
    );
  }
}
