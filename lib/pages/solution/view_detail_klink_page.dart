import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/treatment/treatment_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/etalase_treatment_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/produk_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart'
    as Treatment;
import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';
import '../../widget/card_widget.dart';
import '../../widget/filter_tap_widget.dart';
import '../../widget/share_solusion_widget_page.dart';

class DetailKlnikPage extends StatefulWidget {
  int id;
  DetailKlnikPage({required this.id, super.key});

  @override
  State<DetailKlnikPage> createState() => _DetailKlnikPageState();
}

class _DetailKlnikPageState extends State<DetailKlnikPage> {
  final TreatmentController state = Get.put(TreatmentController());
  bool isVisibelity = true;
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.getClinicDetail(context, widget.id);
      treatments.addAll(await state.getAllTreatment(context, page));
      setState(() {});
    });
  }

  Widget buildImg1(String images) => Image.network(
        images,
        fit: BoxFit.fill,
      );
  // get all treatment dibawah
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
                child: Text(
                  'Klinik Utama Lithea',
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        backgroundColor: greenColor,
        actions: [
          SvgPicture.asset(
            'assets/icons/love-grey.svg',
            color: whiteColor,
          ),
          const SizedBox(
            width: 21,
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
                builder: (context) => const ShareShowWidget(),
              );
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
          isLoading: state.isLoading.value,
          child: ListView(
            children: [
              CarouselSlider.builder(
                itemCount:
                    state.responseClinicDetail.value.data?.mediaClinics?.length,
                itemBuilder: (context, index, realIndex) {
                  final image = state.responseClinicDetail.value.data!
                      .mediaClinics?[index].media?.path;

                  return buildImg1('${Global.FILE}/$image');
                },
                options: CarouselOptions(
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
                    top: 25, left: 25, right: 25, bottom: 6),
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
                                '${state.responseClinicDetail.value.data?.province?.name},${state.responseClinicDetail.value.data?.city?.name}',
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
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      for (int i = 0;
                                          i <
                                              state
                                                  .responseClinicDetail
                                                  .value
                                                  .data!
                                                  .clinicOperationHours!
                                                  .length;
                                          i++)
                                        TetxtInfomasi(
                                          title: state
                                                  .responseClinicDetail
                                                  .value
                                                  .data!
                                                  .clinicOperationHours![i]
                                                  .day ??
                                              '-',
                                          title2:
                                              '${ConvertDate.schedule(state.responseClinicDetail.value.data!.clinicOperationHours![i].startTime.toString())} - ${ConvertDate.schedule(state.responseClinicDetail.value.data!.clinicOperationHours![i].endTime.toString())}WIB',
                                        ),
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
                                      Container(
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
                                          'Liat Peta',
                                          style: grenTextStyle.copyWith(
                                              fontSize: 13),
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
                                    '8120217031463',
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
                            //   rating: '4.9 (120k)',
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
                            //   rating: '4.9 (120k)',
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
                            //   rating: '4.9 (120k)',
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
                            //   rating: '4.9 (120k)',
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
                            //   rating: '4.9 (120k)',
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
                            //   rating: '4.9 (120k)',
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
              // CarouselSlider.builder(
              //   itemCount: images.length,
              //   itemBuilder: (context, index, realIndex) {
              //     final imge = imagesBolder[index];

              //     return buildImg1(imge);
              //   },
              //   options: CarouselOptions(
              //     viewportFraction: 1,
              //     onPageChanged: (index, reason) =>
              //         setState(() => activeIndex = index),
              //   ),
              // ),
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
                              'Semua Treatment',
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
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                        topEnd: Radius.circular(25),
                                        topStart: Radius.circular(25),
                                      ),
                                    ),
                                    builder: (context) => FilterShowModal(),
                                  );
                                },
                                child: Image.asset(
                                  'assets/icons/filters.png',
                                  width: 78,
                                ),
                              ),
                              InkWell(
                                onTap: () {
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
                                    builder: (context) => Wrap(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25,
                                              right: 25,
                                              top: 36,
                                              bottom: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Image.asset(
                                                      'assets/icons/danger-icons.png',
                                                      width: 14,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 22,
                                                  ),
                                                  Text(
                                                    'Filter',
                                                    style: blackHigtTextStyle
                                                        .copyWith(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 31,
                                              ),
                                              const FilterTapTreatment(
                                                title: 'Rating Tertinggi',
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              const FilterTapTreatment(
                                                title: 'Ulasan Terbanyaki',
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              const FilterTapTreatment(
                                                title: 'Treatment Terlaris',
                                              ),
                                              const SizedBox(
                                                height: 29,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text('Urutkan'),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EtalaseTreatMentPage()),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text('Retalase Treatment'),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 15,
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
                  content: isSelecteTampilan
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 19),
                              child: Wrap(
                                spacing: 12,
                                runSpacing: 12,
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
                                    rating: '${element.rating} (120k)',
                                    km: '${element.distance}',
                                    lokasiKlinik: element.clinic!.city!.name!,
                                  );
                                }).toList(),
                                // children: const [
                                // ProdukTreatment(
                                //   namaKlinik: 'Klinik Utama Lithea',
                                //   namaTreatmen: 'Radiant Glow Peeling',
                                //   diskonProduk: '20',
                                //   hargaDiskon: 'Rp250.000',
                                //   harga: 'Rp200.000',
                                //   urlImg: 'assets/images/lheatea.png',
                                //   rating: '4.9 (120k)',
                                //   km: '80',
                                //   lokasiKlinik: 'Bogor Timur',
                                // ),
                                // ProdukTreatment(
                                //   namaKlinik: 'ZAP Plaza Senayan',
                                //   namaTreatmen: 'Toning Laser',
                                //   diskonProduk: '20',
                                //   hargaDiskon: '1,250.000',
                                //   harga: '1,200.000',
                                //   urlImg: 'assets/images/zap-senayan.png',
                                //   rating: '4.9 (120k)',
                                //   km: '80',
                                //   lokasiKlinik: 'Bogor Timur',
                                // ),
                                // ProdukTreatment(
                                //   namaKlinik: 'ZAP Plaza Senayan',
                                //   namaTreatmen: 'IPL Rejuvenation',
                                //   diskonProduk: '20',
                                //   hargaDiskon: '100,000.000',
                                //   harga: '10,200.000',
                                //   urlImg: 'assets/images/Ipl1.png',
                                //   rating: '4.9 (120k)',
                                //   km: '80',
                                //   lokasiKlinik: 'Bogor Timur',
                                // ),
                                // ProdukTreatment(
                                //   namaKlinik: 'Klinik Utama Lithea',
                                //   namaTreatmen: 'Radiant Glow Peeling',
                                //   diskonProduk: '20',
                                //   hargaDiskon: '250.000',
                                //   harga: '200.000',
                                //   urlImg: 'assets/images/laser1.png',
                                //   rating: '4.9 (120k)',
                                //   km: '80',
                                //   lokasiKlinik: 'Bogor Timur',
                                // ),
                                // ProdukTreatment(
                                //   namaKlinik: 'Klinik Utama Lithea',
                                //   namaTreatmen: 'Radiant Glow Peeling',
                                //   diskonProduk: '20',
                                //   hargaDiskon: '250.000',
                                //   harga: '200.000',
                                //   urlImg: 'assets/images/laser2.png',
                                //   rating: '4.9 (120k)',
                                //   km: '80',
                                //   lokasiKlinik: 'Bogor Timur',
                                // ),
                                // ProdukTreatment(
                                //   namaKlinik: 'Klinik Utama Lithea',
                                //   namaTreatmen: 'Radiant Glow Peeling',
                                //   diskonProduk: '20',
                                //   hargaDiskon: '250.000',
                                //   harga: '200.000',
                                //   urlImg: 'assets/images/lheatea.png',
                                //   rating: '4.9 (120k)',
                                //   km: '80',
                                //   lokasiKlinik: 'Bogor Timur',
                                // ),
                                // ],
                              ),
                            )
                          ],
                        )
                      : Container()
                  // Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 25,
                  //           vertical: 19,
                  //         ),
                  //         child: Column(
                  //           children: const [
                  //             TampilanRight(),
                  //             TampilanRight(),
                  //             TampilanRight(),
                  //             TampilanRight(),
                  //             TampilanRight(),
                  //             TampilanRight(),
                  //           ],
                  //         ),
                  //       ),
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

class FilterShowModal extends StatelessWidget {
  const FilterShowModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 36, bottom: 40),
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
            'Pilihan Klinik',
            style: blackTextStyle.copyWith(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              CardSearch(
                title: 'Promo',
              ),
              SizedBox(
                width: 10,
              ),
              CardSearch(
                title: 'Buka Sekarang',
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: greenColor,
                    hoverColor: greenColor,
                    hintText: 'Min.',
                    hintStyle: TextStyle(color: subgreyColor, fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greenColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Text(
                'hingga',
                style: subGreyTextStyle,
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: greenColor,
                    hoverColor: greenColor,
                    hintText: 'Max',
                    hintStyle: TextStyle(color: subgreyColor, fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greenColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
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
    );
  }
}
