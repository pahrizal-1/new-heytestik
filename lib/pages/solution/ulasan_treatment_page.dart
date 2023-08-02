// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/treatment/treatment_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/widget/topik_ulasan_widgets.dart';

import '../../models/treatment_review.dart';
import '../../widget/coment_ulasan_widgets.dart';
import '../../widget/filter_tap_widget.dart';
import '../../widget/rating_dengan_ulasan_widgets.dart';
import '../../widget/share_solusion_widget_page.dart';

class UlasanTreatmentPage extends StatefulWidget {
  const UlasanTreatmentPage({
    super.key,
    required this.treatmentID,
  });

  final int treatmentID;

  @override
  State<UlasanTreatmentPage> createState() => _UlasanTreatmentPageState();
}

class _UlasanTreatmentPageState extends State<UlasanTreatmentPage> {
  final ScrollController scrollController = ScrollController();
  final TreatmentController treatmentController =
      Get.put(TreatmentController());

  int page = 1;
  List<TreatmentReviewModel> reviews = [];
  bool isVisibelity = true;
  Map<String, dynamic> dataOverview = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      reviews.addAll(await treatmentController.getTreatmentReview(
          context, page, widget.treatmentID));
      dataOverview = await treatmentController.getTreatmentOverview(
          context, widget.treatmentID);
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            reviews.addAll(await treatmentController.getTreatmentReview(
                context, page, widget.treatmentID));
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
              SizedBox(
                width: 11,
              ),
              Row(
                children: [
                  Text(
                    ' Ulasan',
                    style:
                        whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                  Text(
                    ' Sobat Hey',
                    style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const SizedBox(
                width: 11,
              ),
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
          isLoading: treatmentController.isLoading.value,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 27, left: 26, right: 26),
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
                      height: 14,
                    ),
                  ],
                ),
              ),
              dividergrey(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 26, top: 9, right: 26),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: Text(
                            'Dengan Foto',
                            style: blackRegulerTextStyle.copyWith(fontSize: 15),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          customeshomodal(context, RatingDenganUlasanWidgets());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            children: [
                              Center(
                                child: Text(
                                  'Rating',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          customeshomodal(
                            context,
                            const TopikUlasanWidgets(),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            children: [
                              Center(
                                child: Text(
                                  'Topik Ulasan',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(25),
                                topStart: Radius.circular(25),
                              ),
                            ),
                            builder: (context) => Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 33, right: 33, top: 30, bottom: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/danger-icons.png',
                                            width: 12,
                                          ),
                                          const SizedBox(
                                            width: 22,
                                          ),
                                          Text(
                                            'Topik Ulasan',
                                            style: blackHigtTextStyle.copyWith(
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 39,
                                      ),
                                      const FilterTapTreatment(
                                        title: 'Paling Membantu',
                                      ),
                                      const FilterTapTreatment(
                                        title: 'Terbaru',
                                      ),
                                      const FilterTapTreatment(
                                        title: 'Rating Tertinggi',
                                      ),
                                      const FilterTapTreatment(
                                        title: 'Rating Terendah',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            children: [
                              Center(
                                child: Text(
                                  'Urutan',
                                  style: blackRegulerTextStyle.copyWith(
                                      fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ComentUlasanaCustomer(
                namaUser: 'Singa',
                namaProduk: 'Teenderm Gel 40ml',
                bulan: '',
                comentUser:
                    'Aku suka banggeeeettt sama cleanser Isispharma ini.Nggak bikin muka aku ketarik dan bikin calming bangeet.Recommended deh! makasih dok, sudah rekomendasiinaku produk ini. Luvvv sekeboooonnn!',
                balasanComent: 'Saran Beli Obat Kuat',
                imgUser: 'assets/images/doctor-img.png',
                like: '100',
                namaBalasan: 'Udin',
              ),
              ComentUlasanaCustomer(
                namaUser: 'Singa',
                namaProduk: 'Teenderm Gel 40ml',
                bulan: '',
                comentUser:
                    'Aku suka banggeeeettt sama cleanser Isispharma ini.Nggak bikin muka aku ketarik dan bikin calming bangeet.Recommended deh! makasih dok, sudah rekomendasiinaku produk ini. Luvvv sekeboooonnn!',
                balasanComent: 'Saran Beli Obat Kuat',
                imgUser: 'assets/images/doctor-img.png',
                like: '100',
                comentImg: 'assets/images/treat1.png',
                namaBalasan: 'Udin',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 50,
          width: 50,
          child: FloatingActionButton(
              onPressed: () {}, child: Image.asset('assets/icons/dowload.png')),
        ),
      ),
    );
  }

  Padding comentbalasan() {
    return Padding(
      padding: lsymetric.copyWith(bottom: 10),
      child: Column(
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
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
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
          Row(
            children: [
              Image.asset(
                'assets/icons/like.png',
                width: 15,
                color: greenColor,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                '6 orang terbantu',
                style:
                    grenTextStyle.copyWith(fontSize: 13, fontWeight: regular),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    isVisibelity = !isVisibelity;
                  });
                },
                child: Row(
                  children: [
                    isVisibelity
                        ? Text(
                            'Liat Balesan',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          )
                        : Text(
                            'Tutup Balasan',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff6B6B6B),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
            visible: isVisibelity,
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 2,
                  decoration: BoxDecoration(color: greenColor),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Klinik Utama Lithea',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 13, color: subTitleColor),
                          ),
                          Text(
                            ' 1 bulan lalu',
                            style: blackRegulerTextStyle.copyWith(
                                color: subTitleColor, fontSize: 13),
                          )
                        ],
                      ),
                      Text(
                        'Terima kasih telah melakukan perawatan di Klinik Utama Lithea. Ditunggu kedatangan selanjutnya yaa kak :) ',
                        style: subTitleTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
