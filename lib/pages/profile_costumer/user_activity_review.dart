import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../controller/customer/account/profile_controller.dart';
import '../../models/user_activity.dart';
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
  List<UserActivity> reviews = [];
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
            reviews.addAll(
                await profileController.getUserActivityReview(context, page));
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ...reviews.map((review) {
            return TextUlasanRiwayat(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPageUlasan(),
                  ),
                );
              },
              nameBrand: fullName,
              nameProduk: review.productName,
              waktu: timeago.format(DateTime.parse(review.createdAt)),
              coment: review.review,
              balasan: '',
            );
          }).toList(),
        ],
      ),
    );
  }
}
