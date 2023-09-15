import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/tampilan_right_widget.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../widget/produk_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';

class TrendingTreatment extends StatefulWidget {
  const TrendingTreatment({super.key});

  @override
  State<TrendingTreatment> createState() => _TrendingTreatmentState();
}

class _TrendingTreatmentState extends State<TrendingTreatment> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  int page = 1;
  List<Data2> treatments = [];
  bool isSelecteSearch = true;
  bool isSelecteTampilan = true;
  String? search;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(await stateTreatment.getTrendingTreatment(context, page,
          search: search));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            treatments.addAll(await stateTreatment
                .getTrendingTreatment(context, page, search: search));
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
                      'Trending',
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
                                onEditingComplete: () async {
                                  search = searchController.text;
                                  page = 1;
                                  treatments.clear();
                                  treatments.addAll(await stateTreatment
                                      .getTrendingTreatment(context, page,
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
                ? Wrap(
                    runSpacing: 12,
                    spacing: 12,
                    children: treatments.map((element) {
                      return ProdukTreatment(
                        namaKlinik: element.clinic?.name ?? '-',
                        namaTreatmen: element.name ?? '-',
                        diskonProduk: '0',
                        hargaDiskon: '',
                        harga: element.price.toString(),
                        urlImg: element.mediaTreatments!.isEmpty
                            ? ""
                            : "${Global.FILE}/${element.mediaTreatments![0].media!.path!}",
                        rating: '${element.rating} (120k)',
                        km: element.distance ?? '-',
                        lokasiKlinik: element.clinic?.city?.name ?? '-',
                        treatmentData: element,
                      );
                    }).toList(),
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
                            .toList()),
                  ),
          ],
        ),
      ),
    );
  }
}
