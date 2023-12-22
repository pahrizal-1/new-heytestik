// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/interest/interest_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_wajah.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/timeline_widget.dart';

class BeautyProfilPage extends StatefulWidget {
  bool isEdit = false;
  bool isCompleteProfile;
  BeautyProfilPage({
    required this.isEdit,
    required this.isCompleteProfile,
    super.key,
  });

  @override
  State<BeautyProfilPage> createState() => _BeautyProfilPageState();
}

class _BeautyProfilPageState extends State<BeautyProfilPage> {
  final InterestController state = Get.put(InterestController());
  final ProfileController stateProfile = Get.put(ProfileController());
  int selectedIndex = 0;
  int selectedIndex2 = 0;
  int selectedIndex3 = 0;
  int selectedIndex4 = 0;
  int selectedIndex5 = 0;
  int selectedIndex6 = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      state.skinType.value =
          stateProfile.interestData.value.data?.beautyProfile?.skinType ?? '';
      if (state.skinType.value == 'Kering') {
        selectedIndex = 1;
      } else if (state.skinType.value == 'Normal') {
        selectedIndex = 2;
      } else if (state.skinType.value == 'Kombinasi') {
        selectedIndex = 3;
      } else if (state.skinType.value == 'Berminyak') {
        selectedIndex = 4;
      }
      // =======================================================================================
      state.skinToneColor.value =
          stateProfile.interestData.value.data?.beautyProfile?.skinToneColor ??
              '';
      if (state.skinToneColor.value == 'Putih\nGading') {
        selectedIndex2 = 1;
      } else if (state.skinToneColor.value == 'Kuning\nLangsat') {
        selectedIndex2 = 2;
      } else if (state.skinToneColor.value == 'Sawo\nMatang') {
        selectedIndex2 = 3;
      } else if (state.skinToneColor.value == 'Gelap\n') {
        selectedIndex2 = 4;
      }
      // =======================================================================================
      state.skinUnderToneColor.value = stateProfile
              .interestData.value.data?.beautyProfile?.skinUndertoneColor ??
          '';
      if (state.skinUnderToneColor.value == 'Dingin') {
        selectedIndex3 = 1;
      } else if (state.skinUnderToneColor.value == 'Netral') {
        selectedIndex3 = 2;
      } else if (state.skinUnderToneColor.value == 'Hangat') {
        selectedIndex3 = 3;
      }
      // =======================================================================================
      state.hairType.value =
          stateProfile.interestData.value.data?.beautyProfile?.hairType ?? '';
      if (state.hairType.value == 'Lurus') {
        selectedIndex4 = 1;
      } else if (state.hairType.value == 'Keriting') {
        selectedIndex4 = 2;
      } else if (state.hairType.value == 'Bergelombang') {
        selectedIndex4 = 3;
      }
      // =======================================================================================
      state.hairColor.value =
          stateProfile.interestData.value.data?.beautyProfile?.hairColor ?? '';
      if (state.hairColor.value == 'Rambut\nCerah') {
        selectedIndex5 = 1;
      } else if (state.hairColor.value == 'Rambut\nGelap') {
        selectedIndex5 = 2;
      }
      // =======================================================================================
      state.hijabers =
          stateProfile.interestData.value.data?.beautyProfile?.hijabers;
      if (state.hijabers == true) {
        selectedIndex6 = 1;
      } else {
        selectedIndex6 = 2;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Column option(
      int index,
      String img,
      String title,
    ) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              print('tes');
              selectedIndex = index;
              state.skinType.value = title;
              setState(() {});
              print(state.skinType.value);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                // color: selectedIndex == index ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    selectedIndex == index
                        ? 'assets/icons/chek_icons.png'
                        : img,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title.toString(),
            style: greyTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    Column option2(
      int index,
      String img,
      String title,
    ) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              print('tes');
              selectedIndex2 = index;
              state.skinToneColor.value = title;
              setState(() {});
              print(state.skinToneColor.value);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                // color: selectedIndex == index ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    selectedIndex2 == index
                        ? 'assets/icons/chek_icons.png'
                        : img,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title.toString(),
            style: greyTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    Column option3(
      int index,
      String img,
      String title,
    ) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              print('tes');
              selectedIndex3 = index;
              state.skinUnderToneColor.value = title;
              setState(() {});
              print(state.skinUnderToneColor.value);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                // color: selectedIndex == index ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    selectedIndex3 == index
                        ? 'assets/icons/chek_icons.png'
                        : img,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title.toString(),
            style: greyTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    Column option4(
      int index,
      String img,
      String title,
    ) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              print('tes');
              selectedIndex4 = index;
              state.hairType.value = title;
              setState(() {});
              print(state.hairType.value);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                // color: selectedIndex == index ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    selectedIndex4 == index
                        ? 'assets/icons/chek_icons.png'
                        : img,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title.toString(),
            style: greyTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    Column option5(
      int index,
      String img,
      String title,
    ) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              print('tes');
              selectedIndex5 = index;
              state.hairColor.value = title;
              setState(() {});
              print(state.hairColor.value);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                // color: selectedIndex == index ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    selectedIndex5 == index
                        ? 'assets/icons/chek_icons.png'
                        : img,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title.toString(),
            style: greyTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    Column option6(
      int index,
      String img,
      String title,
    ) {
      return Column(
        children: [
          InkWell(
            onTap: () {
              print('tes');
              selectedIndex6 = index;
              if (title == 'Hijab') {
                state.hijabers = true;
              } else {
                state.hijabers = false;
              }
              setState(() {});
              print(state.hijabers);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                // color: selectedIndex == index ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    selectedIndex6 == index
                        ? 'assets/icons/chek_icons.png'
                        : img,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title.toString(),
            style: greyTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: () async {
                if (widget.isCompleteProfile || widget.isEdit) {
                  Get.back(result: false);
                } else {
                  await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return NantiSajaDialog();
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SkinGoalsKorektifWajah(
                        isEdit: widget.isEdit,
                        isCompleteProfile: widget.isCompleteProfile,
                      ),
                    ),
                  );
                }
              },
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StickyHeader(
          header: Container(
            color: whiteColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TimeLineIdicatorPage(
                      iconColor: whiteColor,
                      secondiconColor: greenColor,
                      bgcolor: greenColor,
                      isFirst: true,
                      title: 'Nomor Hanpone',
                      img: 'assets/icons/iphone1.png',
                      width: 15,
                      iconimg: 'assets/images/check.png',
                    ),
                    TimeLineIdicatorPage(
                      iconColor: whiteColor,
                      secondiconColor: greenColor,
                      bgcolor: greenColor,
                      isFirst: false,
                      isLast: false,
                      title: 'Email',
                      img: 'assets/icons/email-icons.png',
                      width: 25,
                      iconimg: 'assets/images/check.png',
                    ),
                    TimeLineIdicatorPage(
                      iconColor: whiteColor,
                      secondiconColor: greenColor,
                      bgcolor: greenColor,
                      isFirst: false,
                      isLast: false,
                      title: 'Info Personal',
                      img: 'assets/images/iphone1.png',
                      width: 25,
                      iconimg: 'assets/images/check.png',
                    ),
                    TimeLineIdicatorPage(
                      iconColor: greenColor,
                      secondiconColor: greenColor,
                      bgcolor: whiteColor,
                      isFirst: false,
                      isLast: true,
                      title: 'Beauty Profile',
                      img: 'assets/icons/logo-person.png',
                      width: 20,
                      iconimg: 'assets/images/Vector.png',
                    ),
                    TimeLineIdicatorPage(
                      iconColor: greenColor,
                      secondiconColor: greenColor,
                      bgcolor: whiteColor,
                      isFirst: true,
                      isLast: true,
                      title: 'Beauty Concern',
                      img: 'assets/icons/logo-person.png',
                      width: 20,
                      iconimg: 'assets/images/Vector.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dividergrey(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Beauty Profile',
                  style: blackHigtTextStyle,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Tipe Kulit',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    option(
                      1,
                      'assets/images/kulitkering.png',
                      'Kering',
                    ),
                    option(
                      2,
                      'assets/images/kulitnormal.png',
                      'Normal',
                    ),
                    option(
                      3,
                      'assets/images/kulitkombinasi.png',
                      'Kombinasi',
                    ),
                    option(
                      4,
                      'assets/images/kulitberminyak.png',
                      'Berminyak',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Warna Tone Kulit',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    option2(
                      1,
                      'assets/images/putihgading.png',
                      'Putih\nGading',
                    ),
                    option2(
                      2,
                      'assets/images/kuninglangsat.png',
                      'Kuning\nLangsat',
                    ),
                    option2(
                      3,
                      'assets/images/sawomatang.png',
                      'Sawo\nMatang',
                    ),
                    option2(
                      4,
                      'assets/images/gelap.png',
                      'Gelap\n',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Warna Undertone Kulit',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  option3(
                    1,
                    'assets/images/dingin.png',
                    'Dingin',
                  ),
                  option3(
                    2,
                    'assets/images/netral.png',
                    'Netral',
                  ),
                  option3(
                    3,
                    'assets/images/hangat.png',
                    'Hangat',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Tipe Rambut',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  option4(
                    1,
                    'assets/images/rambutlurus.png',
                    'Lurus',
                  ),
                  option4(
                    2,
                    'assets/images/rambutkriting.png',
                    'Keriting',
                  ),
                  option4(
                    3,
                    'assets/images/rambutbergelombang.png',
                    'Bergelombang',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Warna Rambut',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  option5(
                    1,
                    'assets/images/rambutcerah.png',
                    'Rambut\nCerah',
                  ),
                  option5(
                    2,
                    'assets/images/rambutgelap.png',
                    'Rambut\nGelap',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: lsymetric,
                child: Text(
                  'Hijabers',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  option6(
                    1,
                    'assets/images/hijab.png',
                    'Hijab',
                  ),
                  option6(
                    2,
                    'assets/images/nonhijab.png',
                    'Non\nHijab',
                  ),
                ],
              ),
              const SizedBox(
                height: 66,
              ),
              Padding(
                padding: lsymetric,
                child: Column(
                  children: [
                    Obx(
                      () => LoadingWidget(
                        isLoading: state.isLoading.value,
                        child: ButtonGreenWidget(
                          title: widget.isCompleteProfile == false
                              ? 'Simpan'
                              : 'Lanjut',
                          onPressed: () async {
                            await state.beautifulProfile(context,
                                doInPost: () async {
                              if (widget.isCompleteProfile || widget.isEdit) {
                                Get.back(result: true);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SkinGoalsKorektifWajah(
                                      isEdit: widget.isEdit,
                                      isCompleteProfile:
                                          widget.isCompleteProfile,
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    if (widget.isEdit == false &&
                        widget.isCompleteProfile == false)
                      const SizedBox(
                        height: 20,
                      ),
                    if (widget.isEdit == false &&
                        widget.isCompleteProfile == false)
                      Padding(
                        padding: lsymetric,
                        child: ButtonTextWidget(
                          title: 'Nanti Saja',
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return NantiSajaDialog();
                              },
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SkinGoalsKorektifWajah(
                                  isEdit: widget.isEdit,
                                  isCompleteProfile: widget.isCompleteProfile,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
