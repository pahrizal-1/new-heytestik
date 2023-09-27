// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/my_journey_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/news_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/cutome_poto_journey.dart';
import 'package:heystetik_mobileapps/pages/myJourney/hasil_poto_wajah_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/pilih_skin_goals.dart';
import 'package:heystetik_mobileapps/pages/myJourney/galery_my_journey.dart';
import 'package:heystetik_mobileapps/pages/stream_page/vies_detail_beauty_stream_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

import '../../widget/button_widget.dart';
import 'hasil_kosultasi_page.dart';

class HomeMyjourney extends StatefulWidget {
  const HomeMyjourney({super.key});

  @override
  State<HomeMyjourney> createState() => _HomeMyjourneyState();
}

class _HomeMyjourneyState extends State<HomeMyjourney> {
  final MyJourneyController state = Get.put(MyJourneyController());
  final NewsController stateNews = Get.put(NewsController());
  final ProfileController stateProfile = Get.put(ProfileController());

  final NotificationCustomerController stateNotification =
      Get.put(NotificationCustomerController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await stateProfile.getProfile(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
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
                'My Journey',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 25,
              right: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skin Goal',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(PilihSkinGoals());
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => state.concern.value == ""
                            ? Text(
                                'Pilih Skin Goal kamu',
                                style: subTitleTextStyle,
                              )
                            : Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 300),
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Semoga aku bisa bebas dari ',
                                      style: blackRegulerTextStyle.copyWith(
                                        fontSize: 15,
                                        color: blackColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: state.concern.value,
                                          style: grenTextStyle.copyWith(
                                            fontSize: 15,
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                        color: greenColor,
                      ),
                    ],
                  ),
                ),
                dividergrey(),
                const SizedBox(
                  height: 39,
                ),
                InkWell(
                  onTap: () async {
                    if (state.concernId.value == 0) {
                      SnackbarWidget.getErrorSnackbar(
                        context,
                        'Info',
                        'Pilih Skinn Goal terlebih dahulu',
                      );
                      return;
                    }

                    customeshomodal(
                      context,
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                    Get.to(CustomeCameaJorney());
                                  },
                                  child: Text(
                                    'Kamera',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 15, color: blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                InkWell(
                                  onTap: () async {
                                    state.initialConditionFrontFace =
                                        await state.pickImageFromGalery();
                                    setState(() {});
                                    if (state.initialConditionFrontFace !=
                                        null) {
                                      state.isGallery.value = true;
                                      Get.to(HasilPotoWajah());
                                      return;
                                    }

                                    state.isGallery.value = false;
                                  },
                                  child: Text(
                                    'Galeri',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 15, color: blackColor),
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'CANCEL',
                                        style: blackRegulerTextStyle.copyWith(
                                            fontSize: 15, color: blackColor),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: Image.asset('assets/images/ambil-poto.png'),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/ambil-poto-kosong.png',
                      width: 103,
                      height: 104,
                    ),
                    Image.asset(
                      'assets/images/ambil-poto-kosong.png',
                      width: 103,
                      height: 104,
                    ),
                    Image.asset(
                      'assets/images/ambil-poto-kosong.png',
                      width: 103,
                      height: 104,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                ButtonWhiteWidget(
                  title: 'Lihat Journey-mu',
                  onPressed: () async {
                    Get.to(GaleryMyJourney());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          const dividergreen(),
          Image.asset(
            'assets/images/my-journey-bg.png',
            width: 1000,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 25, right: 25, bottom: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Riwayat hasil konsultasi',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  'Catatan dokter terkait skingoal kamu',
                  style: subTitleTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 13,
                ),
                FutureBuilder(
                  future: state.getHistoryConsultation(context),
                  builder: (context, AsyncSnapshot snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          shimmerWidget(
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          shimmerWidget(
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          shimmerWidget(
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return state.dataHistoryConsultation.value.isEmpty
                            ? Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(SelectConditionsPage());
                                    },
                                    child: Container(
                                      height: 95,
                                      width: 340,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 26, vertical: 30),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: borderColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Catatan dokter terkait skingoal kamu',
                                            style: subTitleTextStyle,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Chat Doctor',
                                              style: grenTextStyle.copyWith(
                                                  fontSize: 15),
                                              children: [
                                                TextSpan(
                                                    text: ' Sekarang, yuk!',
                                                    style:
                                                        blackRegulerTextStyle)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Belum ada riwayat konsultasi',
                                      style: TextStyle(
                                        fontWeight: bold,
                                        fontFamily: 'ProximaNova',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.dataHistoryConsultation.value.length,
                                itemBuilder: (BuildContext context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(HasilKosultasiPage(
                                        id: state.dataHistoryConsultation[index]
                                            .consultationDoctorScheduleId!
                                            .toInt(),
                                      ));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: borderColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Konsultasi dengan',
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 13),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 35,
                                                    width: 36,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            '${Global.FILE}/${state.dataHistoryConsultation[index].doctor?.mediaUserProfilePicture?.media?.path}',
                                                          ),
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${state.dataHistoryConsultation[index].doctor?.fullname}',
                                                        style: subTitleTextStyle
                                                            .copyWith(
                                                          fontSize: 13,
                                                          fontWeight: bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        // '12 Feb 2023; 17:30 WIB',
                                                        ConvertDate
                                                            .transactionDate(state
                                                                .dataHistoryConsultation[
                                                                    index]
                                                                .createdAt
                                                                .toString()),
                                                        style: subTitleTextStyle
                                                            .copyWith(
                                                                fontSize: 11),
                                                      ),
                                                      const SizedBox(
                                                        height: 9,
                                                      ),
                                                      Image.asset(
                                                        'assets/icons/plus-icosn.png',
                                                        width: 24,
                                                        height: 24,
                                                        color:
                                                            Color(0xfff9b9b9b),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: state
                                                              .dataHistoryConsultation[
                                                                  index]
                                                              .status ==
                                                          'MENUNGGU_PEMBAYARAN'
                                                      ? const Color.fromARGB(
                                                          255, 255, 204, 170)
                                                      : state.dataHistoryConsultation[index].status ==
                                                              'READY'
                                                          ? const Color.fromARGB(
                                                              255, 255, 204, 170)
                                                          : state
                                                                      .dataHistoryConsultation[
                                                                          index]
                                                                      .status ==
                                                                  'REVIEW'
                                                              ? const Color.fromARGB(
                                                                  255, 255, 204, 170)
                                                              : state.dataHistoryConsultation[index]
                                                                          .status ==
                                                                      'AKTIF'
                                                                  ? subgreenColor
                                                                  : state.dataHistoryConsultation[index].status == 'SELESAI'
                                                                      ? subgreenColor
                                                                      : subgreenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                height: 25,
                                                width: 74,
                                                child: Center(
                                                  child: Text(
                                                    state
                                                                .dataHistoryConsultation[
                                                                    index]
                                                                .status ==
                                                            'MENUNGGU_PEMBAYARAN'
                                                        ? 'Menunggu Pembayaran'
                                                        : state
                                                                    .dataHistoryConsultation[
                                                                        index]
                                                                    .status ==
                                                                'READY'
                                                            ? 'Ready'
                                                            : state
                                                                        .dataHistoryConsultation[
                                                                            index]
                                                                        .status ==
                                                                    'REVIEW'
                                                                ? 'Review'
                                                                : state.dataHistoryConsultation[index].status ==
                                                                        'AKTIF'
                                                                    ? 'Aktif'
                                                                    : state.dataHistoryConsultation[index].status ==
                                                                            'SELESAI'
                                                                        ? 'Selesai'
                                                                        : '-',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        whiteTextStyle.copyWith(
                                                      fontSize: 10,
                                                      color: state
                                                                  .dataHistoryConsultation[
                                                                      index]
                                                                  .status ==
                                                              'MENUNGGU_PEMBAYARAN'
                                                          ? const Color.fromARGB(
                                                              255, 255, 102, 0)
                                                          : state.dataHistoryConsultation[index].status ==
                                                                  'READY'
                                                              ? const Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  102,
                                                                  0)
                                                              : state.dataHistoryConsultation[index].status ==
                                                                      'REVIEW'
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      255,
                                                                      102,
                                                                      0)
                                                                  : state.dataHistoryConsultation[index].status ==
                                                                          'AKTIF'
                                                                      ? greenColor
                                                                      : state.dataHistoryConsultation[index].status ==
                                                                              'SELESAI'
                                                                          ? greenColor
                                                                          : greenColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 13,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  border: Border.all(
                                                      color: greenColor),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                height: 25,
                                                width: 74,
                                                child: Center(
                                                  child: Text(
                                                    'Chat Ulang',
                                                    style: grenTextStyle
                                                        .copyWith(fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      } else {
                        return Center(
                          child: Text(
                            'Belum ada riwayat konsultasi',
                            style: TextStyle(
                              fontWeight: bold,
                              fontFamily: 'ProximaNova',
                              fontSize: 15,
                            ),
                          ),
                        );
                      }
                    } else {
                      return Text(
                          'Connection State: ${snapshot.connectionState}');
                    }
                  },
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 25, right: 25, bottom: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal treatment kamu',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 13,
                ),
                FutureBuilder(
                  future: state.getScheduleTreatment(context),
                  builder: (context, AsyncSnapshot snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          shimmerWidget(
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          shimmerWidget(
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          shimmerWidget(
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return state.dataScheduleTreatment.value.isEmpty
                            ? Column(
                                children: [
                                  Container(
                                    height: 95,
                                    width: 340,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 26, vertical: 30),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Catatan dokter terkait skingoal kamu',
                                          style: subTitleTextStyle,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'ChatDoctor',
                                            style: grenTextStyle.copyWith(
                                                fontSize: 15),
                                            children: [
                                              TextSpan(
                                                text: ' Sekarang, yuk!',
                                                style: blackRegulerTextStyle,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      'Belum ada jadwal treatment',
                                      style: TextStyle(
                                        fontWeight: bold,
                                        fontFamily: 'ProximaNova',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.dataScheduleTreatment.value.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    margin: const EdgeInsets.only(bottom: 8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text(
                                            //   'Konsultasi dengan',
                                            //   style: blackTextStyle.copyWith(
                                            //       fontSize: 13),
                                            // ),
                                            // const SizedBox(
                                            //   height: 5,
                                            // ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          '${Global.FILE}/${state.dataScheduleTreatment.value[index].treatment!.mediaTreatments?[0].media?.path}',
                                                        ),
                                                        fit: BoxFit.fill),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${state.dataScheduleTreatment.value[index].treatment!.name}',
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontSize: 13,
                                                        fontWeight: bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${state.dataScheduleTreatment.value[index].treatment!.clinic?.name}',
                                                      style:
                                                          blackRegulerTextStyle
                                                              .copyWith(
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 9,
                                                    ),
                                                    Text(
                                                      // 'Sel, 12 Mar 2023 17:30 WIB',
                                                      ConvertDate
                                                          .transactionDate(state
                                                              .dataScheduleTreatment
                                                              .value[index]
                                                              .createdAt
                                                              .toString()),
                                                      style: grenTextStyle
                                                          .copyWith(
                                                              fontSize: 11),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: state
                                                            .dataScheduleTreatment
                                                            .value[index]
                                                            .transactionTreatment
                                                            ?.status ==
                                                        'MENUNGGU_PEMBAYARAN'
                                                    ? const Color.fromARGB(
                                                        255, 255, 204, 170)
                                                    : state
                                                                .dataScheduleTreatment
                                                                .value[index]
                                                                .transactionTreatment
                                                                ?.status ==
                                                            'MENUNGGU_KONFIRMASI_KLINIK'
                                                        ? const Color.fromARGB(
                                                            255, 255, 204, 170)
                                                        : state
                                                                    .dataScheduleTreatment
                                                                    .value[
                                                                        index]
                                                                    .transactionTreatment
                                                                    ?.status ==
                                                                'KLINIK_MENGKONFIRMASI'
                                                            ? subgreenColor
                                                            : state
                                                                        .dataScheduleTreatment
                                                                        .value[
                                                                            index]
                                                                        .transactionTreatment
                                                                        ?.status ==
                                                                    'SELESAI'
                                                                ? subgreenColor
                                                                : subgreenColor,
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              height: 25,
                                              width: 74,
                                              child: Center(
                                                child: Text(
                                                  state
                                                              .dataScheduleTreatment
                                                              .value[index]
                                                              .transactionTreatment
                                                              ?.status ==
                                                          'MENUNGGU_PEMBAYARAN'
                                                      ? 'Menunggu Pembayaran'
                                                      : state
                                                                  .dataScheduleTreatment
                                                                  .value[index]
                                                                  .transactionTreatment
                                                                  ?.status ==
                                                              'MENUNGGU_KONFIRMASI_KLINIK'
                                                          ? 'Menunggu Konfirmasi Klinik'
                                                          : state
                                                                      .dataScheduleTreatment
                                                                      .value[
                                                                          index]
                                                                      .transactionTreatment
                                                                      ?.status ==
                                                                  'KLINIK_MENGKONFIRMASI'
                                                              ? 'Klinik Mengkonfirmasi'
                                                              : state
                                                                          .dataScheduleTreatment
                                                                          .value[
                                                                              index]
                                                                          .transactionTreatment
                                                                          ?.status ==
                                                                      'SELESAI'
                                                                  ? 'Selesai'
                                                                  : '-',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    fontSize: 10,
                                                    color: state
                                                                .dataScheduleTreatment
                                                                .value[index]
                                                                .transactionTreatment
                                                                ?.status ==
                                                            'MENUNGGU_PEMBAYARAN'
                                                        ? const Color.fromARGB(
                                                            255, 255, 102, 0)
                                                        : state
                                                                    .dataScheduleTreatment
                                                                    .value[
                                                                        index]
                                                                    .transactionTreatment
                                                                    ?.status ==
                                                                'MENUNGGU_KONFIRMASI_KLINIK'
                                                            ? const Color.fromARGB(
                                                                255, 255, 102, 0)
                                                            : state
                                                                        .dataScheduleTreatment
                                                                        .value[
                                                                            index]
                                                                        .transactionTreatment
                                                                        ?.status ==
                                                                    'KLINIK_MENGKONFIRMASI'
                                                                ? greenColor
                                                                : state
                                                                            .dataScheduleTreatment
                                                                            .value[index]
                                                                            .transactionTreatment
                                                                            ?.status ==
                                                                        'SELESAI'
                                                                    ? greenColor
                                                                    : greenColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: whiteColor,
                                                border: Border.all(
                                                    color: greenColor),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              height: 25,
                                              width: 74,
                                              child: Center(
                                                child: Text(
                                                  'Chat Ulang',
                                                  style: grenTextStyle.copyWith(
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                      } else {
                        return Center(
                          child: Text(
                            'Belum ada jadwal treatment',
                            style: TextStyle(
                              fontWeight: bold,
                              fontFamily: 'ProximaNova',
                              fontSize: 15,
                            ),
                          ),
                        );
                      }
                    } else {
                      return Text(
                          'Connection State: ${snapshot.connectionState}');
                    }
                  },
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Artikel ini mungkin relate buat kamu',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabBarCustomer(
                            currentIndex: 2,
                            streamIndex: 1,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: greenColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: FutureBuilder(
                future: stateNews.getArticle(context, '', ''),
                builder: (context, AsyncSnapshot<ArticleModel?> snapshot) {
                  if (!snapshot.hasData) {
                    return shimmerWidget(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                  }
                  return snapshot.data!.record!.isEmpty
                      ? shimmerWidget(
                          child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int index = 0;
                                index < snapshot.data!.record!.length;
                                index++)
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    ViewDetailBeutyStreamPage(
                                      categoryId: snapshot
                                          .data!.record![index].newscategoryId
                                          .toString(),
                                      category: stateNews
                                          .categoryArticle[index].category
                                          .toString(),
                                      detailNews: snapshot.data!.record![index],
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 250,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                snapshot.data!.record![index]
                                                    .thumbLink
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            snapshot.data!.record![index].title
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'ProximaNova',
                                            ),
                                            strutStyle: StrutStyle(
                                              height: 0.5,
                                              leading: 0.7,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                ConvertDate.defaultDate(snapshot
                                                    .data!
                                                    .record![index]
                                                    .newsDate
                                                    .toString()),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/icons/dot.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.record![index].author
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
