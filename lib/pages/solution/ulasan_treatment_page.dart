// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/ulasan_treatment_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_ontap_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_rating_ulasan_treatment_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_topik_ulasan_treatment_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_urutan_ulasan_treatment_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:social_share/social_share.dart';
import '../../models/treatment_review_model.dart' as TreatmentReview;
import 'package:timeago/timeago.dart' as timeago;

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
  final UlasanTreatmentController stateUlasan =
      Get.put(UlasanTreatmentController());
  bool? isFavourite;
  int page = 1;
  List<TreatmentReview.Data2> reviews = [];
  bool isVisibelity = false;
  Map<String, dynamic> dataOverview = {};
  Map<String, dynamic> filter = {};
  bool? help;
  Map<String, int> helpReview = {};
  int? filterRating;
  String? filterTopik;
  String? filterUrutan;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      dataOverview = await stateUlasan.getTreatmentOverview(
        context,
        widget.treatmentID,
      );
      reviews.addAll(
        await stateUlasan.getTreatmentReview(
          context,
          page,
          10,
          widget.treatmentID,
          filter: filter,
        ),
      );

      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            stateUlasan.isLoadingMore.value = true;
            reviews.addAll(
              await stateUlasan.getTreatmentReview(
                context,
                page,
                10,
                widget.treatmentID,
                filter: filter,
              ),
            );
            setState(() {});
            stateUlasan.isLoadingMore.value = false;
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
                    'Ulasan',
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
          InkWell(
            onTap: () async {
              Uri? url = await createDynamicLinkTreatment(widget.treatmentID);
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
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
                                    fontSize: 12, fontStyle: FontStyle.italic),
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
                            border: Border.all(color: const Color(0xffCCCCCC)),
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
                            border: Border.all(color: const Color(0xffCCCCCC)),
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
                            border: Border.all(color: const Color(0xffCCCCCC)),
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
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Row(
                  children: [
                    if (filter.isNotEmpty)
                      InkWell(
                        onTap: () async {
                          filterRating = null;
                          filterTopik = null;
                          filterUrutan = null;
                          filter.clear();
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await stateUlasan.getTreatmentReview(
                              context,
                              page,
                              10,
                              widget.treatmentID,
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
                    filterOnTapWidget(
                      title: 'Dengan Foto',
                      isSelected: filter['has_photo'] == true,
                      onTap: () async {
                        if (filter['has_photo'] == true) {
                          filter.remove('has_photo');
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await stateUlasan.getTreatmentReview(
                              context,
                              page,
                              10,
                              widget.treatmentID,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        } else {
                          filter['has_photo'] = true;
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await stateUlasan.getTreatmentReview(
                              context,
                              page,
                              10,
                              widget.treatmentID,
                              filter: filter,
                            ),
                          );
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        customeModal(
                                context,
                                FilterRatingUlasanTreatmentWidget(
                                    val: filterRating))
                            .then((value) async {
                          if (value == null) return;
                          filterRating = value;
                          filter['rating[]'] = value.toString();
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await stateUlasan.getTreatmentReview(
                              context,
                              page,
                              10,
                              widget.treatmentID,
                              filter: filter,
                            ),
                          );
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
                              color: (filterRating is int)
                                  ? greenColor
                                  : borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            if ((filterRating is int))
                              SvgPicture.asset('assets/icons/stars.svg'),
                            if ((filterRating is int))
                              const SizedBox(
                                width: 10,
                              ),
                            Center(
                              child: Text(
                                (filterRating is int)
                                    ? filterRating.toString()
                                    : 'Rating',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15,
                                  color:
                                      (filterRating is int) ? greenColor : null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: (filterRating is int) ? greenColor : null,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customeModal(
                                context,
                                FilterTopikUlasanTreatmentWidget(
                                    val: filterTopik))
                            .then((value) async {
                          if (value == null) return;
                          filterTopik = value;
                          filter['topic[]'] = value.toString().toUpperCase();
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await stateUlasan.getTreatmentReview(
                              context,
                              page,
                              10,
                              widget.treatmentID,
                              filter: filter,
                            ),
                          );
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
                              color: (filterTopik is String)
                                  ? greenColor
                                  : borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                filterTopik ?? 'Topik Ulasan',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15,
                                  color: (filterTopik is String)
                                      ? greenColor
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color:
                                  (filterTopik is String) ? greenColor : null,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        customeModal(
                                context,
                                FilterUrutanUlasanTreatmentWidget(
                                    val: filterUrutan))
                            .then((value) async {
                          if (value == null) return;
                          filterUrutan = value;
                          filter['sorting_type'] = value
                              .toString()
                              .toUpperCase()
                              .replaceAll(' ', '_');
                          page = 1;
                          reviews.clear();
                          setState(() {});
                          reviews.addAll(
                            await stateUlasan.getTreatmentReview(
                              context,
                              page,
                              10,
                              widget.treatmentID,
                              filter: filter,
                            ),
                          );
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
                              color: (filterUrutan is String)
                                  ? greenColor
                                  : borderColor,
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Row(
                          children: [
                            Center(
                              child: Text(
                                filterUrutan ?? 'Urutan',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 15,
                                  color: (filterUrutan is String)
                                      ? greenColor
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color:
                                  (filterUrutan is String) ? greenColor : null,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => LoadingWidget(
                isLoading: stateUlasan.isLoadingMore.value
                    ? false
                    : stateUlasan.isLoading.value,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 26, right: 26),
                      child: reviews.isEmpty
                          ? Center(
                              child: Text(
                                'Belum ada ulasan',
                                style: TextStyle(
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
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: element.user
                                                          ?.mediaUserProfilePicture !=
                                                      null
                                                  ? NetworkImage(
                                                      '${Global.FILE}/${element.user?.mediaUserProfilePicture?.media?.path}',
                                                    ) as ImageProvider
                                                  : AssetImage(
                                                      'assets/images/profiledummy.png',
                                                    ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
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
                                              style: blackHigtTextStyle
                                                  .copyWith(fontSize: 15),
                                            ),
                                            Text(
                                              element.transactionTreatmentItem
                                                      ?.treatment?.name ??
                                                  '-',
                                              style:
                                                  blackHigtTextStyle.copyWith(
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
                                              fontSize: 12,
                                              fontWeight: regular),
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
                                      children: element.mediaTreatmentReviews!
                                          .map((e) {
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
                                          onTap: () {
                                            if (help ?? element.helped!) {
                                              stateUlasan.unHelped(
                                                  context, element.id!);
                                              setState(() {
                                                help = false;
                                                helpReview["${element.id}"] =
                                                    (helpReview["${element.id}"] ??
                                                            0) -
                                                        1;
                                              });
                                            } else {
                                              stateUlasan.helped(
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
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/like.png',
                                                width: 15,
                                                color: help ?? element.helped!
                                                    ? greenColor
                                                    : greyColor,
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
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        element.replyReview == null
                                            ? Container()
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isVisibelity =
                                                        !isVisibelity;
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
                                            decoration: BoxDecoration(
                                                color: greenColor),
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
                    ),
                    Obx(
                      () => stateUlasan.isLoading.value
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
          ],
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

  // Padding comentbalasan() {
  //   return Padding(
  //     padding: lsymetric.copyWith(bottom: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const SizedBox(
  //           height: 11,
  //         ),
  //         Row(
  //           children: [
  //             Image.asset(
  //               'assets/images/doctor1.png',
  //               width: 40,
  //             ),
  //             const SizedBox(
  //               width: 12,
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Jessy',
  //                   style: blackHigtTextStyle.copyWith(fontSize: 15),
  //                 ),
  //                 Text(
  //                   'Perawatan Peeling TCA Ringan',
  //                   style: blackHigtTextStyle.copyWith(
  //                       fontSize: 13, fontWeight: regular),
  //                 ),
  //               ],
  //             ),
  //             const Spacer(),
  //             const Icon(Icons.more_vert)
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 13,
  //         ),
  //         Row(
  //           children: [
  //             const Icon(
  //               Icons.star,
  //               size: 12,
  //               color: Color(0xffFFC36A),
  //             ),
  //             const Icon(
  //               Icons.star,
  //               size: 12,
  //               color: Color(0xffFFC36A),
  //             ),
  //             const Icon(
  //               Icons.star,
  //               size: 12,
  //               color: Color(0xffFFC36A),
  //             ),
  //             const Icon(
  //               Icons.star,
  //               size: 12,
  //               color: Color(0xffFFC36A),
  //             ),
  //             const Icon(
  //               Icons.star,
  //               size: 12,
  //               color: Color(0xffFFC36A),
  //             ),
  //             const SizedBox(
  //               width: 12,
  //             ),
  //             Text(
  //               '1 Bulan Yang lalu',
  //               style: blackHigtTextStyle.copyWith(
  //                   fontSize: 12, fontWeight: regular),
  //             )
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 13,
  //         ),
  //         Text(
  //           'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
  //           style: greyTextStyle.copyWith(
  //               fontSize: 13, color: const Color(0xff6B6B6B)),
  //         ),
  //         const SizedBox(
  //           height: 13,
  //         ),
  //         Row(
  //           children: [
  //             Image.asset(
  //               'assets/icons/like.png',
  //               width: 15,
  //               color: greenColor,
  //             ),
  //             const SizedBox(
  //               width: 7,
  //             ),
  //             Text(
  //               '6 orang terbantu',
  //               style:
  //                   grenTextStyle.copyWith(fontSize: 13, fontWeight: regular),
  //             ),
  //             const Spacer(),
  //             InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   isVisibelity = !isVisibelity;
  //                 });
  //               },
  //               child: Row(
  //                 children: [
  //                   isVisibelity
  //                       ? Text(
  //                           'Liat Balesan',
  //                           style: blackRegulerTextStyle.copyWith(fontSize: 13),
  //                         )
  //                       : Text(
  //                           'Tutup Balasan',
  //                           style: blackRegulerTextStyle.copyWith(fontSize: 13),
  //                         ),
  //                   const SizedBox(
  //                     width: 4,
  //                   ),
  //                   const Icon(
  //                     Icons.keyboard_arrow_down,
  //                     color: Color(0xff6B6B6B),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 16,
  //         ),
  //         Visibility(
  //           visible: isVisibelity,
  //           child: Row(
  //             children: [
  //               Container(
  //                 height: 60,
  //                 width: 2,
  //                 decoration: BoxDecoration(color: greenColor),
  //               ),
  //               const SizedBox(
  //                 width: 7,
  //               ),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Text(
  //                           'Klinik Utama Lithea',
  //                           style: blackHigtTextStyle.copyWith(
  //                               fontSize: 13, color: subTitleColor),
  //                         ),
  //                         Text(
  //                           ' 1 bulan lalu',
  //                           style: blackRegulerTextStyle.copyWith(
  //                               color: subTitleColor, fontSize: 13),
  //                         )
  //                       ],
  //                     ),
  //                     Text(
  //                       'Terima kasih telah melakukan perawatan di Klinik Utama Lithea. Ditunggu kedatangan selanjutnya yaa kak :) ',
  //                       style: subTitleTextStyle,
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
