import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/home/home_controller.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/notification_doctor_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../core/global.dart';
import '../../../core/local_storage.dart';

class HomePageDoctor extends StatefulWidget {
  const HomePageDoctor({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageDoctor> createState() => _HomePageDoctorState();
}

class _HomePageDoctorState extends State<HomePageDoctor> {
  final DoctorHomeController state = Get.put(DoctorHomeController());
  final DoctorProfileController stateProfile = Get.put(DoctorProfileController());

  IO.Socket? _socket;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    state.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingWidget(
        isLoading: state.isLoading.value,
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg-doctoe-home.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: stateProfile.profileData.value.data != null ? NetworkImage('${Global.FILE}/${stateProfile.profileData.value.data!.mediaUserProfilePicture!.media!.path}') as ImageProvider : AssetImage('assets/images/doctor1.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15, left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hai,',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'ProximaNova',
                                        color: whiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Obx(
                                      () => Text(
                                        stateProfile.profileData.value.data != null ? stateProfile.profileData.value.data!.fullname.toString() : '-',
                                        style: TextStyle(
                                          fontWeight: bold,
                                          fontFamily: 'ProximaNova',
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NotificationDoctorPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: paddingL,
                              width: paddingL,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/icons/notification-dot.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  transform: Matrix4.translationValues(0, -45, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: paddingL, bottom: paddingL),
                    child: Center(
                      child: state.startTime.value.isEmpty
                          ? Text(
                              'Tidak ada jadwal',
                              style: TextStyle(
                                fontWeight: bold,
                                color: fromCssColor('#6B6B6B'),
                                fontSize: 20,
                                fontFamily: 'ProximaNova,',
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () => Text(
                                    'Jadwal Hari ini, ${state.today.value}',
                                    style: TextStyle(
                                      fontWeight: bold,
                                      color: fromCssColor('#6B6B6B'),
                                      fontSize: 16,
                                      fontFamily: 'ProximaNova,',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Obx(
                                  () => Text(
                                    state.isFirstSchedule.value
                                        ? state.startTime.value
                                        : state.isSecondSchedule.value
                                            ? state.endTime.value
                                            : 'Istirahat',
                                    style: TextStyle(
                                      fontWeight: bold,
                                      fontSize: paddingL,
                                      color: fromCssColor('#5DA89C'),
                                      fontFamily: 'ProximaNova,',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 23,
                          width: paddingL,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/calender-logo.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Jadwal Konsultasi Dengan Pasien',
                          style: TextStyle(
                            fontWeight: bold,
                            fontFamily: 'ProximaNova',
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: spaceHeigt,
                    ),
                    state.totalFindSchedule.value == 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Tidak ada jadwal',
                                style: TextStyle(
                                  fontWeight: bold,
                                  color: fromCssColor('#6B6B6B'),
                                  fontSize: 20,
                                  fontFamily: 'ProximaNova,',
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.totalFindSchedule.value,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${state.findSchedule.value?.data!.data?[i].customer?.fullname}',
                                            style: TextStyle(
                                              color: fromCssColor('#323232'),
                                              fontWeight: bold,
                                              fontFamily: 'ProximaNova',
                                              fontSize: 15,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 10,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: fromCssColor('#1ACE42'),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    '${CurrentTime.timeChat(state.findSchedule.value!.data!.data![i].createdAt.toString())} WIB',
                                                    style: TextStyle(
                                                      color: fromCssColor('#6B6B6B'),
                                                      fontFamily: 'ProximaNova',
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              'Category: ${state.findSchedule.value?.data!.data?[i].transactionConsultation?.medicalHistory?.interestCondition?.category?.name}',
                                              style: TextStyle(fontFamily: 'ProximaNova', fontSize: 11, color: fromCssColor('#A3A3A3')),
                                            ),
                                          ),
                                          Text(
                                            'Topic: ${state.findSchedule.value?.data!.data?[i].transactionConsultation?.medicalHistory?.interestCondition?.name}',
                                            style: TextStyle(fontFamily: 'ProximaNova', fontSize: 11, color: fromCssColor('#A3A3A3')),
                                          ),
                                        ],
                                      ),
                                      state.findSchedule.value!.data!.data![i].status == 'PENDING'
                                          ? InkWell(
                                              onTap: () {
                                                state.postApprove(context, state.findSchedule.value!.data!.data![i].id!.toInt());
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: fromCssColor('#5DA89C'),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Terima',
                                                    style: TextStyle(
                                                      fontWeight: bold,
                                                      fontFamily: 'ProximaNova',
                                                      fontSize: 13,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : state.findSchedule.value!.data!.data![i].status == 'DIAMBIL'
                                              ? InkWell(
                                                  child: Container(
                                                    height: 35,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: fromCssColor('#FFC36A'),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Diambil',
                                                        style: TextStyle(
                                                          fontWeight: bold,
                                                          fontFamily: 'ProximaNova',
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: 35,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: fromCssColor('#6B6B6B'),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Expire',
                                                      style: TextStyle(
                                                        fontWeight: bold,
                                                        fontFamily: 'ProximaNova',
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
