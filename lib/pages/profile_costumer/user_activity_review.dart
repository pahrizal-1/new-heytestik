// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/detail_ulasan_produk_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../controller/customer/account/profile_controller.dart';
import '../../widget/ulasan_riwayat_widgets.dart';
import '../setings&akun/detail_ulasan_page.dart';

class UserActivityReview extends StatefulWidget {
  const UserActivityReview({
    super.key,
  });

  @override
  State<UserActivityReview> createState() => _UserActivityReviewState();
}

class _UserActivityReviewState extends State<UserActivityReview> {
  final ProfileController state = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.reviews.value.addAll(
        await state.getUserActivityReview(
          context,
          state.page.value,
        ),
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: state.reviews.value.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada data',
                     style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 20,
                                ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.reviews.value.length,
                          itemBuilder: (BuildContext context, index) {
                            if (state.reviews.value[index].transactionType ==
                                'CONSULTATION') {
                              return TextUlasanRiwayat(
                                onPressed: () {
                                  Get.to(() => DetailPageUlasanKonsultasi(
                                        data: state.reviews.value[index],
                                      ));
                                },
                                nameBrand: state.reviews.value[index].detail
                                        ?.consultation?.doctor?.fullname ??
                                    '-',
                                nameProduk: state
                                        .reviews
                                        .value[index]
                                        .detail
                                        ?.medicalHistory
                                        ?.interestCondition
                                        ?.concern
                                        ?.name ??
                                    '-',
                                waktu: timeago.format(DateTime.parse(state
                                    .reviews.value[index].createdAt
                                    .toString())),
                                coment: state.reviews.value[index].detail
                                        ?.consultationReview?.review ??
                                    '-',
                                rating: state.reviews.value[index].detail!
                                    .consultationReview!.rating!
                                    .toInt(),
                              );
                            }
                            if (state.reviews.value[index].transactionType ==
                                'TREATMENT') {
                              return TextUlasanRiwayat(
                                onPressed: () {
                                  Get.to(() => DetailPageUlasanTreatment(
                                        data: state.reviews.value[index],
                                      ));
                                },
                                nameBrand: state.reviews.value[index].detail
                                        ?.treatment?.name ??
                                    '-',
                                nameProduk: state.reviews.value[index].detail
                                        ?.treatment?.clinic?.name ??
                                    '-',
                                waktu: timeago.format(DateTime.parse(state
                                    .reviews.value[index].createdAt
                                    .toString())),
                                coment: state.reviews.value[index].detail
                                        ?.treatmentReview?.review ??
                                    '-',
                                rating: state.reviews.value[index].detail
                                        ?.treatmentReview?.avgRating
                                        ?.toInt() ??
                                    0,
                                balasan:
                                    '${state.reviews.value[index].detail?.treatmentReview?.replyReview ?? 0} balasan',
                              );
                            }
                            if (state.reviews.value[index].transactionType ==
                                'PRODUCT') {
                              return TextUlasanRiwayat(
                                onPressed: () {
                                  Get.to(() => DetailSkinUlasanProduk(
                                        data: state.reviews.value[index],
                                      ));
                                },
                                nameBrand: state.reviews.value[index].detail
                                        ?.product?.name ??
                                    '-',
                                nameProduk: state.reviews.value[index].detail
                                        ?.product?.type ??
                                    '-',
                                waktu: timeago.format(DateTime.parse(state
                                    .reviews.value[index].createdAt
                                    .toString())),
                                coment: state.reviews.value[index].detail
                                        ?.productReview?.review ??
                                    '-',
                                rating: state.reviews.value[index].detail
                                        ?.productReview?.avgRating
                                        ?.toInt() ??
                                    0,
                                balasan:
                                    '${state.reviews.value[index].detail?.treatmentReview?.replyReview ?? 0} balasan',
                              );
                            }
                            return null;
                          },
                        ),
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
