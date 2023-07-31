import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi_page.dart';
import 'package:heystetik_mobileapps/pages/solution/ulasan_solution_page.dart';

import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/customer/treatment/treatment_controller.dart';
import '../../models/treatment_review.dart';
import '../../widget/loading_widget.dart';
import '../../widget/produk_widget.dart';
import '../../widget/share_solusion_widget_page.dart';
import '../../widget/text_form_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';

class BokingTreatment extends StatefulWidget {
  final Data2 treatment;

  const BokingTreatment({
    super.key,
    required this.treatment,
  });

  @override
  State<BokingTreatment> createState() => _BokingTreatmentState();
}

class _BokingTreatmentState extends State<BokingTreatment> {
  final TreatmentController stateTreatment = Get.put(TreatmentController());
  final ScrollController scrollController = ScrollController();

  int activeIndex = 0;
  final images = [
    'assets/images/boking_image.png',
    'assets/images/boking-image1.png',
  ];
  int currentIndex = 0;
  bool? isFavourite;
  int page = 1;

  Map<String, dynamic> dataOverview = {};
  List<Data2> treatments = [];
  List<TreatmentReviewModel> reviews = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateTreatment.getTreatmentDetail(context, widget.treatment.id!);
      treatments.addAll(await stateTreatment.getTreatmentFromSameClinic(
          context, page, widget.treatment.clinic!.id!));
      reviews.addAll(await stateTreatment.getTreatmentReview(
          context, page, widget.treatment.id!));
      dataOverview = await stateTreatment.getTreatmentOverview(
          context, widget.treatment.id!);
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            treatments.addAll(await stateTreatment.getTreatmentFromSameClinic(
                context, page, widget.treatment.clinic!.id!));
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingWidget(
        isLoading: stateTreatment.isLoading.value,
        child: Scaffold(
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
                ],
              ),
            ),
            backgroundColor: greenColor,
            actions: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavourite =
                          (stateTreatment.treatmentDetail.value.wishlist ??
                              false);
                      isFavourite = !isFavourite!;
                    });

                    print(widget.treatment.id!);
                    print(isFavourite);

                    stateTreatment.userWishlistTreatment(
                        context, widget.treatment.id!, isFavourite!);
                  },
                  child: (isFavourite == null
                              ? stateTreatment.treatmentDetail.value.wishlist!
                              : isFavourite!) ==
                          false
                      ? Icon(Icons.favorite_border)
                      : Icon(Icons.favorite),
                ),
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
                    builder: (context) => ShareShowWidget(),
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
          body: ListView(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.treatment.mediaTreatments!.length,
                    itemBuilder: (context, index, realIndex) {
                      final imge =
                          widget.treatment.mediaTreatments![index].media!.path!;

                      return buildImage(imge, index);
                    },
                    options: CarouselOptions(
                      height: 390,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  ),
                  Positioned(
                    left: 180,
                    bottom: 5,
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: widget.treatment.mediaTreatments!.length,
                      effect: JumpingDotEffect(
                        activeDotColor: greenColor,
                        dotColor: whiteColor,
                        dotWidth: 10,
                        dotHeight: 10,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 36,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/logo-icon-treatment.png',
                          width: 32,
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.treatment.clinic!.name!,
                              style: blackHigtTextStyle.copyWith(fontSize: 20),
                            ),
                            Text(
                              widget.treatment.clinic!.city!.name!,
                              style: subTitleTextStyle.copyWith(fontSize: 12),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Text(
                      widget.treatment.name!,
                      style: blackTextStyle.copyWith(
                          fontWeight: medium, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.treatment.description!,
                      style: TextStyle(color: subTitleColor, fontSize: 12),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(widget.treatment.price, 2),
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        decorationThickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 87,
                          decoration: BoxDecoration(
                            color: const Color(0xffF1F1F1),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              'Dapat Refund',
                              style: blackTextStyle.copyWith(
                                  fontWeight: regular, fontSize: 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          height: 24,
                          width: 87,
                          decoration: BoxDecoration(
                            color: const Color(0xffF1F1F1),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              'Termasuk Pajak',
                              style: blackTextStyle.copyWith(
                                  fontWeight: regular, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    TextFromPerawat(
                      title: 'Detail Perawatan',
                      onTap: () {
                        customeshomodal(
                          context,
                          DetailMoreDialogFilter(
                            treatmentData: widget.treatment,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const TextFromPerawat(
                      title: 'Jadwal Ulang Perawatan',
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const TextFromPerawat(
                      title: 'Pengembalian Dana',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              const dividergreen(),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 24,
                          color: Color(0xffFFC36A),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${dataOverview['data'] == null ? 0 : dataOverview['data']['avg_rating']}',
                          style: blackHigtTextStyle.copyWith(fontSize: 30),
                        ),
                        Text(
                          '/5.0',
                          style: subGreyTextStyle.copyWith(
                              fontSize: 12, color: const Color(0XffCCCCCC)),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${dataOverview['data'] == null ? 0 : dataOverview['data']['satisfied_percentage']}% Sobat Hey',
                                  style: blackHigtTextStyle.copyWith(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  ' merasa puas',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 12),
                                ),
                                const Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${dataOverview['data'] == null ? 0 : dataOverview['data']['total_rating']} rating',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.circle,
                                  size: 6,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${dataOverview['data'] == null ? 0 : dataOverview['data']['total_review']} ulasan',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            margin: const EdgeInsets.only(right: 3),
                            height: 50,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border:
                                  Border.all(color: const Color(0xffCCCCCC)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${dataOverview['data'] == null ? 0 : dataOverview['data']['avg_care_rating']}',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Perawatan',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 10, fontWeight: regular),
                                    ),
                                    Text(
                                      '${dataOverview['data'] == null ? 0 : dataOverview['data']['count_care_rating']} ulasan',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            margin: const EdgeInsets.only(right: 3),
                            height: 50,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border:
                                  Border.all(color: const Color(0xffCCCCCC)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${dataOverview['data'] == null ? 0 : dataOverview['data']['avg_service_rating']}',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pelayanan',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 10, fontWeight: regular),
                                    ),
                                    Text(
                                      '${dataOverview['data'] == null ? 0 : dataOverview['data']['count_service_rating']} ulasan',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            margin: const EdgeInsets.only(right: 3),
                            height: 50,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border:
                                  Border.all(color: const Color(0xffCCCCCC)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${dataOverview['data'] == null ? 0 : dataOverview['data']['avg_management_rating']}',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Manajemen',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 10, fontWeight: regular),
                                    ),
                                    Text(
                                      '${dataOverview['data'] == null ? 0 : dataOverview['data']['count_management_rating']} ulasan',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Ulasan',
                              style: blackHigtTextStyle.copyWith(fontSize: 18),
                            ),
                            Text(
                              ' Sobat Hey',
                              style: blackHigtTextStyle.copyWith(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UlasanPage()));
                          },
                          child: Text(
                            'Lihat Semua',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    if (reviews.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 11,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/doctor1.png',
                                width: 40,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jessy',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                  Text(
                                    'Perawatan Peeling TCA Ringan',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 13, fontWeight: regular),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 60,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        Icons.star,
                                        size: 12,
                                        color:
                                            reviews[0].averageRating.toInt() >
                                                    index
                                                ? Color(0xffFFC36A)
                                                : Colors.grey,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  '1 Bulan Yang lalu',
                                  style: blackHigtTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Text(
                            reviews[0].review,
                            style: greyTextStyle.copyWith(
                                fontSize: 13, color: const Color(0xff6B6B6B)),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: reviews[0].media.length,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  '${Global.FILE}/${reviews[0].media[index].path}',
                                  // width: 100,
                                  fit: BoxFit.fill,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 16.0,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            'Perawatan Peeling TCA Ringan',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 13, fontWeight: regular),
                          ),
                          const Spacer(),
                          const Icon(Icons.more_vert)
                        ],
                      ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Color(0xffFFC36A),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '1 Bulan Yang lalu',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
                      style: greyTextStyle.copyWith(
                          fontSize: 13, color: const Color(0xff6B6B6B)),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Image.asset(
                      'assets/images/review-wajah.png',
                      width: 72,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 6,
                color: Color(0xffF1F1F1),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Perawatan lain di Klinik Utama Lithea',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: treatments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 16 : 0,
                        ),
                        child: ProdukTreatment(
                          namaKlinik: treatments[index].clinic!.name!,
                          namaTreatmen: treatments[index].name!,
                          diskonProduk: '0',
                          hargaDiskon: '',
                          harga: treatments[index].price.toString(),
                          urlImg:
                              "${Global.FILE}/${treatments[index].mediaTreatments![0].media!.path}",
                          rating: "${treatments[index].rating}",
                          km: treatments[index].distance!,
                          lokasiKlinik: treatments[index].clinic!.city!.name!,
                          treatmentData: treatments[index],
                        ));
                  },
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: lsymetric,
              //     child: Row(
              //       children: const [
              //         ProdukTreatment(
              //           namaKlinik: 'Klinik Utama Lithea',
              //           namaTreatmen: 'Radiant Glow Peeling',
              //           diskonProduk: '20',
              //           hargaDiskon: 'Rp250.000',
              //           harga: '200.000',
              //           urlImg: 'assets/images/lheatea.png',
              //           rating: '4.9 (120k)',
              //           km: '80',
              //           lokasiKlinik: 'Bogor Timur',
              //         ),
              //         ProdukTreatment(
              //           namaKlinik: 'ZAP Plaza Senayan',
              //           namaTreatmen: 'Toning Laser',
              //           diskonProduk: '20',
              //           hargaDiskon: '1,250.000',
              //           harga: '1,200.000',
              //           urlImg: 'assets/images/zap-senayan.png',
              //           rating: '4.9 (120k)',
              //           km: '80',
              //           lokasiKlinik: 'Bogor Timur',
              //         ),
              //         ProdukTreatment(
              //           namaKlinik: 'ZAP Plaza Senayan',
              //           namaTreatmen: 'IPL Rejuvenation',
              //           diskonProduk: '20',
              //           hargaDiskon: '100,000.000',
              //           harga: '10,200.000',
              //           urlImg: 'assets/images/Ipl1.png',
              //           rating: '4.9 (120k)',
              //           km: '80',
              //           lokasiKlinik: 'Bogor Timur',
              //         ),
              //         ProdukTreatment(
              //           namaKlinik: 'Klinik Utama Lithea',
              //           namaTreatmen: 'Radiant Glow Peeling',
              //           diskonProduk: '20',
              //           hargaDiskon: '250.000',
              //           harga: '200.000',
              //           urlImg: 'assets/images/laser1.png',
              //           rating: '4.9 (120k)',
              //           km: '80',
              //           lokasiKlinik: 'Bogor Timur',
              //         ),
              //         ProdukTreatment(
              //           namaKlinik: 'Klinik Utama Lithea',
              //           namaTreatmen: 'Radiant Glow Peeling',
              //           diskonProduk: '20',
              //           hargaDiskon: '250.000',
              //           harga: '200.000',
              //           urlImg: 'assets/images/laser2.png',
              //           rating: '4.9 (120k)',
              //           km: '80',
              //           lokasiKlinik: 'Bogor Timur',
              //         ),
              //         ProdukTreatment(
              //           namaKlinik: 'Klinik Utama Lithea',
              //           namaTreatmen: 'Radiant Glow Peeling',
              //           diskonProduk: '20',
              //           hargaDiskon: '250.000',
              //           harga: '200.000',
              //           urlImg: 'assets/images/lheatea.png',
              //           rating: '4.9 (120k)',
              //           km: '80',
              //           lokasiKlinik: 'Bogor Timur',
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          bottomNavigationBar: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 11, top: 11),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.to(SelectConditionsPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: greenColor),
                              borderRadius: BorderRadius.circular(7)),
                          height: 40,
                          child: Center(
                            child: Text(
                              'Konsultasi',
                              style: grenTextStyle.copyWith(
                                  fontSize: 15, fontWeight: bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReservasiPage(
                                treatment: widget.treatment,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          width: 142,
                          decoration: BoxDecoration(
                              color: greenColor,
                              border: Border.all(color: greenColor),
                              borderRadius: BorderRadius.circular(7)),
                          height: 40,
                          child: Center(
                            child: Text(
                              'Reservasi',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 15, fontWeight: bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String images, int index) => Image.network(
      "${Global.FILE}/$images",
      fit: BoxFit.cover,
    );
