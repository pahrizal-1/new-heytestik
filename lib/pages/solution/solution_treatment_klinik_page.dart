import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/card_klinik_widget.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../models/clinic.dart';

class TreatmentKlink extends StatefulWidget {
  const TreatmentKlink({super.key});

  @override
  State<TreatmentKlink> createState() => _TreatmentKlinkState();
}

class _TreatmentKlinkState extends State<TreatmentKlink> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  int page = 1;
  List<ClinicDataModel> clinics = [];
  bool isSelecteSearch = true;
  bool isSelecteTampilan = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      clinics.addAll(await stateTreatment.getClinic(context, page));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            clinics.addAll(await stateTreatment.getClinic(context, page));
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
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: "ProximaNova"),
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
                          ]),
                    )),
                  ],
                ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: FilterTreatment(),
        ),
      ),
      body: ListView.builder(
        itemCount: stateTreatment.dataClinic.length,
        itemBuilder: (context, index) {
          return CardKlinik(
            namaKlink:
                '${stateTreatment.dataClinic[index].name}, ${stateTreatment.dataClinic[index].city}',
            rating: '${stateTreatment.dataClinic[index].rating} (120k)',
            km: stateTreatment.dataClinic[index].distance,
            urlImg: "${Global.FILE}/${stateTreatment.dataClinic[index].logo}",
            price: stateTreatment.dataClinic[index].price,
          );
        },
      ),
    );
  }
}
