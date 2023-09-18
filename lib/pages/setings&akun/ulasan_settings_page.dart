// ignore_for_file: invalid_use_of_protected_member, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/detail_ulasan_produk_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasam_konsultasi.dart';
import 'package:heystetik_mobileapps/models/customer/waiting_review_model.dart'
    as Waiting;
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart'
    as Finished;
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_treatment.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/ulasan_riwayat_widgets.dart';
import '../../widget/ulasan_widgets.dart';
import 'detail_ulasan_page.dart';
import 'package:timeago/timeago.dart' as timeago;

class UlasanSetingsPage extends StatefulWidget {
  const UlasanSetingsPage({super.key});

  @override
  State<UlasanSetingsPage> createState() => _UlasanSetingsPageState();
}

class _UlasanSetingsPageState extends State<UlasanSetingsPage> {
  final ReviewController state = Get.put(ReviewController());
  @override
  void initState() {
    super.initState();
    state.dataWaiting.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          titleSpacing: 0,
          iconTheme: iconthemeblack(),
          backgroundColor: whiteColor,
          title: Text(
            'Ulasan',
            style: blackTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  labelColor: greenColor,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  unselectedLabelColor: subTitleColor,
                  labelStyle: blackHigtTextStyle.copyWith(
                    fontSize: 15,
                    color: const Color(0XFF9B9B9B),
                  ),
                  indicator: BoxDecoration(
                    border: Border.all(
                      color: greenColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  tabs: [
                    Obx(
                      () => Tab(
                        text:
                            'Menunggu diulas (${state.dataWaiting.value.length})',
                      ),
                    ),
                    Tab(
                      text: 'Riwayat',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            dividergreen(),
            Expanded(
              child: TabBarView(
                children: [
                  MenungguUlasan(),
                  RiwayatUlasan(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RiwayatUlasan extends StatefulWidget {
  const RiwayatUlasan({
    super.key,
  });

  @override
  State<RiwayatUlasan> createState() => _RiwayatUlasanState();
}

class _RiwayatUlasanState extends State<RiwayatUlasan> {
  final ReviewController state = Get.put(ReviewController());

  final ScrollController scrollController = ScrollController();

  List<Finished.Data2> finishedReview = [];

  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      finishedReview.addAll(await state.finishedReview(context, page));
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            finishedReview.addAll(await state.finishedReview(context, page));
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
    return Obx(
      () => LoadingWidget(
        isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
        child: finishedReview.isEmpty
            ? Center(
                child: Text(
                  'Belum ada data',
                  style: TextStyle(
                    fontWeight: bold,
                    fontFamily: 'ProximaNova',
                    fontSize: 20,
                  ),
                ),
              )
            : SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: finishedReview.length,
                      itemBuilder: (BuildContext context, index) {
                        if (finishedReview[index].transactionType ==
                            'CONSULTATION') {
                          return TextUlasanRiwayat(
                            onPressed: () {
                              Get.to(DetailPageUlasanKonsultasi(
                                data: finishedReview[index],
                              ));
                            },
                            nameBrand: finishedReview[index]
                                    .detail
                                    ?.consultation
                                    ?.doctor
                                    ?.fullname ??
                                '-',
                            nameProduk: finishedReview[index]
                                    .detail!
                                    .consultation
                                    ?.medicalHistory
                                    ?.interestCondition
                                    ?.name ??
                                '-',
                            waktu: timeago.format(DateTime.parse(
                                finishedReview[index].createdAt.toString())),
                            coment: finishedReview[index]
                                    .detail
                                    ?.consultationReview
                                    ?.review ??
                                '-',
                            rating: finishedReview[index]
                                .detail!
                                .consultationReview!
                                .rating!
                                .toInt(),
                          );
                        }
                        if (finishedReview[index].transactionType ==
                            'TREATMENT') {
                          return TextUlasanRiwayat(
                            onPressed: () {
                              Get.to(DetailPageUlasanTreatment(
                                data: finishedReview[index],
                              ));
                            },
                            nameBrand:
                                finishedReview[index].detail?.treatment?.name ??
                                    '-',
                            nameProduk: finishedReview[index]
                                    .detail
                                    ?.treatment
                                    ?.clinic
                                    ?.name ??
                                '-',
                            waktu: timeago.format(DateTime.parse(
                                finishedReview[index].createdAt.toString())),
                            coment: finishedReview[index]
                                    .detail
                                    ?.treatmentReview
                                    ?.review ??
                                '-',
                            rating: finishedReview[index]
                                    .detail
                                    ?.treatmentReview
                                    ?.avgRating
                                    ?.toInt() ??
                                0,
                            balasan:
                                '${finishedReview[index].detail?.treatmentReview?.replyReview ?? 0} balasan',
                          );
                        }
                        if (finishedReview[index].transactionType ==
                            'PRODUCT') {
                          return TextUlasanRiwayat(
                            onPressed: () {
                              Get.to(DetailSkinUlasanProduk(
                                data: finishedReview[index],
                              ));
                            },
                            nameBrand:
                                finishedReview[index].detail?.product?.name ??
                                    '-',
                            nameProduk:
                                finishedReview[index].detail?.product?.type ??
                                    '-',
                            waktu: timeago.format(DateTime.parse(
                                finishedReview[index].createdAt.toString())),
                            coment: finishedReview[index]
                                    .detail
                                    ?.productReview
                                    ?.review ??
                                '-',
                            rating: finishedReview[index]
                                    .detail
                                    ?.productReview
                                    ?.avgRating
                                    ?.toInt() ??
                                0,
                            balasan:
                                '${finishedReview[index].detail?.treatmentReview?.replyReview ?? 0} balasan',
                          );
                        }
                        return null;
                      },
                    ),
                    Obx(
                      () => state.isLoading.value ? LoadingMore() : Container(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class MenungguUlasan extends StatefulWidget {
  const MenungguUlasan({super.key});

  @override
  State<MenungguUlasan> createState() => _MenungguUlasanState();
}

class _MenungguUlasanState extends State<MenungguUlasan> {
  final ReviewController state = Get.put(ReviewController());

  final ScrollController scrollController = ScrollController();

  List<Waiting.Data2> waitingReview = [];

  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      waitingReview.addAll(await state.waitingReview(context, page));
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            waitingReview.addAll(await state.waitingReview(context, page));
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: waitingReview.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada data',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: waitingReview.length,
                        itemBuilder: (BuildContext context, index) {
                          if (waitingReview[index].transactionType ==
                              'CONSULTATION') {
                            return UlasanKonsultasi(
                              onPressed: () {
                                Get.to(TulisUlasanKonsultasi(
                                  transactionConsultationId:
                                      waitingReview[index]
                                          .transactionId
                                          .toString(),
                                  img:
                                      '${Global.FILE}/${waitingReview[index].detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                                  doctor: waitingReview[index]
                                          .detail
                                          ?.consultation!
                                          .doctor
                                          ?.fullname ??
                                      '-',
                                  interest: waitingReview[index]
                                          .detail
                                          ?.consultation!
                                          .medicalHistory
                                          ?.interestCondition
                                          ?.name ??
                                      '-',
                                ));
                              },
                              nameProduk: waitingReview[index]
                                      .detail
                                      ?.consultation!
                                      .doctor
                                      ?.fullname ??
                                  '-',
                              tanggal: ConvertDate.defaultDate(
                                  waitingReview[index].createdAt ?? '-'),
                              // titleButton: 'Beli Lagi',
                              img: waitingReview[index].detail?.consultation ==
                                      null
                                  ? '-'
                                  : '${Global.FILE}/${waitingReview[index].detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                              namabrand: waitingReview[index]
                                      .detail
                                      ?.consultation!
                                      .medicalHistory
                                      ?.interestCondition
                                      ?.name ??
                                  '-',
                            );
                          }
                          if (waitingReview[index].transactionType ==
                              'TREATMENT') {
                            return UlasanTreatment(
                              onPressed: () {
                                Get.to(
                                  TulisUlasanTreament(
                                    transactionTreatmentId: waitingReview[index]
                                        .transactionId
                                        .toString(),
                                    transactionTreatmentItemIid:
                                        waitingReview[index]
                                            .detail!
                                            .id
                                            .toString(),
                                    img:
                                        "${Global.FILE}/${waitingReview[index].detail?.treatment?.mediaTreatments![0].media?.path}",
                                    treatment: waitingReview[index]
                                            .detail
                                            ?.treatment
                                            ?.name ??
                                        '-',
                                    clinic: waitingReview[index]
                                            .detail
                                            ?.treatment
                                            ?.clinic
                                            ?.name ??
                                        '-',
                                  ),
                                );
                              },
                              item: waitingReview[index]
                                  .detail
                                  ?.treatment
                                  ?.mediaTreatments,
                              nameProduk: waitingReview[index]
                                      .detail
                                      ?.treatment
                                      ?.name ??
                                  '-',
                              tanggal: ConvertDate.defaultDate(
                                  waitingReview[index].createdAt ?? '-'),
                              // titleButton: 'Beli Lagi',
                              // img: 'assets/images/penting1.png',
                              klinik: waitingReview[index]
                                      .detail
                                      ?.treatment
                                      ?.clinic
                                      ?.name ??
                                  '-',
                            );
                          }
                          if (waitingReview[index].transactionType ==
                              'PRODUCT') {
                            return UlasanProduk(
                              data: waitingReview[index].detail,
                            );
                          }
                        },
                      ),
                      Obx(
                        () =>
                            state.isLoading.value ? LoadingMore() : Container(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
