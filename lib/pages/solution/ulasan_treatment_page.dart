// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/ulasan_treatment_controller.dart';
import 'package:heystetik_mobileapps/routes/create_dynamic_link.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_ontap_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_rating_ulasan_treatment_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_topik_ulasan_treatment_widget.dart';
import 'package:heystetik_mobileapps/widget/filter_urutan_ulasan_treatment_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/widget/ulasan_treatment_widget.dart';
import 'package:social_share/social_share.dart';
import '../../models/treatment_review_model.dart' as TreatmentReview;
import 'package:heystetik_mobileapps/models/customer/overview_treatment_model.dart'
    as Overview;

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
  Map<String, dynamic> filter = {};
  Overview.Data? treatmentOverview;
  int? filterRating;
  String? filterTopik;
  String? filterUrutan;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      reviews.addAll(
        await stateUlasan.getTreatmentReview(
          context,
          page,
          10,
          widget.treatmentID,
          filter: filter,
        ),
      );
      treatmentOverview = await stateUlasan.getTreatmentOverview(
        context,
        widget.treatmentID,
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
                        '${treatmentOverview?.avgRating ?? 0.0}',
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
                                '${treatmentOverview?.satisfiedPercentage}% Sobat Hey',
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
                                '${treatmentOverview?.totalRating ?? 0} rating',
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
                                '${treatmentOverview?.totalReview ?? 0} ulasan',
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
                                '${treatmentOverview?.avgCareRating ?? 0}',
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
                                    '${treatmentOverview?.countCareRating ?? 0} ulasan',
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
                                '${treatmentOverview?.avgServiceRating ?? 0}',
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
                                    '${treatmentOverview?.countServiceRating ?? 0} ulasan',
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
                                '${treatmentOverview?.avgManagementRating ?? 0}',
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
                                    '${treatmentOverview?.countManagementRating ?? 0} ulasan',
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
                              children: reviews.asMap().entries.map((element) {
                                return UlasanTreatmentWidget(
                                  element: element.value,
                                  isEnd: reviews.length == (element.key + 1),
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
}
