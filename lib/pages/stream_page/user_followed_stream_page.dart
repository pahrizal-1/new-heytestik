// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/stream_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/stream_page/beuty_folower_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/user_stream_post.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import '../../theme/theme.dart';
import '../setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/models/customer/user_profile_overview_model.dart'
    as Overview;
import 'package:heystetik_mobileapps/models/customer/setting_notif_model.dart'
    as SettingNotif;
import 'package:heystetik_mobileapps/models/customer/interest_model.dart'
    as Interest;

class UserFollowedStreamPage extends StatefulWidget {
  String username;
  String fullname;

  UserFollowedStreamPage({
    super.key,
    required this.username,
    required this.fullname,
  });

  @override
  State<UserFollowedStreamPage> createState() => _UserFollowedStreamPageState();
}

class _UserFollowedStreamPageState extends State<UserFollowedStreamPage> {
  final ProfileController stateProfile = Get.put(ProfileController());
  final StreamController stateStream = Get.put(StreamController());
  final NotificationController stateNotif = Get.put(NotificationController());
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  Overview.Data? userOverview;
  Interest.Data? userInterest;
  List<SettingNotif.Data> settingNotif = [];
  String? search;
  bool? follow;
  bool? notif;
  bool? blocked;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateProfile.postType.value = "ALL";
      stateProfile.page.value = 1;
      stateProfile.activity.value.clear();
      stateProfile.getInterest(context);
      await stateProfile
          .getUserOverview(
        context,
        username: widget.username,
      )
          .then((value) async {
        userOverview = value;
        if (follow ?? (userOverview?.follow ?? false)) {
          settingNotif = await stateNotif.getNotifAcitivityPosts(
            context,
            userOverview!.id!,
          );
        }
        return null;
      });
      userInterest = await stateProfile.getInterestUserProfile(
        context,
        username: widget.username,
      );
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
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                userOverview?.fullname ?? '',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        actions: [
          if (follow ?? (userOverview?.follow ?? false))
            if ((blocked == false) || (userOverview?.blocked == false))
              InkWell(
                onTap: () async {
                  if (notif ??
                      (settingNotif.isNotEmpty
                          ? (settingNotif[0].isEnabled ?? false)
                          : false)) {
                    notif = false;
                    setState(() {});
                    stateNotif.postNotifAcitivityPosts(
                      context,
                      userOverview!.id!,
                      false,
                    );
                    setState(() {});
                  } else {
                    notif = true;
                    stateNotif.postNotifAcitivityPosts(
                      context,
                      userOverview!.id!,
                      true,
                    );
                  }
                  setState(() {});
                },
                child: (notif ??
                        (settingNotif.isNotEmpty
                            ? (settingNotif[0].isEnabled ?? false)
                            : false))
                    ? SvgPicture.asset(
                        'assets/icons/notifikasi-green.svg',
                      )
                    : SvgPicture.asset(
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
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: userOverview?.mediaUserProfilePicture != null
                                ? NetworkImage(
                                        '${Global.FILE}/${userOverview?.mediaUserProfilePicture?.media?.path}')
                                    as ImageProvider
                                : AssetImage('assets/images/profiledummy.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userOverview?.fullname ?? '',
                            style: blackTextStyle.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          if (userOverview?.bio?.isNotEmpty ?? false)
                            Container(
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: Text(
                                userOverview?.bio ?? '',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13),
                              ),
                            ),
                          if (userOverview?.bio?.isNotEmpty ?? false)
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
                                Text(
                                  '${userOverview?.level ?? ''} Member',
                                  style: blackRegulerTextStyle.copyWith(
                                    fontSize: 13,
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
                          Text(
                            '${userOverview?.totalFollower ?? 0}',
                            style: blackTextStyle.copyWith(fontSize: 13),
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
                          Text(
                            '${userOverview?.totalFollowing ?? 0}',
                            style: blackTextStyle.copyWith(fontSize: 13),
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
                          Text(
                            '${userOverview?.totalPost ?? 0}',
                            style: blackTextStyle.copyWith(fontSize: 13),
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
                          Text(
                            '${userOverview?.totalReview ?? 0}',
                            style: blackTextStyle.copyWith(fontSize: 13),
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
            if (blocked ?? (userOverview?.blocked ?? false))
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: ButtonGreenWidget(
                  title: (blocked ?? (userOverview?.blocked ?? false))
                      ? 'Unblock'
                      : 'Block',
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
                                    text: (blocked ??
                                            (userOverview?.blocked ?? false))
                                        ? 'Unblock '
                                        : 'Block ',
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
                              (blocked ?? (userOverview?.blocked ?? false))
                                  ? '@${widget.username} dapat melihat post kamu, follow dan mengirimkan pesan. @${widget.username} tidak akan diberi tahu bahwa kamu telah membuka memblokirnya.'
                                  : '@${widget.username} tidak bisa mengirim pesan ke kamu atau menemukan profile, dan post kamu. @${widget.username} tidak akan diberi tahu bahwa kamu telah memblokirnya.',
                              style: blackRegulerTextStyle.copyWith(
                                color: blackColor,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: ButtonGreenWidget(
                                onPressed: () async {
                                  if (blocked ??
                                      (userOverview?.blocked ?? false)) {
                                    blocked = false;
                                    stateStream.unBlockUser(
                                      context,
                                      widget.username,
                                    );
                                    setState(() {});
                                    SnackbarWidget.getSuccessSnackbar(
                                      context,
                                      'Info',
                                      'Unblock @${widget.username} berhasil',
                                    );
                                  } else {
                                    blocked = true;
                                    stateStream.blockUser(
                                      context,
                                      widget.username,
                                    );
                                    setState(() {});
                                    SnackbarWidget.getSuccessSnackbar(
                                      context,
                                      'Info',
                                      'Block @${widget.username} berhasil',
                                    );
                                  }
                                  Get.back();
                                },
                                title: (blocked ??
                                        (userOverview?.blocked ?? false))
                                    ? 'Unblock'
                                    : 'Block',
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
              )
            else
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          if ((follow ?? (userOverview?.follow ?? false))) {
                            follow = false;
                            setState(() {});
                            stateStream.unFollowUser(context, widget.username);
                            setState(() {});
                          } else {
                            follow = true;
                            setState(() {});
                            stateStream.followUser(context, widget.username);
                            setState(() {});
                          }
                        },
                        child: Container(
                          width: 165,
                          decoration: BoxDecoration(
                              color: (follow ?? (userOverview?.follow ?? false))
                                  ? whiteColor
                                  : greenColor,
                              border: Border.all(color: greenColor),
                              borderRadius: BorderRadius.circular(7)),
                          height: 30,
                          child: Center(
                            child: (follow ?? (userOverview?.follow ?? false))
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            builder: (context) => BeautyFollower(
                              userOverview: userOverview,
                              userInterest: userInterest,
                            ),
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
            const dividergreen(),
            const SizedBox(
              height: 20,
            ),
            (blocked ?? (userOverview?.blocked ?? false))
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
                : UserStreamPost(
                    username: widget.username,
                    fullname: widget.fullname,
                  )
          ],
        ),
      ),
    );
  }
}
