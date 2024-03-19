// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/location_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/anggaran_treameant.dart';
import 'package:heystetik_mobileapps/pages/auth/beauty_profile_page.dart';
import 'package:heystetik_mobileapps/pages/auth/phone_number_page.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_gloals_pilih_treamtmnet.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_tubuh.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_wajah.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_wajah_tubuh.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_golas_penuralan_sexsual.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_account_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/beauty_profil_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/user_activity_post.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/user_activity_review.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/models/customer/user_profile_overview_model.dart'
    as Overview;
import '../../core/global.dart';
import '../../theme/theme.dart';

import '../setings&akun/akun_home_page.dart';
import 'edit_profil_customer_page.dart';

class ProfilCustomerPage extends StatefulWidget {
  final double? height;
  final Color? color;
  const ProfilCustomerPage({
    super.key,
    this.height = 1,
    this.color = Colors.white,
  });

  @override
  State<ProfilCustomerPage> createState() => _ProfilCustomerPageState();
}

class _ProfilCustomerPageState extends State<ProfilCustomerPage> {
  final LocationController stateLocation = Get.put(LocationController());
  final ProfileController stateProfile = Get.put(ProfileController());
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool isPost = true;
  String? search;
  Overview.Data? userOverview;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      stateProfile.postType.value = "ALL";
      stateProfile.page.value = 1;
      stateProfile.activity.value.clear();
      stateProfile.init();
      stateProfile.getProfile(context);
      stateProfile.getCompletion(context);
      stateProfile.getInterest(context);
      stateLocation.getLocation(context);
      userOverview = await stateProfile.getUserOverview(context);
      setState(() {});
    });
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          stateProfile.page.value += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            if (isPost) {
              stateProfile.activity.value.addAll(
                await stateProfile.getUserActivityPost(
                  context,
                  stateProfile.page.value,
                  search: search,
                  postType: stateProfile.postType.value,
                ),
              );
            } else {
              stateProfile.isLoadingMore.value = true;
              stateProfile.reviews.value.addAll(
                await stateProfile.getUserActivityReview(
                  context,
                  stateProfile.page.value,
                ),
              );
              stateProfile.isLoadingMore.value = false;
            }
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
              Text(
                "Profile",
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        actions: [
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
            Obx(
              () => stateProfile.completionData.value.data?.percentage == 100
                  ? Container()
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 39,
                      color: greenColor.withOpacity(0.3),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              stateProfile.completionData.value.data?.title ??
                                  '-',
                              style: blackRegulerTextStyle.copyWith(
                                  fontSize: 10, color: blackColor),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 7,
                              width: 185 *
                                  (int.parse((stateProfile.completionData.value
                                                  .data?.percentage ??
                                              0)
                                          .toString()) /
                                      100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: greenColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 7,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(
                            () => Text(
                              '${stateProfile.completionData.value.data?.percentage ?? 0}%',
                              style: grenTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              bool check = false;
                              if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Anggaran Untuk Skincare & Treatment') {
                                check = await Get.to(() => AnggaranTreatment(
                                      isEdit: false,
                                      isCompleteProfile: true,
                                    ));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Treatment yang pernah dilakukan') {
                                check = await Get.to(
                                    () => SkinGloalsPilihTreamtmnet(
                                          isEdit: false,
                                          isCompleteProfile: true,
                                        ));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  "Penyakit Menular Seksual dan Masalah Kulit Lainnya") {
                                check = await Get.to(() => SkinGoalsPenularan(
                                      isEdit: false,
                                      isCompleteProfile: true,
                                    ));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Skin Goals Augmentation Wajah & Tubuh') {
                                check = await Get.to(() => SkinGolasWajahTubuh(
                                      isEdit: false,
                                      isCompleteProfile: true,
                                    ));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Skin Goals Korektif Tubuh') {
                                check = await Get.to(() => SkinGoalsTubuh(
                                      isEdit: false,
                                      isCompleteProfile: true,
                                    ));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Skin Goals Korektif Wajah') {
                                check =
                                    await Get.to(() => SkinGoalsKorektifWajah(
                                          isEdit: false,
                                          isCompleteProfile: true,
                                        ));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Beauty Profile') {
                                check = await Get.to(() => BeautyProfilPage(
                                    isEdit: false, isCompleteProfile: true));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Verifikasi Email') {
                                check = await Get.to(() =>
                                    VerificationAcooutPage(
                                        isCompleteProfile: true));
                              } else if (stateProfile
                                      .completionData.value.data?.subtitle ==
                                  'Verifikasi No. Handphone') {
                                check = await Get.to(() =>
                                    PhoneNumberPage(isCompleteProfile: true));
                              }
                              setState(() {});
                              if (check) {
                                await stateProfile.getCompletion(context);
                                await stateProfile.getInterest(context);
                              }
                            },
                            child: Container(
                              height: 20,
                              width: 50,
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'Lengkapi',
                                style: whiteTextStyle.copyWith(fontSize: 9),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 18),
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
                              image: stateProfile.imgNetwork.value != ""
                                  ? NetworkImage(
                                          '${Global.FILE}/${stateProfile.imgNetwork.value}')
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
                              stateProfile.fullName.value,
                              style: blackTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Obx(
                            () => Text(
                              '${stateLocation.myCity.value}${stateProfile.age.value == 0 ? '' : ', ${stateProfile.age.value} tahun'}',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Obx(() {
                                if (stateProfile.interestData.value.data
                                        ?.beautyProfile?.skinType?.isNotEmpty ??
                                    false) {
                                  return Text(
                                    stateProfile.interestData.value.data
                                            ?.beautyProfile?.skinType ??
                                        '-',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 13,
                                    ),
                                  );
                                }
                                return Container();
                              }),
                              InkWell(
                                onTap: () {
                                  Get.to(() => BeautyProfil());
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: greenColor,
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 13, right: 12, top: 7, bottom: 5),
                            decoration: BoxDecoration(
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
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(() => const EditProfilCostomer());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Image.asset(
                            'assets/icons/edit.png',
                            width: 20,
                            color: blackColor,
                          ),
                        ),
                      )
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
                          ),
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
            const dividergreen(),
            const SizedBox(
              height: 19,
            ),
            Padding(
              padding: lsymetric,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isPost = true;
                        stateProfile.activity.value.clear();
                        stateProfile.page.value = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Posts',
                          style: subTitleTextStyle.copyWith(
                            fontSize: 15,
                            color: isPost ? greenColor : subTitleColor,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          height: 2,
                          width: 150,
                          decoration: BoxDecoration(
                            color: isPost ? greenColor : subTitleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isPost = false;
                        stateProfile.reviews.value.clear();
                        stateProfile.page.value = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Reviews',
                          style: subTitleTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: bold,
                            color: isPost ? subTitleColor : greenColor,
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          height: 2,
                          width: 150,
                          decoration: BoxDecoration(
                            color: isPost ? subTitleColor : greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isPost ? UserActivityPost() : UserActivityReview(),
          ],
        ),
      ),
    );
  }
}
