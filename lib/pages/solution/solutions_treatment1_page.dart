// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/location_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/solution/etalase_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/solution/nearme_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_treatment_klinik_page.dart';
import 'package:heystetik_mobileapps/pages/solution/top_rating_treatment.dart';
import 'package:heystetik_mobileapps/pages/solution/treatment_search.dart';
import 'package:heystetik_mobileapps/pages/solution/trending_treatment.dart';
import 'package:heystetik_mobileapps/widget/cirkel_category.dart';
import 'package:heystetik_mobileapps/widget/filter_treatment_widgets.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/maps_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import '../../controller/customer/solution/etalase_controller.dart';
import '../../controller/customer/solution/treatment_controller.dart';
import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';

class SolutionsTreatment1Page extends StatefulWidget {
  const SolutionsTreatment1Page({super.key});

  @override
  State<SolutionsTreatment1Page> createState() =>
      _SolutionsTreatment1PageState();
}

class _SolutionsTreatment1PageState extends State<SolutionsTreatment1Page> {
  final LocationController state = Get.put(LocationController());
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final EtalaseController etalaseController = Get.put(EtalaseController());

  String type = '';
  int rating = 0;
  int page = 1;
  List<Data2> treatments = [];
  String? search;
  String? concernName = "Semua Treatment";
  int activeIndex = 0;
  final List<String> images = [
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
  ];
  Map<String, dynamic> filter = {};
  final List<String> asset = [
    'assets/images/Peliing.png',
    'assets/images/IPL.png',
    'assets/images/Laser.png'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.getLocation(context);
      etalaseController.getConcern(context);
      stateTreatment.getTreatment(context);
      treatments.addAll(await stateTreatment.getAllTreatment(
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
            treatments.addAll(await stateTreatment.getAllTreatment(
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

  _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: spaceHeigt,
              ),
              Text(
                'Pilih Lokasi',
                style: blackHigtTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: spaceHeigt,
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () async {
                  await state.createLocation(
                    context,
                    state.currentLatitude.value,
                    state.currentLongitude.value,
                    state.currentAddress.value,
                  );
                  Get.back();
                },
                leading: CircleAvatar(
                  backgroundColor: greenColor,
                  child: Icon(
                    Icons.my_location_rounded,
                    color: whiteColor,
                  ),
                ),
                title: Text(
                  'Lokasi saat ini',
                  style: blackRegulerTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                subtitle: Obx(
                  () => Text(
                    state.currentAddress.value,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  Get.back();
                  Get.to(() => MapsWidget());
                },
                leading: CircleAvatar(
                  backgroundColor: greenColor,
                  child: Icon(
                    Icons.location_on_rounded,
                    color: whiteColor,
                  ),
                ),
                title: Text(
                  'Pilih lewat map',
                  style: blackRegulerTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        );
      },
    );
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
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Lokasimu',
                            style: blackTextStyle.copyWith(
                                fontSize: 13, fontWeight: regular),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          InkWell(
                            onTap: () async {
                              state.getCurrentPosition(context);
                              await _showModal(context);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: greenColor,
                            ),
                          )
                        ],
                      ),
                      Obx(
                        () => Text(
                          state.myAddress.value.isNotEmpty
                              ? state.myAddress.value
                              : state.currentAddress.value,
                          style: blackTextStyle.copyWith(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                notificasion(context, '1', blackColor),
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
                  child: SvgPicture.asset(
                    'assets/icons/humberger-icons.svg',
                  ),
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TreatmentSearch(
                              search: searchController.text,
                            ),
                          ),
                        );
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
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Top Treatment for you 🥳',
            //         style: blackHigtTextStyle.copyWith(fontSize: 18),
            //       ),
            //       Text(
            //         'Pilihan treatment berdasarkan konsultasimu.',
            //         style: subGreyTextStyle.copyWith(
            //           fontSize: 14,
            //           color: const Color(0xFF9B9B9B),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       Row(
            //         children: [
            //           Container(
            //             width: 111,
            //             height: 28,
            //             decoration: BoxDecoration(
            //                 color: greenColor,
            //                 borderRadius: BorderRadius.circular(24)),
            //             child: Center(
            //               child: Text(
            //                 'Bekas Jerawat',
            //                 style: whiteTextStyle.copyWith(
            //                     fontWeight: regular, fontSize: 13),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 8,
            //           ),
            //           Container(
            //             padding: const EdgeInsets.symmetric(
            //                 vertical: 6, horizontal: 16),
            //             decoration: BoxDecoration(
            //                 color: whiteColor,
            //                 borderRadius: BorderRadius.circular(24),
            //                 border: Border.all(color: const Color(0xffcccccc))),
            //             child: Center(
            //               child: Text(
            //                 'Jerawat',
            //                 style: blackTextStyle.copyWith(
            //                     fontWeight: regular, fontSize: 13),
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //       const SizedBox(
            //         height: 16,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 222,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stateTreatment.treatment.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => TreatmentKlinikPage(
                              treatmentType:
                                  stateTreatment.treatment[index].treatmentType,
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        height: 222,
                        width: 164,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(asset[index % 3]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(
                              colors: [
                                blackColor.withOpacity(0.5),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 11),
                              child: Text(
                                stateTreatment.treatment[index].treatmentType,
                                style: whiteTextStyle.copyWith(
                                    fontSize: 18, fontWeight: bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                final imge = images[index];

                return buildImg1(imge, index);
              },
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: images.length,
                effect: ScaleEffect(
                  activeDotColor: greenColor,
                  dotColor: const Color(0xffD9D9D9),
                  dotWidth: 6,
                  dotHeight: 6,
                ),
              ),
            ),
            Padding(
              padding: lsymetric.copyWith(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => const NearMePage());
                        },
                        child: Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/icons/nearme_icons.png'),
                            ),
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Near me',
                        style: blackTextStyle.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => TrendingTreatment());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/icons/trending_icons.png',
                              ),
                            ),
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Trending',
                          style: blackTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => TreatmentKlinikPage());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/icons/klnik_icons.png',
                              ),
                            ),
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Klinik',
                          style: blackTextStyle.copyWith(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => TopRatingTreatment());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/top_rating.png'),
                            ),
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'TOP Rating!',
                          style: blackTextStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            StickyHeader(
              header: Container(
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: lsymetric,
                      child: Text(
                        'Choose from Concerns',
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
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
                                  var res = await Get.to(
                                      () => EtalaseTreatMentPage());
                                  if (res == 'semua') {
                                    filter.clear();
                                    concernName = "Semua Treatment";
                                    page = 1;
                                    treatments.clear();
                                    setState(() {});
                                    treatments.addAll(
                                      await stateTreatment.getAllTreatment(
                                        context,
                                        page,
                                        search: search,
                                        filter: filter,
                                      ),
                                    );
                                    setState(() {});
                                  } else if (res == 'diskon') {
                                    page = 1;
                                    treatments.clear();
                                    setState(() {});
                                  } else {
                                    filter['concern_ids[]'] = res[0];
                                    concernName = res[1];
                                    page = 1;
                                    treatments.clear();
                                    setState(() {});
                                    if (filter['promo'] == true) {
                                      treatments.clear();
                                      page = 1;
                                      setState(() {});
                                      return;
                                    }
                                    treatments.addAll(
                                      await stateTreatment.getAllTreatment(
                                        context,
                                        page,
                                        search: search,
                                        filter: filter,
                                      ),
                                    );
                                    setState(() {});
                                  }
                                } else {
                                  filter['concern_ids[]'] = element.value.id;
                                  concernName = element.value.name;
                                  page = 1;
                                  treatments.clear();
                                  setState(() {});
                                  if (filter['promo'] == true) {
                                    treatments.clear();
                                    page = 1;
                                    setState(() {});
                                    return;
                                  }
                                  treatments.addAll(
                                    await stateTreatment.getAllTreatment(
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
                      height: 17,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xffCCCCCC),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filter.isNotEmpty
                                ? concernName == "Semua Treatment"
                                    ? "Filter"
                                    : concernName.toString()
                                : concernName.toString(),
                            style: blackHigtTextStyle.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              if (filter.isNotEmpty)
                                InkWell(
                                  onTap: () async {
                                    filter.clear();
                                    concernName = "Semua Treatment";
                                    page = 1;
                                    treatments.clear();
                                    setState(() {});
                                    treatments.addAll(
                                      await stateTreatment.getAllTreatment(
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
                                  return showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                        topEnd: Radius.circular(25),
                                        topStart: Radius.circular(25),
                                      ),
                                    ),
                                    builder: (context) =>
                                        FilterAllTreatmentWidget(param: filter),
                                  ).then((value) async {
                                    if (value == null) return;

                                    filter = value;
                                    if (filter['rating[]'] != null &&
                                        filter['rating[]']) {
                                      filter['rating[]'] = ['4', '5'];
                                    }
                                    if (filter['promo'] == true) {
                                      treatments.clear();
                                      page = 1;
                                      setState(() {});
                                    } else {
                                      page = 1;
                                      treatments.clear();
                                      setState(() {});
                                      treatments.addAll(
                                        await stateTreatment.getAllTreatment(
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
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 6, bottom: 6),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: (filter.isNotEmpty)
                                          ? greenColor
                                          : borderColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/filter-icon.png',
                                        color: (filter.isNotEmpty)
                                            ? greenColor
                                            : null,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        filter.isNotEmpty
                                            ? "${filter.length} Filter"
                                            : "Filter",
                                        style: TextStyle(
                                          color: filter.isNotEmpty
                                              ? greenColor
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
              content: treatments.isEmpty
                  ? Center(
                      child: Text(
                        'Belum ada treatment',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Wrap(
                            spacing: 15,
                            runSpacing: 12,
                            children: treatments.map((element) {
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
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
