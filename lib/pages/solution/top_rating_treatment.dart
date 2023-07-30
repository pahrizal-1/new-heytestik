import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';
import 'package:heystetik_mobileapps/widget/tampilan_right_widget.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../widget/produk_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';

class TopRatingTreatment extends StatefulWidget {
  const TopRatingTreatment({super.key});

  @override
  State<TopRatingTreatment> createState() => _TopRatingTreatmentState();
}

class _TopRatingTreatmentState extends State<TopRatingTreatment> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  int page = 1;
  List<Data2> treatments = [];
  bool isSelecteSearch = true;
  bool isSelecteTampilan = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments
          .addAll(await stateTreatment.getTopRatingTreatment(context, page));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            treatments.addAll(
                await stateTreatment.getTopRatingTreatment(context, page));
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
                      'Top Rating',
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 13),
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/search1.png',
                                width: 20, color: const Color(0xff9B9B9B)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cari Treatment',
                              style: subGreyTextStyle.copyWith(
                                  color: const Color(0xff9B9B9B)),
                            )
                          ],
                        ),
                      ),
                    )
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
                            ? Image.asset(
                                'assets/images/tampilan1.png',
                              )
                            : SvgPicture.asset('assets/icons/tampilan1.svg'),
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
                        namaKlinik: element.clinic!.name!,
                        namaTreatmen: element.name!,
                        diskonProduk: '0',
                        hargaDiskon: '',
                        harga: element.price.toString(),
                        urlImg:
                            "${Global.FILE}/${element.mediaTreatments![0].media!.path!}",
                        rating: '${element.rating} (120k)',
                        km: element.distance!,
                        lokasiKlinik: element.clinic!.city!.name!,
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
                              (e) => TampilanRight(treatment: e),
                            )
                            .toList()),
                  ),
          ],
        ),
      ),
    );
  }
}
