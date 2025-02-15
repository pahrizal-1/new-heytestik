// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_treatment_widgets.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_widget.dart';
import 'package:heystetik_mobileapps/widget/tampilan_right_widget.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_share/social_share.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart'
    as Treatment;
import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';

class DetailKlinikPage extends StatefulWidget {
  int clinicId;
  DetailKlinikPage({required this.clinicId, super.key});

  @override
  State<DetailKlinikPage> createState() => _DetailKlnikPageState();
}

class _DetailKlnikPageState extends State<DetailKlinikPage> {
  final TreatmentController state = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();
  bool isVisibelity = true;
  bool isVisibelityJam = true;
  int activeIndex = 0;
  final images = [
    'assets/images/bg-treatment.png',
    'assets/images/bg-treatment.png',
    'assets/images/bg-treatment.png'
  ];
  int activeBolder = 0;
  final imagesBolder = [
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
    'assets/images/bg-buy-get1.png',
  ];
  int currentIndex = 0;
  bool isSelecteTampilan = true;
  List<Treatment.Data2> treatments = [];
  int page = 1;
  String? search;
  Map<String, dynamic> filter = {};
  String? treatmentType;
  String? orderBy;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.getClinicDetail(context, widget.clinicId);
      treatments.addAll(await state.getAllTreatment(context, page));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            treatments.addAll(await state.getAllTreatment(
              context,
              page,
              search: search,
              filter: filter,
            ));
            state.isLoadingMore.value = false;
            setState(() {});
          });
        }
      }
    });
  }

  Widget buildImg1(String images) => Image.network(
        images,
        fit: BoxFit.fill,
      );
  Widget buildImg2(String images) => Image.asset(
        images,
        fit: BoxFit.fill,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
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
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Obx(
                  () => Text(
                    state.responseClinicDetail.value.data?.name ?? '',
                    style:
                        whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: greenColor,
        actions: [
          // SvgPicture.asset(
          //   'assets/icons/love-grey.svg',
          //   color: whiteColor,
          // ),
          // const SizedBox(
          //   width: 21,
          // ),
          InkWell(
            onTap: () async {
              Uri? url = await createDynamicLinkClinic(widget.clinicId);
              print("url $url");
              await SocialShare.shareOptions(url.toString());
              // showModalBottomSheet(
              //   isDismissible: false,
              //   context: context,
              //   backgroundColor: Colors.white,
              //   shape: const RoundedRectangleBorder(
              //     borderRadius: BorderRadiusDirectional.only(
              //       topEnd: Radius.circular(25),
              //       topStart: Radius.circular(25),
              //     ),
              //   ),
              //   builder: (context) => const ShareShowWidget(),
              // );
            },
            child: SvgPicture.asset(
              'assets/icons/share-icons.svg',
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 21,
          ),
        ],
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: ListView(
            controller: scrollController,
            children: [
              CarouselSlider.builder(
                itemCount:
                    state.responseClinicDetail.value.data?.mediaClinics?.length,
                itemBuilder: (context, index, realIndex) {
                  final image = state.responseClinicDetail.value.data
                      ?.mediaClinics?[index].media?.path;

                  return buildImg1('${Global.FILE}/$image');
                },
                options: CarouselOptions(
                  pauseAutoPlayInFiniteScroll: false,
                  height: 210,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => setState(
                    () => activeIndex = index,
                  ),
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
                      dotHeight: 6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 20, right: 20, bottom: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          '${Global.FILE}/${state.responseClinicDetail.value.data?.mediaClinicLogo?.media?.path}',
                          width: 32,
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.responseClinicDetail.value.data?.name}',
                              style: blackHigtTextStyle.copyWith(fontSize: 20),
                            ),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 250),
                              child: Text(
                                '${state.responseClinicDetail.value.data?.province?.name}, ${state.responseClinicDetail.value.data?.city?.name}',
                                style: subTitleTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/stars.svg'),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${state.responseClinicDetail.value.data?.rating}',
                                  style: subGreyTextStyle.copyWith(
                                      fontSize: 12,
                                      color: const Color(0xff9B9B9B)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(
                                    'assets/icons/arrow_right.svg'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Jam Buka',
                              style: blackRegulerTextStyle.copyWith(
                                  color: blackColor),
                            ),
                            Text(
                              'Buka - Tutup pada 22:00 WIB',
                              style: grenTextStyle.copyWith(
                                  fontSize: 15, fontWeight: regular),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Spasialisasi',
                              style: blackRegulerTextStyle.copyWith(
                                  color: blackColor),
                            ),
                            Text(
                              'Face & Body Contouring LaserAnti Aging',
                              style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15, fontWeight: regular),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Table(
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Range Harga',
                              style: blackRegulerTextStyle.copyWith(
                                  color: blackColor),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/dolar-icons.svg',
                                  width: 35,
                                ),
                                Text(
                                  '(200 Ribu-100 Juta)',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 15, fontWeight: regular),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    dividergrey(),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Deskripsi Klinik',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      '${state.responseClinicDetail.value.data?.description}',
                      style: blackRegulerTextStyle,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    dividergrey(),
                    const SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisibelity = !isVisibelity;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            'Informasi Klinik',
                            style: blackTextStyle.copyWith(fontSize: 15),
                          ),
                          const Spacer(),
                          Icon(
                            isVisibelity
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: greenColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: isVisibelity,
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'Jam Buka',
                                    style: blackRegulerTextStyle.copyWith(
                                        color: blackColor,
                                        fontSize: 13,
                                        letterSpacing: 0.26),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Buka - Tutup pada 22:00 WIB',
                                            style: grenTextStyle.copyWith(
                                                fontSize: 12,
                                                fontWeight: regular),
                                          ),
                                          Expanded(
                                              child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isVisibelityJam =
                                                    !isVisibelityJam;
                                              });
                                            },
                                            child: isVisibelityJam
                                                ? Icon(
                                                    Icons.keyboard_arrow_down,
                                                  )
                                                : Icon(
                                                    Icons.keyboard_arrow_up,
                                                  ),
                                          ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Visibility(
                                        visible: isVisibelityJam,
                                        child: Column(
                                          children: [
                                            for (int i = 0;
                                                i <
                                                    (state
                                                            .responseClinicDetail
                                                            .value
                                                            .data
                                                            ?.clinicOperationHours
                                                            ?.length ??
                                                        0);
                                                i++)
                                              TetxtInfomasi(
                                                title: state
                                                        .responseClinicDetail
                                                        .value
                                                        .data!
                                                        .clinicOperationHours![
                                                            i]
                                                        .day ??
                                                    '-',
                                                title2:
                                                    '${ConvertDate.schedule(state.responseClinicDetail.value.data!.clinicOperationHours![i].startTime.toString())} - ${ConvertDate.schedule(state.responseClinicDetail.value.data!.clinicOperationHours![i].endTime.toString())}WIB',
                                              ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'Spasialisasi',
                                    style: blackRegulerTextStyle.copyWith(
                                        color: blackColor, fontSize: 13),
                                  ),
                                  Text(
                                    'Face & Body Contouring LaserAnti Aging',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 13, fontWeight: regular),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'Alamat Klinik',
                                    style: blackRegulerTextStyle.copyWith(
                                        color: blackColor, fontSize: 13),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${state.responseClinicDetail.value.data?.address}',
                                        style: blackRegulerTextStyle.copyWith(
                                            fontSize: 13, fontWeight: regular),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => MapsWidgetClinic(
                                                lat: state
                                                    .responseClinicDetail
                                                    .value
                                                    .data!
                                                    .pinpointLatitude!,
                                                long: state
                                                    .responseClinicDetail
                                                    .value
                                                    .data!
                                                    .pinpointLongitude!,
                                              ));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 9),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                color: greenColor, width: 0.6),
                                          ),
                                          child: Text(
                                            'Lihat Peta',
                                            style: grenTextStyle.copyWith(
                                                fontSize: 13),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    'No. Izin Usaha Klinik',
                                    style: blackRegulerTextStyle.copyWith(
                                        color: blackColor, fontSize: 13),
                                  ),
                                  Text(
                                    '${state.responseClinicDetail.value.data?.registrationNumber}',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 13, fontWeight: regular),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const dividergreen(),
              Container(
                width: 390,
                height: 395,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/bg-detail-teatment.png',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Treatment Deal of the Day',
                            style: whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'Berakhir dalam ',
                                style: blackRegulerTextStyle.copyWith(
                                    color: whiteColor),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: whiteColor),
                                child: Text(
                                  '2 hari',
                                  style: grenTextStyle.copyWith(fontSize: 13),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            // ProdukTreatment(
                            //   namaKlinik: 'Klinik Utama Lithea',
                            //   namaTreatmen: 'Radiant Glow Peeling',
                            //   diskonProduk: '20',
                            //   hargaDiskon: 'Rp250.000',
                            //   harga: '200.000',
                            //   urlImg: 'assets/images/lheatea.png',
                            //   rating: '4.9 (0k)',
                            //   km: '80',
                            //   lokasiKlinik: 'Bogor Timur',
                            // ),
                            // const ProdukTreatment(
                            //   namaKlinik: 'ZAP Plaza Senayan',
                            //   namaTreatmen: 'Toning Laser',
                            //   diskonProduk: '20',
                            //   hargaDiskon: '1,250.000',
                            //   harga: '1,200.000',
                            //   urlImg: 'assets/images/zap-senayan.png',
                            //   rating: '4.9 (0k)',
                            //   km: '80',
                            //   lokasiKlinik: 'Bogor Timur',
                            // ),
                            // const ProdukTreatment(
                            //   namaKlinik: 'ZAP Plaza Senayan',
                            //   namaTreatmen: 'IPL Rejuvenation',
                            //   diskonProduk: '20',
                            //   hargaDiskon: '100,000.000',
                            //   harga: '10,200.000',
                            //   urlImg: 'assets/images/Ipl1.png',
                            //   rating: '4.9 (0k)',
                            //   km: '80',
                            //   lokasiKlinik: 'Bogor Timur',
                            // ),
                            // const ProdukTreatment(
                            //   namaKlinik: 'Klinik Utama Lithea',
                            //   namaTreatmen: 'Radiant Glow Peeling',
                            //   diskonProduk: '20',
                            //   hargaDiskon: '250.000',
                            //   harga: '200.000',
                            //   urlImg: 'assets/images/laser1.png',
                            //   rating: '4.9 (0k)',
                            //   km: '80',
                            //   lokasiKlinik: 'Bogor Timur',
                            // ),
                            // const ProdukTreatment(
                            //   namaKlinik: 'Klinik Utama Lithea',
                            //   namaTreatmen: 'Radiant Glow Peeling',
                            //   diskonProduk: '20',
                            //   hargaDiskon: '250.000',
                            //   harga: '200.000',
                            //   urlImg: 'assets/images/laser2.png',
                            //   rating: '4.9 (0k)',
                            //   km: '80',
                            //   lokasiKlinik: 'Bogor Timur',
                            // ),
                            // const ProdukTreatment(
                            //   namaKlinik: 'Klinik Utama Lithea',
                            //   namaTreatmen: 'Radiant Glow Peeling',
                            //   diskonProduk: '20',
                            //   hargaDiskon: '250.000',
                            //   harga: '200.000',
                            //   urlImg: 'assets/images/lheatea.png',
                            //   rating: '4.9 (0k)',
                            //   km: '80',
                            //   lokasiKlinik: 'Bogor Timur',
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final imge = imagesBolder[index];

                  return buildImg2(imge);
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
              StickyHeader(
                header: Container(
                  padding: lsymetric.copyWith(top: 15, bottom: 9),
                  color: whiteColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            filter.isNotEmpty ? 'Filter' : 'Semua Treatment',
                            style: blackHigtTextStyle.copyWith(fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSelecteTampilan = !isSelecteTampilan;
                              });
                            },
                            child: Row(
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
                                    ? SvgPicture.asset(
                                        'assets/icons/tampilan1.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/tampillan2.svg')
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (filter.isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  treatmentType = null;
                                  orderBy = null;
                                  filter.clear();
                                  page = 1;
                                  treatments.clear();
                                  state.isLoadingMore.value = true;
                                  setState(() {});
                                  treatments.addAll(
                                    await state.getAllTreatment(
                                      context,
                                      page,
                                      search: search,
                                      filter: filter,
                                    ),
                                  );
                                  state.isLoadingMore.value = false;
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
                                    borderRadius: BorderRadiusDirectional.only(
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

                                  if (filter.containsKey('order_by')) {
                                    if (filter['order_by'] == "RATING") {
                                      orderBy = "Rating";
                                    } else if (filter['order_by'] ==
                                        "POPULARITY") {
                                      orderBy = "Popularitas";
                                    } else if (filter['order_by'] ==
                                        "DISTANCE") {
                                      orderBy = "Jarak";
                                    }
                                  }
                                  if (filter['promo'] == true) {
                                    treatments.clear();
                                    page = 1;
                                    setState(() {});
                                  } else {
                                    page = 1;
                                    treatments.clear();
                                    state.isLoadingMore.value = true;
                                    setState(() {});
                                    treatments.addAll(
                                      await state.getAllTreatment(
                                        context,
                                        page,
                                        search: search,
                                        filter: filter,
                                      ),
                                    );
                                    state.isLoadingMore.value = false;
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            InkWell(
                              onTap: () {
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
                                  builder: (context) =>
                                      FilterUrutkanRating(val: orderBy),
                                ).then((value) async {
                                  if (value == null) return;

                                  if (value == "RATING") {
                                    orderBy = "Rating";
                                  } else if (value == "POPULARITY") {
                                    orderBy = "Popularitas";
                                  } else if (value == "DISTANCE") {
                                    orderBy = "Jarak";
                                  }

                                  filter['order_by'] = value;
                                  if (filter['promo'] == true) {
                                    treatments.clear();
                                    page = 1;
                                    setState(() {});
                                    return;
                                  }
                                  page = 1;
                                  treatments.clear();
                                  state.isLoadingMore.value = true;
                                  setState(() {});
                                  treatments.addAll(
                                    await state.getNearTreatment(
                                      context,
                                      page,
                                      search: search,
                                      filter: filter,
                                    ),
                                  );
                                  state.isLoadingMore.value = false;
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
                                  border: Border.all(
                                    color: (orderBy is String)
                                        ? greenColor
                                        : borderColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      (orderBy is String ? orderBy : 'Urutkan')
                                          .toString(),
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        color: (orderBy is String)
                                            ? greenColor
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 15,
                                      color: (orderBy is String)
                                          ? greenColor
                                          : null,
                                    )
                                  ],
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
                                  builder: (context) =>
                                      FilterTreatmentType(val: treatmentType),
                                ).then((value) async {
                                  if (value == null) return;

                                  treatmentType = value;
                                  filter['treatment_type[]'] = value;
                                  if (filter['promo'] == true) {
                                    treatments.clear();
                                    page = 1;
                                    setState(() {});
                                    return;
                                  }
                                  page = 1;
                                  treatments.clear();
                                  state.isLoadingMore.value = true;
                                  setState(() {});
                                  treatments.addAll(
                                    await state.getNearTreatment(
                                      context,
                                      page,
                                      search: search,
                                      filter: filter,
                                    ),
                                  );
                                  state.isLoadingMore.value = false;
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
                                  border: Border.all(
                                    color:
                                        (filter.containsKey("treatment_type[]"))
                                            ? greenColor
                                            : borderColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      (filter.containsKey("treatment_type[]")
                                              ? filter['treatment_type[]']
                                              : 'Treatment')
                                          .toString(),
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        color: (filter.containsKey(
                                                "treatment_type[]"))
                                            ? greenColor
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 15,
                                      color: (filter
                                              .containsKey("treatment_type[]"))
                                          ? greenColor
                                          : null,
                                    )
                                  ],
                                ),
                              ),
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
                    : isSelecteTampilan
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 19),
                                child: Wrap(
                                  spacing: 15,
                                  runSpacing: 15,
                                  children: treatments.map((element) {
                                    return ProdukTreatment(
                                      treatmentData: element,
                                      namaKlinik: element.clinic!.name!,
                                      namaTreatmen: element.name!,
                                      diskonProduk: '0',
                                      hargaDiskon: '0',
                                      harga: element.price!.toString(),
                                      urlImg: element.mediaTreatments!.isEmpty
                                          ? ""
                                          : "${Global.FILE}/${element.mediaTreatments![0].media!.path!}",
                                      rating: '${element.rating} (0k)',
                                      km: '${element.distance}',
                                      lokasiKlinik: element.clinic!.city!.name!,
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 19),
                            child: Column(
                              children: treatments
                                  .map(
                                    (e) => TampilanRight(
                                      treatment: e,
                                      urlImg: e.mediaTreatments!.isEmpty
                                          ? ""
                                          : "${Global.FILE}/${e.mediaTreatments![0].media!.path!}",
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MapsWidgetClinic extends StatelessWidget {
  double lat;
  double long;
  MapsWidgetClinic({required this.lat, required this.long, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpenStreetMapSearchAndPick(
          center: LatLong(
            lat,
            long,
          ),
          buttonColor: greenColor,
          buttonText: 'Lokasi',
          onPicked: (pickedData) async {},
        ),
      ),
    );
  }
}
