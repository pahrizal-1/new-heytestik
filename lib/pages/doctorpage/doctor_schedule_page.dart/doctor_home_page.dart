import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:heystetik_mobileapps/controller/doctor/home/home_controller.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/notification_doctor_page.dart';
import 'package:heystetik_mobileapps/service/doctor/consultation/notif_service.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/filter_jadwal_doctor.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:intl/intl.dart';

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../core/global.dart';

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
  final NotificationController stateNotif = Get.put(NotificationController());

  IO.Socket? _socket;
  Timer? timer;
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void initFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.toMap()}');

      if (message.notification != null) {
        state.isNotifications.value = true;
        print('Message also contained a notification: ${message.notification?.toMap()}');
      }
    });
  }

  void message() {
    NotificationService().showLocalNotification(
      id: 0,
      title: "Time's up",
      body: "Get back to productive activities",
    );
    setState(() {
      state.isNotifications.value = true;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.init(context);
      stateProfile.getProfile(context);
    });

    // setupInteractedMessage();
    // message();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async {
          await state.init(context);
        },
        child: LoadingWidget(
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
                      fit: BoxFit.fill,
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
                            Obx(
                              () => Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: stateProfile.imgNetwork.value != "" ? NetworkImage('${Global.FILE}/${stateProfile.imgNetwork.value}') as ImageProvider : AssetImage('assets/images/profiledummy.png'),
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
                              child: state.isNotifications.isTrue
                                  ? Container(
                                      height: paddingL,
                                      width: paddingL,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/icons/notification-dot.png',
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: paddingL,
                                      width: paddingL,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/icons/ic_notif.png',
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
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(25),
                          topStart: Radius.circular(25),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return FilterJadwalDoctor();
                      },
                    );
                  },
                  child: Padding(
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
                                  'Belum ada jadwal',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 20,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/calender-logo.png',
                            width: 20,
                            color: greenColor,
                          ),
                          const SizedBox(
                            width: 12,
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
                      // FutureBuilder(future: state.getDoctorSchedule(context), builder: (context, snapshot) {
                      //   if(snapshot.connectionState == ConnectionState.waiting){
                      //     return Center(child: CircularProgressIndicator(),);
                      //   }
                      //   if(snapshot.connectionState == ConnectionState.done){
                      //     if(snapshot.hasData){
                      //       return ListView.builder(
                      //         shrinkWrap: true,
                      //         keyboardDismissBehavior:
                      //             ScrollViewKeyboardDismissBehavior.onDrag,
                      //         physics: const NeverScrollableScrollPhysics(),
                      //         itemCount: state.totalFindSchedule.value,
                      //         itemBuilder: (BuildContext context, int i) {
                      //           return Container(
                      //             margin: EdgeInsets.only(bottom: 10),
                      //             decoration: BoxDecoration(
                      //               color: Colors.white,
                      //               borderRadius: BorderRadius.circular(10),
                      //             ),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(15),
                      //               child: Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     children: [
                      //                       Text(
                      //                         '${state.findSchedule.value?.data!.data?[i].customer?.fullname}',
                      //                         style: TextStyle(
                      //                           color: fromCssColor('#323232'),
                      //                           fontWeight: bold,
                      //                           fontFamily: 'ProximaNova',
                      //                           fontSize: 15,
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                         padding:
                      //                             const EdgeInsets.symmetric(
                      //                                 vertical: 10),
                      //                         child: Row(
                      //                           children: [
                      //                             Container(
                      //                               height: 10,
                      //                               width: 10,
                      //                               decoration: BoxDecoration(
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         5),
                      //                                 color: fromCssColor(
                      //                                     '#1ACE42'),
                      //                               ),
                      //                             ),
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets.only(
                      //                                       left: 5),
                      //                               child: Text(
                      //                                 '${CurrentTime.timeChat(state.findSchedule.value!.data!.data![i].createdAt.toString())} WIB',
                      //                                 style: TextStyle(
                      //                                   color: fromCssColor(
                      //                                       '#6B6B6B'),
                      //                                   fontFamily:
                      //                                       'ProximaNova',
                      //                                   fontSize: 13,
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             bottom: 5),
                      //                         child: Text(
                      //                           // 'test',
                      //                           'Category: ${state.findSchedule.value?.data!.data?[i].transactionConsultation?.medicalHistory?.interestCondition?.concern?.name}',
                      //                           style: TextStyle(
                      //                               fontFamily: 'ProximaNova',
                      //                               fontSize: 11,
                      //                               color: fromCssColor(
                      //                                   '#A3A3A3')),
                      //                         ),
                      //                       ),
                      //                       Text(
                      //                         // 'topic',
                      //                         'Topic: ${state.findSchedule.value?.data!.data?[i].transactionConsultation?.medicalHistory?.interestCondition?.concern?.segment}',
                      //                         style: TextStyle(
                      //                             fontFamily: 'ProximaNova',
                      //                             fontSize: 11,
                      //                             color:
                      //                                 fromCssColor('#A3A3A3')),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   state.findSchedule.value!.data!.data![i]
                      //                               .status ==
                      //                           'PENDING'
                      //                       ? InkWell(
                      //                           onTap: () {
                      //                             state.postApprove(
                      //                                 context,
                      //                                 state.findSchedule.value!
                      //                                     .data!.data![i].id!
                      //                                     .toInt());
                      //                             setState(() {
                      //                               state
                      //                                   .findSchedule
                      //                                   .value!
                      //                                   .data!
                      //                                   .data![i]
                      //                                   .status = 'DIAMBIL';

                      //                               showDialog(
                      //                                 context: context,
                      //                                 builder: (context) =>
                      //                                     AlertWidget(
                      //                                   subtitle:
                      //                                       'Silahkan Review Terlebih Dahulu Untuk Memulai Chat Dengan Customer',
                      //                                 ),
                      //                               );
                      //                             });
                      //                           },
                      //                           child: Container(
                      //                             height: 35,
                      //                             width: 80,
                      //                             decoration: BoxDecoration(
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       10),
                      //                               color:
                      //                                   fromCssColor('#5DA89C'),
                      //                             ),
                      //                             child: Center(
                      //                               child: Text(
                      //                                 'Terima',
                      //                                 style: TextStyle(
                      //                                   fontWeight: bold,
                      //                                   fontFamily:
                      //                                       'ProximaNova',
                      //                                   fontSize: 13,
                      //                                   color: Colors.white,
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         )
                      //                       : state.findSchedule.value!.data!
                      //                                   .data![i].status ==
                      //                               'DIAMBIL'
                      //                           ? InkWell(
                      //                               child: Container(
                      //                                 height: 35,
                      //                                 width: 80,
                      //                                 decoration: BoxDecoration(
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                   color: fromCssColor(
                      //                                       '#FFC36A'),
                      //                                 ),
                      //                                 child: Center(
                      //                                   child: Text(
                      //                                     'Diambil',
                      //                                     style: TextStyle(
                      //                                       fontWeight: bold,
                      //                                       fontFamily:
                      //                                           'ProximaNova',
                      //                                       fontSize: 13,
                      //                                       color: Colors.white,
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             )
                      //                           : Container(
                      //                               height: 35,
                      //                               width: 80,
                      //                               decoration: BoxDecoration(
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         10),
                      //                                 color: fromCssColor(
                      //                                     '#6B6B6B'),
                      //                               ),
                      //                               child: Center(
                      //                                 child: Text(
                      //                                   'Expired',
                      //                                   style: TextStyle(
                      //                                     fontWeight: bold,
                      //                                     fontFamily:
                      //                                         'ProximaNova',
                      //                                     fontSize: 13,
                      //                                     color: Colors.white,
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //       );
                      //     } else {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //           color: Colors.transparent,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             'Tidak ada jadwal',
                      //             style: TextStyle(
                      //               fontWeight: bold,
                      //               color: fromCssColor('#6B6B6B'),
                      //               fontSize: 20,
                      //               fontFamily: 'ProximaNova,',
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     }
                      //   }
                      //   return SizedBox();
                      // }),
                      state.totalFindSchedule.value == 0
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Belum ada jadwal',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 20,
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
                                  margin: EdgeInsets.only(bottom: 10),
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
                                                      "${DateFormat('HH:mm').format(DateTime.parse('${state.findSchedule.value!.data!.data![i].createdAt}').toUtc().add(Duration(hours: 7, minutes: 00)))} WIB",
                                                      // '${CurrentTime.timeChat(state.findSchedule.value!.data!.data![i].createdAt.toString())} WIB',
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
                                                // 'test',
                                                'Category: ${state.findSchedule.value?.data!.data?[i].transactionConsultation?.medicalHistory?.interestCondition?.concern?.name}',
                                                style: TextStyle(fontFamily: 'ProximaNova', fontSize: 11, color: fromCssColor('#A3A3A3')),
                                              ),
                                            ),
                                            Text(
                                              // 'topic',
                                              'Topic: ${state.findSchedule.value?.data!.data?[i].transactionConsultation?.medicalHistory?.interestCondition?.concern?.segment}',
                                              style: TextStyle(fontFamily: 'ProximaNova', fontSize: 11, color: fromCssColor('#A3A3A3')),
                                            ),
                                          ],
                                        ),
                                        state.findSchedule.value!.data!.data![i].status == 'PENDING'
                                            ? InkWell(
                                                onTap: () {
                                                  state.postApprove(context, state.findSchedule.value!.data!.data![i].id!.toInt());
                                                  setState(() {
                                                    state.findSchedule.value!.data!.data![i].status = 'DIAMBIL';

                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => AlertWidget(
                                                        subtitle: 'Silahkan Review Terlebih Dahulu Untuk Memulai Chat Dengan Customer',
                                                      ),
                                                    );
                                                  });
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
                                                        'Expired',
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
      ),
    );
  }
}
