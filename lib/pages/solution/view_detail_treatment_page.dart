// ignore_for_file: use_build_context_synchronously, must_be_immutable, await_only_futures

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi_page.dart';
import 'package:heystetik_mobileapps/pages/solution/ulasan_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_klinik_page.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/customer/treatment/treatment_controller.dart';
import '../../models/treatment_review_model.dart' as TreatmentReview;
import '../../widget/loading_widget.dart';
import '../../widget/produk_widget.dart';
import '../../widget/text_form_widget.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailTreatmentPage extends StatefulWidget {
  int treatmentId;
  DetailTreatmentPage({
    super.key,
    required this.treatmentId,
  });

  @override
  State<DetailTreatmentPage> createState() => _DetailTreatmentPageState();
}

class _DetailTreatmentPageState extends State<DetailTreatmentPage> {
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
  bool isVisibelity = false;
  Map<String, dynamic> dataOverview = {};
  List<Data2> treatments = [];
  List<TreatmentReview.Data2> reviews = [];
  bool? help;
  Map<String, int> helpReview = {};
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await stateTreatment.getTreatmentDetail(
        context,
        widget.treatmentId,
      );
      treatments.addAll(await stateTreatment.getTreatmentFromSameClinic(
        context,
        page,
        stateTreatment.treatmentDetail.value.clinicId!,
      ));
      reviews.addAll(await stateTreatment.getTreatmentReview(
        context,
        page,
        3,
        widget.treatmentId,
      ));
      dataOverview = await stateTreatment.getTreatmentOverview(
        context,
        widget.treatmentId,
      );
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            treatments.addAll(await stateTreatment.getTreatmentFromSameClinic(
              context,
              page,
              stateTreatment.treatmentDetail.value.clinicId!,
            ));
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  _whatsapp() async {
    var contact = "+6281287639838";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      SnackbarWidget.getErrorSnackbar(
        context,
        'Info',
        'WhatsApp is not installed.',
      );
    }
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
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        backgroundColor: greenColor,
        actions: [
          Obx(
            () => InkWell(
              onTap: () {
                if (isFavourite ??
                    stateTreatment.treatmentDetail.value.wishlist!) {
                  stateTreatment.deleteWishlistTreatment(
                    context,
                    widget.treatmentId,
                  );

                  setState(() {
                    isFavourite = false;
                  });
                } else {
                  stateTreatment.addWishlistTreatment(
                    context,
                    widget.treatmentId,
                  );

                  setState(() {
                    isFavourite = true;
                  });
                }
              },
              child: (isFavourite == null
                          ? (stateTreatment.treatmentDetail.value.wishlist ??
                              false)
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
            onTap: () async {
              Uri? url = await createDynamicLinkTreatment(widget.treatmentId);
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
              //   builder: (context) => ShareShowWidget(),
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
          isLoading: stateTreatment.isLoading.value,
          child: ListView(
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: stateTreatment
                            .treatmentDetail.value.mediaTreatments?.length ??
                        0,
                    itemBuilder: (context, index, realIndex) {
                      final imge = stateTreatment.treatmentDetail.value
                          .mediaTreatments![index].media!.path!;

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
                      count: stateTreatment
                              .treatmentDetail.value.mediaTreatments?.length ??
                          0,
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
                          width: 13,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stateTreatment
                                  .treatmentDetail.value.clinic!.name!,
                              style: blackHigtTextStyle.copyWith(fontSize: 20),
                            ),
                            Text(
                              stateTreatment
                                  .treatmentDetail.value.clinic!.city!.name!,
                              style: subTitleTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Spacer(),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              Get.to(() => DetailKlinikPage(
                                    clinicId: stateTreatment
                                        .treatmentDetail.value.clinicId!
                                        .toInt(),
                                  ));
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: greenColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Text(
                      stateTreatment.treatmentDetail.value.name!,
                      style: blackTextStyle.copyWith(
                          fontWeight: medium, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      stateTreatment.treatmentDetail.value.description!,
                      style: TextStyle(color: subTitleColor, fontSize: 12),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(
                        stateTreatment.treatmentDetail.value.price,
                        0,
                      ),
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
                            treatmentData: stateTreatment.treatmentDetail.value,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () async {
                        await _whatsapp();
                      },
                      child: const TextFromPerawat(
                        title: 'Jadwal Ulang Perawatan',
                      ),
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
                                builder: (context) => UlasanTreatmentPage(
                                  treatmentID: widget.treatmentId,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Lihat Semua',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reviews.isEmpty
                        ? Center(
                            child: Text(
                              'Belum ada ulasan',
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 15,
                              ),
                            ),
                          )
                        : Column(
                            children: reviews.map((element) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            element.user?.fullname ?? '-',
                                            style: blackHigtTextStyle.copyWith(
                                                fontSize: 15),
                                          ),
                                          Text(
                                            element.transactionTreatmentItem
                                                    ?.treatment!.name ??
                                                '-',
                                            style: blackHigtTextStyle.copyWith(
                                                fontSize: 13,
                                                fontWeight: regular),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(5, (index) {
                                          return Image.asset(
                                            'assets/icons/stars-new.png',
                                            width: 12,
                                            color: element.avgRating! > index
                                                ? const Color(0xffFFC36A)
                                                : Color.fromRGBO(
                                                    155, 155, 155, 0.61),
                                          );
                                        }),
                                      ),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      Text(
                                        timeago.format(DateTime.parse(
                                            element.createdAt.toString())),
                                        style: blackHigtTextStyle.copyWith(
                                            fontSize: 12, fontWeight: regular),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  Text(
                                    element.review ?? '-',
                                    style: greyTextStyle.copyWith(
                                        fontSize: 13,
                                        color: const Color(0xff6B6B6B)),
                                  ),
                                  const SizedBox(
                                    height: 13,
                                  ),
                                  Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children:
                                        element.mediaTreatmentReviews!.map((e) {
                                      return Container(
                                        height: 72,
                                        width: 82,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Image.network(
                                          '${Global.FILE}/${e.media!.path.toString()}',
                                          width: 72,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          print("help");

                                          if (help ?? element.helped!) {
                                            stateTreatment.unHelped(
                                                context, element.id!);
                                            setState(() {
                                              help = false;
                                              helpReview["${element.id}"] =
                                                  (helpReview["${element.id}"] ??
                                                          0) -
                                                      1;
                                            });
                                          } else {
                                            stateTreatment.helped(
                                                context, element.id!);
                                            setState(() {
                                              help = true;
                                              helpReview["${element.id}"] =
                                                  (helpReview["${element.id}"] ??
                                                          0) +
                                                      1;
                                            });
                                          }
                                        },
                                        child: Image.asset(
                                          'assets/icons/like.png',
                                          width: 15,
                                          color: help ?? element.helped!
                                              ? greenColor
                                              : greyColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        '${element.cCount!.treatmentReviewHelpfuls! + (helpReview["${element.id}"] ?? 0)} orang terbantu',
                                        style: grenTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: regular,
                                          color: help ?? element.helped!
                                              ? greenColor
                                              : greyColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      element.replyReview == null
                                          ? Container()
                                          : InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isVisibelity = !isVisibelity;
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  isVisibelity
                                                      ? Text(
                                                          'Lihat Balasan',
                                                          style:
                                                              blackRegulerTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13),
                                                        )
                                                      : Text(
                                                          'Tutup Balasan',
                                                          style:
                                                              blackRegulerTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13),
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
                                          decoration:
                                              BoxDecoration(color: greenColor),
                                        ),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Penjual ',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                            fontSize: 13,
                                                            color:
                                                                subTitleColor),
                                                  ),
                                                  Text(
                                                    timeago.format(
                                                        DateTime.parse(element
                                                            .createdAt
                                                            .toString())),
                                                    style: blackRegulerTextStyle
                                                        .copyWith(
                                                            color:
                                                                subTitleColor,
                                                            fontSize: 13),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                element.replyReview ?? '',
                                                style: subTitleTextStyle,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }).toList(),
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
                  'Perawatan lain di ${stateTreatment.treatmentDetail.value.clinic!.name!}',
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
                          treatmentData: treatments[index],
                          namaKlinik: treatments[index].clinic!.name!,
                          namaTreatmen: treatments[index].name!,
                          diskonProduk: '0',
                          hargaDiskon: '0',
                          harga: treatments[index].price.toString(),
                          urlImg: treatments[index].mediaTreatments!.isEmpty
                              ? ""
                              : "${Global.FILE}/${treatments[index].mediaTreatments![0].media!.path}",
                          rating: "${treatments[index].rating} (0k)",
                          km: '${treatments[index].distance ?? '0'} km',
                          lokasiKlinik: treatments[index].clinic!.city!.name!,
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
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 11, top: 11),
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
                            treatment: stateTreatment.treatmentDetail.value,
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
    );
  }
}

Widget buildImage(String images, int index) => Image.network(
      "${Global.FILE}/$images",
      fit: BoxFit.cover,
    );
