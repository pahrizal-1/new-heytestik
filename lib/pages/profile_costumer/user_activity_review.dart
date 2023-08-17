import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart';
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
  final ScrollController scrollController = ScrollController();
  final ProfileController profileController = Get.put(ProfileController());
  int page = 1;
  List<Data2> reviews = [];
  String fullName = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      reviews
          .addAll(await profileController.getUserActivityReview(context, page));
      fullName = await LocalStorage().getFullName();
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            profileController.isLoadingMore.value = true;
            reviews.addAll(
                await profileController.getUserActivityReview(context, page));
            setState(() {});
            profileController.isLoadingMore.value = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Obx(
        () => LoadingWidget(
          isLoading: profileController.isLoadingMore.value
              ? false
              : profileController.isLoading.value,
          child: reviews.isEmpty
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
                        itemCount: reviews.length,
                        itemBuilder: (BuildContext context, index) {
                          if (reviews[index].transactionType ==
                              'CONSULTATION') {
                            return TextUlasanRiwayat(
                              onPressed: () {
                                Get.to(DetailPageUlasanKonsultasi(
                                  data: reviews[index],
                                ));
                              },
                              nameBrand: reviews[index]
                                      .detail
                                      ?.consultation
                                      ?.doctor
                                      ?.fullname ??
                                  '-',
                              nameProduk: reviews[index]
                                      .detail!
                                      .consultation
                                      ?.medicalHistory
                                      ?.interestCondition
                                      ?.name ??
                                  '-',
                              waktu: timeago.format(DateTime.parse(
                                  reviews[index].createdAt.toString())),
                              coment: reviews[index]
                                      .detail
                                      ?.consultationReview
                                      ?.review ??
                                  '-',
                              rating: reviews[index]
                                  .detail!
                                  .consultationReview!
                                  .rating!
                                  .toInt(),
                            );
                          }
                          if (reviews[index].transactionType == 'TREATMENT') {
                            return TextUlasanRiwayat(
                              onPressed: () {
                                Get.to(DetailPageUlasanTreatment(
                                  data: reviews[index],
                                ));
                              },
                              nameBrand:
                                  reviews[index].detail?.treatment?.name ?? '-',
                              nameProduk: reviews[index]
                                      .detail
                                      ?.treatment
                                      ?.clinic
                                      ?.name ??
                                  '-',
                              waktu: timeago.format(DateTime.parse(
                                  reviews[index].createdAt.toString())),
                              coment: reviews[index]
                                      .detail
                                      ?.treatmentReview
                                      ?.review ??
                                  '-',
                              rating: reviews[index]
                                      .detail
                                      ?.treatmentReview
                                      ?.avgRating
                                      ?.toInt() ??
                                  0,
                              balasan:
                                  '${reviews[index].detail?.treatmentReview?.replyReview ?? 0} balasan',
                            );
                          }
                          if (reviews[index].transactionType == 'PRODUCT') {
                            return TextUlasanRiwayat(
                              onPressed: () {
                                Get.to(DetailSkinUlasanProduk(
                                  data: reviews[index],
                                ));
                              },
                              nameBrand:
                                  reviews[index].detail?.product?.name ?? '-',
                              nameProduk:
                                  reviews[index].detail?.product?.type ?? '-',
                              waktu: timeago.format(DateTime.parse(
                                  reviews[index].createdAt.toString())),
                              coment: reviews[index]
                                      .detail
                                      ?.productReview
                                      ?.review ??
                                  '-',
                              rating: reviews[index]
                                      .detail
                                      ?.productReview
                                      ?.avgRating
                                      ?.toInt() ??
                                  0,
                              balasan:
                                  '${reviews[index].detail?.treatmentReview?.replyReview ?? 0} balasan',
                            );
                          }
                        },
                      ),
                      Obx(
                        () => profileController.isLoading.value
                            ? LoadingMore()
                            : Container(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
