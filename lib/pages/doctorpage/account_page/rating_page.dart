import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/loading_widget.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final DoctorProfileController state = Get.put(DoctorProfileController());
  int? group1Value;
  int? groupRating;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getReview(context);
      state.getOverview(context);
      state.getDetailOverview(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: greenColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      state.listReview.value = [];
                      state.listOverview.value = [];
                      state.listDetailOverview.value = [];
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Rating & Ulasan Pasien',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontWeight: bold,
                      fontSize: 20,
                      color: whiteColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Obx(() => LoadingWidget(
              isLoading: state.isLoading.value,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 35,
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          customeshomodal(context,
                              StatefulBuilder(builder: (context, setState) {
                            return Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 36,
                                    left: 33,
                                  ),
                                  child: Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            state.listDetailOverview.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  'assets/icons/danger-icons.png',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 22,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.listDetailOverview[
                                                            index][
                                                            'satisfied_percentage']
                                                        .toString(),
                                                    style: blackHigtTextStyle
                                                        .copyWith(fontSize: 38),
                                                  ),
                                                  const SizedBox(
                                                    width: 9,
                                                  ),
                                                  Text(
                                                    'pasien puas melakukan\nkonsultasi dengan Anda',
                                                    style: blackTextStyle
                                                        .copyWith(fontSize: 20),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                'Dihitung dari jumlah rating positif (bintang 4 dan 5)\ndibagi dengan total rating',
                                                style:
                                                    subTitleTextStyle.copyWith(
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 19,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/icons/stars-new.png',
                                                      width: 16,
                                                      height: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    '5',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  LinearPercentIndicator(
                                                    lineHeight: 4,
                                                    width: 250,
                                                    animation: true,
                                                    animationDuration: 2600,
                                                    percent: double.parse(state
                                                            .listDetailOverview[
                                                                index][
                                                                'rating5_percentage']
                                                            .toString()) /
                                                        100,
                                                    progressColor:
                                                        const Color(0xffFFC36A),
                                                  ),
                                                  // LinearProgressIndicator(
                                                  //   value: 10.0,
                                                  //   minHeight: 10,
                                                  //   backgroundColor:
                                                  //       Colors.grey[300],
                                                  //   color: Color(0xffFFC36A),
                                                  // ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    state.listDetailOverview[
                                                            index]['rating5']
                                                        .toString(),
                                                    style: subTitleTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/icons/stars-new.png',
                                                      width: 16,
                                                      height: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    '4',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  LinearPercentIndicator(
                                                    lineHeight: 4,
                                                    width: 250,
                                                    animation: true,
                                                    animationDuration: 2600,
                                                    percent: double.parse(state
                                                            .listDetailOverview[
                                                                index][
                                                                'rating4_percentage']
                                                            .toString()) /
                                                        100,
                                                    progressColor:
                                                        const Color(0xffFFC36A),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    state.listDetailOverview[
                                                            index]['rating4']
                                                        .toString(),
                                                    style: subTitleTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/icons/stars-new.png',
                                                      width: 16,
                                                      height: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    '3',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  LinearPercentIndicator(
                                                    lineHeight: 4,
                                                    width: 250,
                                                    animation: true,
                                                    animationDuration: 2600,
                                                    percent: double.parse(state
                                                            .listDetailOverview[
                                                                index][
                                                                'rating3_percentage']
                                                            .toString()) /
                                                        100,
                                                    progressColor:
                                                        const Color(0xffFFC36A),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    state.listDetailOverview[
                                                            index]['rating3']
                                                        .toString(),
                                                    style: subTitleTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/icons/stars-new.png',
                                                      width: 16,
                                                      height: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    '2',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  LinearPercentIndicator(
                                                    lineHeight: 4,
                                                    width: 250,
                                                    animation: true,
                                                    animationDuration: 2600,
                                                    percent: double.parse(state
                                                            .listDetailOverview[
                                                                index][
                                                                'rating2_percentage']
                                                            .toString()) /
                                                        100,
                                                    progressColor:
                                                        const Color(0xffFFC36A),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    state.listDetailOverview[
                                                            index]['rating2']
                                                        .toString(),
                                                    style: subTitleTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/icons/stars-new.png',
                                                      width: 16,
                                                      height: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    '1',
                                                    style: blackHigtTextStyle
                                                        .copyWith(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  LinearPercentIndicator(
                                                    lineHeight: 4,
                                                    width: 250,
                                                    animation: true,
                                                    animationDuration: 2600,
                                                    percent: double.parse(state
                                                            .listDetailOverview[
                                                                index][
                                                                'rating1_percentage']
                                                            .toString()) /
                                                        100,
                                                    progressColor:
                                                        const Color(0xffFFC36A),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    state.listDetailOverview[
                                                            index]['rating1']
                                                        .toString(),
                                                    style: subTitleTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            );
                          }));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                                width: 0.5, color: fromCssColor('#A3A3A3')),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (var i in state.listOverview)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${i['satisfied_percentage']}% Pasien Merasa Puas",
                                        style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0.2,
                                          fontWeight: bold,
                                          fontFamily: 'ProximaNova',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${i['total_rating']} rating . ${i['total_review']} Ulasan",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: fromCssColor('#A3A3A3'),
                                          letterSpacing: 0.2,
                                          fontFamily: 'ProximaNova',
                                        ),
                                      ),
                                    ],
                                  ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadiusDirectional.only(
                                      topEnd: Radius.circular(25),
                                      topStart: Radius.circular(25),
                                    ),
                                  ),
                                  builder: (context) => StatefulBuilder(
                                          builder: ((context, setState) {
                                        return Wrap(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 33,
                                                  right: 33,
                                                  top: 30,
                                                  bottom: 40),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/danger-icons.png',
                                                        width: 12,
                                                      ),
                                                      const SizedBox(
                                                        width: 22,
                                                      ),
                                                      Text(
                                                        'Rating dengan Ulasan',
                                                        style:
                                                            blackHigtTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        20),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 39,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                          'assets/icons/stars.svg'),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        '1',
                                                        style: blackHigtTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 0,
                                                        groupValue: groupRating,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            groupRating = val;
                                                            if (val != null) {
                                                              state.dataRating =
                                                                  1;
                                                            } else {
                                                              state.dataRating =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                          print(
                                                              state.dataRating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: borderColor,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                          'assets/icons/stars.svg'),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        '2',
                                                        style: blackHigtTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 1,
                                                        groupValue: groupRating,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            groupRating = val;
                                                            if (val != null) {
                                                              state.dataRating =
                                                                  2;
                                                            } else {
                                                              state.dataRating =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                          print(
                                                              state.dataRating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: borderColor,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                          'assets/icons/stars.svg'),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        '3',
                                                        style: blackHigtTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 2,
                                                        groupValue: groupRating,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            groupRating = val;
                                                            if (val != null) {
                                                              state.dataRating =
                                                                  3;
                                                            } else {
                                                              state.dataRating =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                          print(
                                                              state.dataRating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: borderColor,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                          'assets/icons/stars.svg'),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        '4',
                                                        style: blackHigtTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 3,
                                                        groupValue: groupRating,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            groupRating = val;
                                                            if (val != null) {
                                                              state.dataRating =
                                                                  4;
                                                            } else {
                                                              state.dataRating =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                          print(
                                                              state.dataRating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: borderColor,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      SvgPicture.asset(
                                                          'assets/icons/stars.svg'),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        '5',
                                                        style: blackHigtTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 4,
                                                        groupValue: groupRating,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            groupRating = val;
                                                            if (val != null) {
                                                              state.dataRating =
                                                                  5;
                                                            } else {
                                                              state.dataRating =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                          print(
                                                              state.dataRating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  ButtonGreenWidget(
                                                    onPressed: () {
                                                      // print('prnt' + );
                                                      state.getReview(context);
                                                      Navigator.pop(context);
                                                    },
                                                    title: 'Tampilkan',
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })));
                              // customeshomodal(
                              //     context, const RatingDenganUlasanWidgets());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      'Rating',
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadiusDirectional.only(
                                      topEnd: Radius.circular(25),
                                      topStart: Radius.circular(25),
                                    ),
                                  ),
                                  builder: (context) => StatefulBuilder(
                                          builder: ((context, setState) {
                                        return Wrap(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 33,
                                                  right: 33,
                                                  top: 30,
                                                  bottom: 40),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/danger-icons.png',
                                                        width: 12,
                                                      ),
                                                      const SizedBox(
                                                        width: 22,
                                                      ),
                                                      Text(
                                                        'Urutan',
                                                        style:
                                                            blackHigtTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        20),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 39,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'TERBARU',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 0,
                                                        groupValue: group1Value,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            group1Value = val;
                                                            if (val != null) {
                                                              state.dataUrutan =
                                                                  'LATEST';
                                                            } else {
                                                              state.dataUrutan =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                          print(
                                                              state.dataUrutan);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: borderColor,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Rating Tertinggi',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 1,
                                                        groupValue: group1Value,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            group1Value = val;
                                                            if (val != null) {
                                                              state.dataUrutan =
                                                                  'HIGHEST';
                                                            } else {
                                                              state.dataUrutan =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: borderColor,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Rating Terendah',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                color:
                                                                    blackColor,
                                                                fontSize: 15),
                                                      ),
                                                      Spacer(),
                                                      Radio(
                                                        value: 2,
                                                        groupValue: group1Value,
                                                        toggleable: true,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            group1Value = val;
                                                            if (val != null) {
                                                              state.dataUrutan =
                                                                  'LOWEST';
                                                            } else {
                                                              state.dataUrutan =
                                                                  null;
                                                            }
                                                          });
                                                          print(val);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  // const FilterTapTreatment(
                                                  //   title: 'Terbaru',
                                                  // ),
                                                  // const FilterTapTreatment(
                                                  //   title: 'Rating Tertinggi',
                                                  // ),
                                                  // const FilterTapTreatment(
                                                  //   title: 'Rating Terendah',
                                                  // ),
                                                  ButtonGreenWidget(
                                                    onPressed: () {
                                                      // print('prnt' + );
                                                      state.getReview(context);
                                                      Navigator.pop(context);
                                                    },
                                                    title: 'Tampilkan',
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      'Urutan',
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.listReview.length,
                              itemBuilder: ((context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          state.listReview[index]['customer']
                                              ['fullname'],
                                          style: blackTextStyle.copyWith(
                                              fontSize: 15),
                                        ),
                                        const Spacer(),
                                        Text(
                                          state.toTimeAgoLabel(DateTime.parse(
                                              state.listReview[index]
                                                  ['created_at'])),
                                          style: subTitleTextStyle.copyWith(
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        for (var i = 0;
                                            i <
                                                state.listReview[index]
                                                    ['rating'];
                                            i++)
                                          Image.asset(
                                            'assets/icons/stars-new.png',
                                            width: 13,
                                            height: 12,
                                          ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                      state.listReview[index]['review'],
                                      style: blackRegulerTextStyle.copyWith(
                                          fontSize: 13, color: blackColor),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const dividergreen(),
                                  ],
                                );
                              }))),
                    ],
                  ),
                ),
              ),
            )));
  }
}
