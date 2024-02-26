// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/skincare_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/fikter_card_solusions_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/widget/topik_ulasan_widgets.dart';
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;
import '../../widget/filter_tap_widget.dart';
import '../../widget/rating_dengan_ulasan_widgets.dart';
import '../../widget/share_solusion_widget_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class UlasanProdukPage extends StatefulWidget {
  int productId;
  UlasanProdukPage({required this.productId, super.key});

  @override
  State<UlasanProdukPage> createState() => _UlasanProdukPageState();
}

class _UlasanProdukPageState extends State<UlasanProdukPage> {
  ScrollController scrollController = ScrollController();
  final SkincareController state = Get.put(SkincareController());
  List<ProductReviewModel.Data2> reviews = [];
  bool isVisibelity = false;
  int page = 1;
  int take = 10;
  bool? help;
  Map<String, int> helpReview = {};
  Map<String, dynamic> filter = {};
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.getOverviewProduct(context, widget.productId);
      reviews.addAll(await state.getReviewProduct(
          context, page, take, widget.productId,
          filter: filter));
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            reviews.addAll(await state.getReviewProduct(
                context, page, take, widget.productId,
                filter: filter));
            setState(() {});
            state.isLoadingMore.value = false;
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
          isLoading: state.isLoadingMore.value
              ? false
              : state.isLoadingProductReviewSkincare.value,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
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
                          Obx(
                            () => Text(
                              '${state.overviewSkincare.value.avgRating ?? 0.0}',
                              style: blackHigtTextStyle.copyWith(fontSize: 30),
                            ),
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
                                  Obx(
                                    () => Text(
                                      '${state.overviewSkincare.value.satisfiedPercentage ?? 0}% Sobat Hey',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Text(
                                    ' merasa puas',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 12),
                                  ),
                                  const Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Text(
                                      '${state.overviewSkincare.value.totalRating ?? 0} rating',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
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
                                  Obx(
                                    () => Text(
                                      '${state.overviewSkincare.value.totalReview ?? 0} ulasan',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12, fontWeight: regular),
                                    ),
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
                                  Obx(
                                    () => Text(
                                      '${state.overviewSkincare.value.avgEffectivenessRating ?? 0}',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Effectiveness',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 10, fontWeight: regular),
                                      ),
                                      Obx(
                                        () => Text(
                                          '${state.overviewSkincare.value.countEffectivenessRating ?? 0} ulasan',
                                          style: subTitleTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: regular),
                                        ),
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
                                  Obx(
                                    () => Text(
                                      '${state.overviewSkincare.value.avgTextureRating ?? 0}',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Texture',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 10, fontWeight: regular),
                                      ),
                                      Obx(
                                        () => Text(
                                          '${state.overviewSkincare.value.countTextureRating ?? 0} ulasan',
                                          style: subTitleTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: regular),
                                        ),
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
                                  Obx(
                                    () => Text(
                                      '${state.overviewSkincare.value.avgPackagingRating ?? 0}',
                                      style: blackHigtTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Packaging',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 10, fontWeight: regular),
                                      ),
                                      Obx(
                                        () => Text(
                                          '${state.overviewSkincare.value.countPackagingRating ?? 0} ulasan',
                                          style: subTitleTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: regular),
                                        ),
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
                        FiklterTreatment(
                          title: 'Dengan Foto',
                          onTap: () async {
                            if (filter.containsKey("has_photo")) {
                              filter['has_photo'] = false;
                              page = 1;
                              reviews.clear();
                              reviews.addAll(await state.getReviewProduct(
                                  context, page, 10, widget.productId,
                                  filter: filter));
                              setState(() {});
                            } else {
                              filter['has_photo'] = true;
                              page = 1;
                              reviews.clear();
                              reviews.addAll(await state.getReviewProduct(
                                  context, page, 10, widget.productId,
                                  filter: filter));
                              setState(() {});
                            }
                          },
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            customeModal(context, RatingDenganUlasanWidgets())
                                .then((value) async {
                              filter['rating[]'] = value ?? [];
                              page = 1;
                              reviews.clear();
                              reviews.addAll(await state.getReviewProduct(
                                  context, page, 10, widget.productId,
                                  filter: filter));
                              setState(() {});
                            });
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
                            customeModal(
                              context,
                              const TopikUlasanProdukWidgets(),
                            ).then((value) async {
                              filter['topic[]'] = value ?? [];
                              page = 1;
                              reviews.clear();
                              reviews.addAll(await state.getReviewProduct(
                                  context, page, 10, widget.productId,
                                  filter: filter));
                              setState(() {});
                            });
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
                                        left: 33,
                                        right: 33,
                                        top: 30,
                                        bottom: 40),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Image.asset(
                                                'assets/icons/danger-icons.png',
                                                width: 12,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 22,
                                            ),
                                            Text(
                                              'Urutkan Berdasarkan',
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 39,
                                        ),
                                        FilterTapTreatment(
                                          title: 'Paling Membantu',
                                          onTap: () async {
                                            filter['sorting_type'] =
                                                'PALING_MEMBANTU';
                                            page = 1;
                                            reviews.clear();
                                            reviews.addAll(
                                                await state.getReviewProduct(
                                                    context,
                                                    page,
                                                    10,
                                                    widget.productId,
                                                    filter: filter));
                                            setState(() {});
                                          },
                                        ),
                                        FilterTapTreatment(
                                          title: 'Terbaru',
                                          onTap: () async {
                                            filter['sorting_type'] = 'TERBARU';
                                            page = 1;
                                            reviews.clear();
                                            reviews.addAll(
                                                await state.getReviewProduct(
                                                    context,
                                                    page,
                                                    10,
                                                    widget.productId,
                                                    filter: filter));
                                            setState(() {});
                                          },
                                        ),
                                        FilterTapTreatment(
                                          title: 'Rating Tertinggi',
                                          onTap: () async {
                                            filter['sorting_type'] =
                                                'RATING_TERTINGGI';
                                            page = 1;
                                            reviews.clear();
                                            reviews.addAll(
                                                await state.getReviewProduct(
                                                    context,
                                                    page,
                                                    10,
                                                    widget.productId,
                                                    filter: filter));
                                            setState(() {});
                                          },
                                        ),
                                        FilterTapTreatment(
                                          title: 'Rating Terendah',
                                          onTap: () async {
                                            filter['sorting_type'] =
                                                'RATING_TERENDAH';
                                            page = 1;
                                            reviews.clear();
                                            reviews.addAll(
                                                await state.getReviewProduct(
                                                    context,
                                                    page,
                                                    10,
                                                    widget.productId,
                                                    filter: filter));
                                            setState(() {});
                                          },
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
                Padding(
                  padding: const EdgeInsets.only(top: 27, left: 26, right: 26),
                  child: reviews.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada ulasan',
                            style: TextStyle(
                              fontWeight: bold,
                              fontFamily: 'ProximaNova',
                              fontSize: 20,
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
                                          element.transactionProductItem
                                                  ?.product?.type ??
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
                                Text(
                                  'Before',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: element
                                      .mediaBeforeConditionProductReviews!
                                      .map((e) {
                                    return Container(
                                      height: 72,
                                      width: 82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Image.network(
                                        '${Global.FILE}/${e.media!.path.toString()}',
                                        width: 72,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  'After',
                                  style:
                                      blackHigtTextStyle.copyWith(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: element
                                      .mediaAfterConditionProductReviews!
                                      .map((e) {
                                    return Container(
                                      height: 72,
                                      width: 82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
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
                                          state.unHelped(context, element.id!);
                                          setState(() {
                                            help = false;
                                            helpReview["${element.id}"] =
                                                (helpReview["${element.id}"] ??
                                                        0) -
                                                    1;
                                          });
                                        } else {
                                          state.helped(context, element.id!);
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
                                      '${element.cCount!.productReviewHelpfuls! + (helpReview["${element.id}"] ?? 0)} orang terbantu',
                                      style: greyTextStyle.copyWith(
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
                                                          color: subTitleColor),
                                                ),
                                                Text(
                                                  timeago.format(DateTime.parse(
                                                      element.createdAt
                                                          .toString())),
                                                  style: blackRegulerTextStyle
                                                      .copyWith(
                                                          color: subTitleColor,
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
                ),
                Obx(
                  () => state.isLoadingProductReviewSkincare.value
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: LoadingMore(),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 50,
          width: 50,
          child: FloatingActionButton(
              onPressed: () {
                if (scrollController.hasClients) {
                  final position = scrollController.position.minScrollExtent;
                  scrollController.animateTo(
                    position,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeOut,
                  );
                }
              },
              isExtended: true,
              child: Image.asset('assets/icons/dowload.png')),
        ),
      ),
    );
  }
}
