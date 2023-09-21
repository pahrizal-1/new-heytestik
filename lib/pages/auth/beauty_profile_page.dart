import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/interest/interest_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/skin_goals_wajah.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/drop_dow_widget.dart';
import '../../widget/timeline_widget.dart';

class BeautyProfilPage extends StatefulWidget {
  const BeautyProfilPage({super.key});

  @override
  State<BeautyProfilPage> createState() => _BeautyProfilPageState();
}

class _BeautyProfilPageState extends State<BeautyProfilPage> {
  int selectedIndex = 0;
  int selectedIndex2 = 0;
  int selectedIndex3 = 0;
  int selectedIndex4 = 0;
  int selectedIndex5 = 0;
  int selectedIndex6 = 0;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<InterestController>(context);

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
              state.skinType = title;
              setState(() {});
              print(state.skinType);
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
              state.skinToneColor = title;
              setState(() {});
              print(state.skinToneColor);
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
              state.skinUnderToneColor = title;
              setState(() {});
              print(state.skinUnderToneColor);
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
              state.hairType = title;
              setState(() {});
              print(state.hairType);
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
              state.hairColor = title;
              setState(() {});
              print(state.hairColor);
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
              onTap: () {
                Navigator.pop(context);
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
                      'kering',
                    ),
                    option(
                      2,
                      'assets/images/kulitnormal.png',
                      'Normal',
                    ),
                    option(
                      3,
                      'assets/images/kulitkombinasi.png',
                      'kombinasi',
                    ),
                    option(
                      4,
                      'assets/images/kulitberminyak.png',
                      'Berminyak',
                    ),
                    // CircleImgWidget(
                    //   title: 'kering',
                    //   img: 'assets/images/kulitkering.png',
                    //   type: 1,
                    // ),
                    // CircleImgWidget(
                    //   title: 'Normal',
                    //   img: 'assets/images/kulitnormal.png',
                    //   type: 1,
                    // ),
                    // CircleImgWidget(
                    //   title: 'kombinasi',
                    //   img: 'assets/images/kulitkombinasi.png',
                    //   type: 1,
                    // ),
                    // CircleImgWidget(
                    //   title: 'Berminyak',
                    //   img: 'assets/images/kulitberminyak.png',
                    //   type: 1,
                    // ),
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
                    // CircleImgWidget(
                    //   title: 'Putih\nGading',
                    //   img: 'assets/images/putihgading.png',
                    //   type: 2,
                    // ),
                    // CircleImgWidget(
                    //   title: 'Kuning\nLangsat',
                    //   img: 'assets/images/kuninglangsat.png',
                    //   type: 2,
                    // ),
                    // CircleImgWidget(
                    //   title: 'Sawo\nMatang',
                    //   img: 'assets/images/sawomatang.png',
                    //   type: 2,
                    // ),
                    // CircleImgWidget(
                    //   title: 'Gelap\n',
                    //   img: 'assets/images/gelap.png',
                    //   type: 2,
                    // ),
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
                  // CircleImgWidget(
                  //   title: 'Dingin',
                  //   img: 'assets/images/dingin.png',
                  //   type: 3,
                  // ),
                  // CircleImgWidget(
                  //   title: 'Netral',
                  //   img: 'assets/images/netral.png',
                  //   type: 3,
                  // ),
                  // CircleImgWidget(
                  //   title: 'Hangat',
                  //   img: 'assets/images/hangat.png',
                  //   type: 3,
                  // ),
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
                  // CircleImgWidget(
                  //   title: 'Lurus',
                  //   img: 'assets/images/rambutlurus.png',
                  //   type: 4,
                  // ),
                  // CircleImgWidget(
                  //   title: 'Keriting',
                  //   img: 'assets/images/rambutkriting.png',
                  //   type: 4,
                  // ),
                  // CircleImgWidget(
                  //   title: 'Bergelombang',
                  //   img: 'assets/images/rambutbergelombang.png',
                  //   type: 4,
                  // ),
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
                  // CircleImgWidget(
                  //   title: 'Rambut\nCerah',
                  //   img: 'assets/images/rambutcerah.png',
                  //   type: 5,
                  // ),
                  // CircleImgWidget(
                  //   title: 'Rambut\ngelap',
                  //   img: 'assets/images/rambutgelap.png',
                  //   type: 5,
                  // ),
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
                  // CircleImgWidget(
                  //   title: 'Hijab',
                  //   img: 'assets/images/hijab.png',
                  //   type: 6,
                  // ),
                  // CircleImgWidget(
                  //   title: 'Non\nHijab',
                  //   img: 'assets/images/nonhijab.png',
                  //   type: 6,
                  // ),
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
                          title: 'Simpan',
                          onPressed: () async {
                            await state.beautifulProfile(context,
                                doInPost: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SkinGoalsSatu(),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: lsymetric,
                      child: ButtonTextWidget(
                        title: 'Nanti Saja',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SkinGoalsSatu(),
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
