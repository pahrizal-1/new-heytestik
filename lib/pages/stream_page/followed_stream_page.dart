// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/stream_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/stream_page/beuty_folower_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/user_followed_post.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import '../../theme/theme.dart';
import '../setings&akun/akun_home_page.dart';

class FolowedStreamPage extends StatefulWidget {
  String username;
  FolowedStreamPage({super.key, required this.username});

  @override
  State<FolowedStreamPage> createState() => _FolowedStreamPageState();
}

class _FolowedStreamPageState extends State<FolowedStreamPage> {
  final ProfileController stateProfile = Get.put(ProfileController());
  final StreamController stateStream = Get.put(StreamController());
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  String? search;
  bool followed = false;
  bool block = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateProfile.postType.value = "ALL";
      stateProfile.page.value = 1;
      stateProfile.activity.value.clear();
      stateProfile.getUserOverview(context, username: widget.username);
      stateProfile.getInterest(context);
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          stateProfile.page.value += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            stateProfile.activity.value.addAll(
              await stateProfile.getUserActivityPost(
                context,
                stateProfile.page.value,
                username: widget.username,
                search: search,
                postType: stateProfile.postType.value,
              ),
            );
            setState(() {});
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
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
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Obx(
                () => Text(
                  stateProfile.userOverview.value.fullname ?? '',
                  style: blackHigtTextStyle.copyWith(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        actions: [
          followed
              ? Container()
              : InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/notif-icons.svg',
                  ),
                ),
          const SizedBox(
            width: 26,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AkunHomePage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 25,
                right: 25,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: stateProfile.userOverview.value
                                          .mediaUserProfilePicture !=
                                      null
                                  ? NetworkImage(
                                          '${Global.FILE}/${stateProfile.userOverview.value.mediaUserProfilePicture?.media?.path}')
                                      as ImageProvider
                                  : AssetImage(
                                      'assets/images/profiledummy.png'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              stateProfile.userOverview.value.fullname ?? '',
                              style: blackTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              '-',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 13, right: 12, top: 7, bottom: 5),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 0.2),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/gelar.png',
                                  height: 14,
                                ),
                                const SizedBox(
                                  width: 6.4,
                                ),
                                Obx(
                                  () => Text(
                                    '${stateProfile.userOverview.value.level ?? ''} Member',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Followers',
                            style: subTitleTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => Text(
                              '${stateProfile.userOverview.value.totalFollower ?? 0}',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 0.4,
                        height: 30,
                        color: blackColor,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            'Following',
                            style: subTitleTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => Text(
                              '${stateProfile.userOverview.value.totalFollowing ?? 0}',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 0.4,
                        height: 30,
                        color: blackColor,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            'Posts',
                            style: subTitleTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => Text(
                              '${stateProfile.userOverview.value.totalPost ?? 0}',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 0.4,
                        height: 30,
                        color: blackColor,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            'Reviews',
                            style: subTitleTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => Text(
                              '${stateProfile.userOverview.value.totalReview ?? 0}',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          followed = !followed;
                        });
                      },
                      child: Container(
                        width: 165,
                        decoration: BoxDecoration(
                            color: followed ? whiteColor : greenColor,
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(7)),
                        height: 30,
                        child: Center(
                          child: followed
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Following',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 13,
                                            fontWeight: bold,
                                            color: greenColor),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: greenColor,
                                      ),
                                    ],
                                  ),
                                )
                              : Text(
                                  'Follow',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 13, fontWeight: bold),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          showDragHandle: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(25),
                              topStart: Radius.circular(25),
                            ),
                          ),
                          builder: (context) => BeautyFollower(),
                        );
                      },
                      child: Container(
                        width: 165,
                        decoration: BoxDecoration(
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(7)),
                        height: 30,
                        child: Center(
                          child: Text(
                            'Beauty Profile',
                            style: grenTextStyle.copyWith(
                                fontSize: 13, fontWeight: bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (block)
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: ButtonGreenWidget(
                  title: 'Unblock',
                  onPressed: () {
                    customeModal(
                      context,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 30),
                        child: Wrap(
                          children: [
                            Center(
                              child: RichText(
                                text: TextSpan(
                                    text: 'Unblock ',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 17),
                                    children: [
                                      TextSpan(
                                          text: '@${widget.username}',
                                          style: blackTextStyle.copyWith(
                                            fontSize: 17,
                                            color: redColor,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' ?',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 17,
                                                color: blackColor,
                                              ),
                                            ),
                                          ])
                                    ]),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              '@${widget.username} dapat melihat post kamu, follow dan mengirimkan pesan. @${widget.username} tidak akan diberi tahu bahwa kamu telah membuka memblokirnya.',
                              style: blackRegulerTextStyle.copyWith(
                                color: blackColor,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ButtonGreenWidget(
                                onPressed: () {
                                  setState(() {
                                    block = !block;
                                    Navigator.pop(context);
                                  });
                                },
                                title: 'Unblock',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ButtonWhiteWidget(
                                title: 'Batal',
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  height: 35,
                ),
              ),
            if (block)
              const SizedBox(
                height: 20,
              ),
            const dividergreen(),
            const SizedBox(
              height: 20,
            ),
            block
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 32, right: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/lock-blokir.svg'),
                        Text(
                          '@${widget.username} is Blocked',
                          style: blackHigtTextStyle.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Kamu tidak bisa melihat postingan ini maupun mengirimkan pesan. Buka untuk melihat postingan ini.',
                          style: blackRegulerTextStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                : UserFollowedPost(
                    username: widget.username,
                  )
          ],
        ),
      ),
    );
  }
}
