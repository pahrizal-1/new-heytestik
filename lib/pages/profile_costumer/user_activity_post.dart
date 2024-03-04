// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/buat_postingan_new.dart';
import '../../controller/customer/account/profile_controller.dart';
import '../../core/global.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/fikter_card_solusions_widget.dart';
import '../../widget/stream_post.dart';

class UserActivityPost extends StatefulWidget {
  const UserActivityPost({super.key});

  @override
  State<UserActivityPost> createState() => _UserActivityPostState();
}

class _UserActivityPostState extends State<UserActivityPost> {
  final ProfileController stateProfile = Get.put(ProfileController());
  final TextEditingController searchController = TextEditingController();

  bool searchActive = false;
  String? search;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateProfile.postType.value = "ALL";
      stateProfile.activity.value.addAll(
        await stateProfile.getUserActivityPost(
          context,
          stateProfile.page.value,
          search: search,
          postType: stateProfile.postType.value,
        ),
      );
      setState(() {});
    });
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
                  Obx(
                    () => Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: stateProfile.imgNetwork.value != ""
                              ? NetworkImage(
                                      '${Global.FILE}/${stateProfile.imgNetwork.value}')
                                  as ImageProvider
                              : AssetImage('assets/images/profiledummy.png'),
                        ),
                      ),
                    ),
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
                          onTap: () {
                            Get.to(() => const BuatPostinganStream());
                          },
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'ProximaNova',
                          ),
                          decoration: InputDecoration(
                            hintText:
                                'Mau share apa hari ini? Tulis disini yuk :)',
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
                if (searchActive ||
                    stateProfile.postType.value == 'STREAM' ||
                    stateProfile.postType.value == 'MY_JOURNEY' ||
                    stateProfile.postType.value == 'POLLING' ||
                    stateProfile.postType.value == 'LIKED' ||
                    stateProfile.postType.value == 'SAVED')
                  InkWell(
                    onTap: () async {
                      searchActive = false;
                      stateProfile.postType.value = 'ALL';
                      searchController.clear();
                      search = '';
                      stateProfile.page.value = 1;
                      stateProfile.activity.value.clear();
                      stateProfile.activity.value.addAll(
                        await stateProfile.getUserActivityPost(
                          context,
                          stateProfile.page.value,
                          search: search,
                          postType: stateProfile.postType.value,
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
                          stateProfile.page.value = 1;
                          stateProfile.activity.value.clear();
                          stateProfile.activity.value =
                              await stateProfile.getUserActivityPost(
                            context,
                            stateProfile.page.value,
                            search: search,
                            postType: stateProfile.postType.value,
                          );
                          setState(() {});
                        },
                        style: const TextStyle(
                            fontSize: 15, fontFamily: 'ProximaNova'),
                        decoration: InputDecoration(
                          hintText: 'Search Post',
                          border: InputBorder.none,
                          hintStyle: subTitleTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                if (!searchActive)
                  InkWell(
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
                Obx(
                  () => InkWell(
                    onTap: () async {
                      stateProfile.postType.value = "ALL";
                      stateProfile.page.value = 1;
                      stateProfile.activity.value.clear();
                      stateProfile.activity.value =
                          await stateProfile.getUserActivityPost(
                        context,
                        stateProfile.page.value,
                        search: search,
                        postType: stateProfile.postType.value,
                      );
                      setState(() {});
                    },
                    child: FilterOnTap(
                      title: 'Semua',
                      isSelected: stateProfile.postType.value == 'ALL',
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: () async {
                      stateProfile.postType.value = "STREAM";
                      stateProfile.page.value = 1;
                      stateProfile.activity.value.clear();
                      stateProfile.activity.value =
                          await stateProfile.getUserActivityPost(
                        context,
                        stateProfile.page.value,
                        search: search,
                        postType: stateProfile.postType.value,
                      );
                      setState(() {});
                    },
                    child: FilterOnTap(
                      title: 'Stream',
                      isSelected: stateProfile.postType.value == 'STREAM',
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: () async {
                      stateProfile.postType.value = "MY_JOURNEY";
                      stateProfile.page.value = 1;
                      stateProfile.activity.value.clear();
                      stateProfile.activity.value =
                          await stateProfile.getUserActivityPost(
                        context,
                        stateProfile.page.value,
                        search: search,
                        postType: stateProfile.postType.value,
                      );
                      setState(() {});
                    },
                    child: FilterOnTap(
                      title: 'My Journey',
                      isSelected: stateProfile.postType.value == 'MY_JOURNEY',
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: () async {
                      stateProfile.postType.value = "POLLING";
                      stateProfile.page.value = 1;
                      stateProfile.activity.value.clear();
                      stateProfile.activity.value =
                          await stateProfile.getUserActivityPost(
                        context,
                        stateProfile.page.value,
                        search: search,
                        postType: stateProfile.postType.value,
                      );
                      setState(() {});
                    },
                    child: FilterOnTap(
                      title: 'Polling',
                      isSelected: stateProfile.postType.value == 'POLLING',
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: () async {
                      stateProfile.postType.value = "LIKED";
                      stateProfile.page.value = 1;
                      stateProfile.activity.value.clear();
                      stateProfile.activity.value =
                          await stateProfile.getUserActivityPost(
                        context,
                        stateProfile.page.value,
                        search: search,
                        postType: stateProfile.postType.value,
                      );
                      setState(() {});
                    },
                    child: FilterOnTap(
                      title: 'Liked',
                      isSelected: stateProfile.postType.value == 'LIKED',
                    ),
                  ),
                ),
                Obx(
                  () => InkWell(
                    onTap: () async {
                      stateProfile.postType.value = "SAVED";
                      stateProfile.page.value = 1;
                      stateProfile.activity.value.clear();
                      stateProfile.activity.value =
                          await stateProfile.getUserActivityPost(
                        context,
                        stateProfile.page.value,
                        search: search,
                        postType: stateProfile.postType.value,
                      );
                      setState(() {});
                    },
                    child: FilterOnTap(
                      title: 'Saved',
                      isSelected: stateProfile.postType.value == 'SAVED',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => stateProfile.activity.value.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      'Belum ada data',
                       style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 20,
                                ),
                    ),
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stateProfile.activity.value.length,
                  itemBuilder: (context, index) {
                    return StreamPostPage(
                      stream: stateProfile.activity.value[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return dividergreen();
                  },
                ),
        ),
      ],
    );
  }
}
