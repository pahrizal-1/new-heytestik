import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import '../../controller/customer/account/profile_controller.dart';
import '../../models/stream_home.dart';
import '../../models/user_activity.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/fikter_card_solusions_widget.dart';
import '../../widget/stream_general.dart';
import '../../widget/stream_polling.dart';

class UserActivityPost extends StatefulWidget {
  const UserActivityPost({super.key});

  @override
  State<UserActivityPost> createState() => _UserActivityPostState();
}

class _UserActivityPostState extends State<UserActivityPost> {
  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  String postType = "ALL";
  bool searchActive = false;
  String? search;
  int page = 1;
  List<StreamHomeModel> activity = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      activity.addAll(await profileController.getUserActivityPost(context, page, search: search, postType: postType));
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            activity.addAll(await profileController.getUserActivityPost(context, page, search: search, postType: postType));
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 22,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profiledummy.png'),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fromCssColor('#CCCCCC'),
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 12),
                        transform: Matrix4.translationValues(0, -3, 0),
                        child: TextFormField(
                          style: const TextStyle(fontSize: 15, fontFamily: 'ProximaNova'),
                          decoration: InputDecoration(
                            hintText: 'Mau share apa hari ini? Tulis disini yuk :)',
                            border: InputBorder.none,
                            hintStyle: subTitleTextStyle.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
            ],
          ),
        ),
        dividergrey(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 26,
              top: 9,
              right: 26,
            ),
            child: Row(
              children: [
                if (searchActive)
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: fromCssColor('#CCCCCC'),
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 12),
                      transform: Matrix4.translationValues(0, -3, 0),
                      child: TextFormField(
                        controller: searchController,
                        onEditingComplete: () async {
                          search = searchController.text;
                          page += 1;
                          activity.clear();
                          activity = (await profileController.getUserActivityPost(context, page, search: search, postType: postType));
                          setState(() {});
                        },
                        style: const TextStyle(fontSize: 15, fontFamily: 'ProximaNova'),
                        decoration: InputDecoration(
                          hintText: 'Search Post',
                          border: InputBorder.none,
                          hintStyle: subTitleTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                if (!searchActive)
                  GestureDetector(
                    onTap: () {
                      searchActive = true;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/icons/search1.png',
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                FiklterTreatment(
                  title: 'Semua',
                  onTap: () async {
                    postType = "ALL";
                    page += 1;
                    activity.clear();
                    activity = (await profileController.getUserActivityPost(context, page, search: search, postType: postType));
                    setState(() {});
                  },
                ),
                FiklterTreatment(
                  title: 'Stream',
                  onTap: () async {
                    postType = "STREAM";
                    page += 1;
                    activity.clear();
                    activity = (await profileController.getUserActivityPost(context, page, search: search, postType: postType));
                    setState(() {});
                  },
                ),
                FiklterTreatment(
                  title: 'My Journey',
                  onTap: () async {
                    postType = "MY_JOURNEY";
                    page += 1;
                    activity.clear();
                    activity = (await profileController.getUserActivityPost(context, page, search: search, postType: postType));
                    setState(() {});
                  },
                ),
                FiklterTreatment(
                  title: 'Polling',
                  onTap: () async {
                    postType = "POLLING";
                    page += 1;
                    activity.clear();
                    activity = (await profileController.getUserActivityPost(context, page, search: search, postType: postType));
                    setState(() {});
                  },
                ),
                FiklterTreatment(
                  title: 'Liked',
                  onTap: () async {
                    postType = "LIKED";
                    page += 1;
                    activity.clear();
                    activity = (await profileController.getUserActivityPost(context, page, search: search, postType: postType));
                    setState(() {});
                  },
                ),
                FiklterTreatment(
                  title: 'Saved',
                  onTap: () async {
                    postType = "SAVED";
                    page += 1;
                    activity.clear();
                    activity = (await profileController.getUserActivityPost(context, page, search: search, postType: postType));
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        ListView.separated(
          controller: scrollController,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activity.length,
          itemBuilder: (context, index) {
            if (activity[index].type.toLowerCase() == 'polling') {
              return StreamPostPolling(stream: activity[index]);
            }
            return StreamPostGeneral(stream: activity[index]);
          },
          separatorBuilder: (context, index) {
            return dividergreen();
          },
        ),
      ],
    );
  }
}
