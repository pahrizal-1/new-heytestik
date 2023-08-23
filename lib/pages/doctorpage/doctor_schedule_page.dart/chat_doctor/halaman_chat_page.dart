import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/models/doctor/current_schedule_model.dart';
import 'package:heystetik_mobileapps/widget/chat_doctor_widget.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

import '../../../../core/global.dart';
import '../../../../service/doctor/consultation/notif_service.dart';
import '../../../../theme/theme.dart';
import 'chat_doctor.dart';

class HalamanChatPage extends StatefulWidget {
  const HalamanChatPage({super.key});

  @override
  State<HalamanChatPage> createState() => _HalamanChatPageState();
}

class _HalamanChatPageState extends State<HalamanChatPage> {
  final DoctorConsultationController state =
      Get.put(DoctorConsultationController());
  bool isSelcted = false;
  late final NotificationService notificationService;

  @override
  void initState() {
    super.initState();
    state.getListRecentChat(context);
    LocalNotificationService.initialize();
    notificationService = NotificationService();
    notificationService.initializePlatformNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 275,
              color: whiteColor,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 156,
                    color: greenColor,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/logoheystetik.png',
                          width: 122,
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: state.getCurrentDoctorSchedule(context),
                    builder: (context,
                        AsyncSnapshot<CurrentDoctorScheduleModel?> snapshot) {
                      print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Positioned(
                          left: 20,
                          right: 20,
                          top: 112,
                          child: shimmerWidget(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: whiteColor,
                              ),
                            ),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Positioned(
                            left: 20,
                            right: 20,
                            top: 112,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              // height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: whiteColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 18),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Jadwal Saya hari ini',
                                          style: blackHigtTextStyle.copyWith(
                                              fontSize: 15),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            notificationService
                                                .showLocalNotification(
                                              id: 0,
                                              title: "Time's up",
                                              body:
                                                  "Get back to productive activities",
                                            );
                                          },
                                          child: Text(
                                            'Atur Jadwal',
                                            style: grenTextStyle.copyWith(
                                                fontSize: 15),
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: greenColor,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Obx(
                                      () => currentSchedule(
                                        state.isFirstSchedule.value,
                                        state.isFirstSchedule.value
                                            ? 'Online'
                                            : 'Jam pertama',
                                        state.startTime.value,
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Obx(
                                      () => currentSchedule(
                                        state.isSecondSchedule.value,
                                        state.isSecondSchedule.value
                                            ? 'Online'
                                            : 'Jam berikutnya',
                                        state.endTime.value,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Center(
                            child: Text(
                              'Tidak ada jadwal',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jawab Chat Pasien ',
                      style: blackTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              state.wigetIndex.value = 0;
                            },
                            child: Obx(
                              () => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Aktif (${state.totalRecentChatActive.value})',
                                        style: grenTextStyle.copyWith(
                                            fontSize: 15,
                                            color: state.wigetIndex.value == 0
                                                ? greenColor
                                                : greyColor),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: state.wigetIndex.value == 0
                                        ? greenColor
                                        : const Color(0xffD9D9D9),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              state.wigetIndex.value = 1;
                            },
                            child: Obx(
                              () => Column(
                                children: [
                                  Text(
                                    'Selesai',
                                    style: greyTextStyle.copyWith(
                                        fontSize: 15,
                                        color: state.wigetIndex.value == 1
                                            ? greenColor
                                            : greyColor),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: state.wigetIndex.value == 1
                                        ? greenColor
                                        : const Color(0xffD9D9D9),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Obx(
                      () => state.wigetIndex.value == 0 ? isActive() : isDone(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget currentSchedule(bool isCurrent, String title, String time) {
    return Row(
      children: [
        isCurrent
            ? Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              )
            : Container(),
        isCurrent
            ? const SizedBox(
                width: 11,
              )
            : Container(),
        Text(
          title,
          style: subTitleTextStyle.copyWith(fontSize: 15),
        ),
        const Spacer(),
        Text(
          time,
          style: subTitleTextStyle.copyWith(fontSize: 15),
        ),
      ],
    );
  }

  Widget isActive() {
    return Obx(
      () => state.totalRecentChatActive.value == 0
          ? Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(
                child: Text(
                  'Belum ada chat konsultasi aktif',
                  style: TextStyle(
                    fontWeight: bold,
                    fontFamily: 'ProximaNova',
                    fontSize: 15,
                  ),
                ),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.totalRecentChatActive.value,
              itemBuilder: (BuildContext context, int i) {
                return InkWell(
                  onTap: () async {
                    print('per ${state.recentChatActive[i].id}');
                    String refresh = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDoctorPage(
                            roomCode: state.recentChatActive[i].code.toString(),
                            senderBy:
                                state.recentChatActive[i].doctor!.fullname ??
                                    '-',
                            receiverBy:
                                state.recentChatActive[i].customer!.fullname ??
                                    '-',
                            roomId: state.recentChatActive[i].id!.toInt(),
                            senderId:
                                state.recentChatActive[i].doctorId!.toInt(),
                            receiverId:
                                state.recentChatActive[i].customerId!.toInt(),
                            id: state.recentChatActive[i].id!.toInt(),
                          ),
                        ));

                    if (refresh == 'refresh') {
                      setState(() {
                        state.getListRecentChat(context);
                      });
                    }
                  },
                  child: ChatAktif(
                    id: state.recentChatActive[i].id!.toInt(),
                    roomCode: state.recentChatActive[i].code.toString(),
                    roomId: state.recentChatActive[i].id!.toInt(),
                    customerName:
                        state.recentChatActive[i].customer!.fullname ?? '-',
                    doctorName:
                        state.recentChatActive[i].doctor!.fullname ?? '-',
                    subNameTitle: '22 tahun; Korektif Wajah - Bekas Jerawat',
                    img: '${Global.FILE}/' + state.recentChatActive[i].customer!.mediaUserProfilePicture!.media!.path!,
                    // img:
                    //     '${Global.FILE}${state.recentChatActive[i].customer?.photoProfile}',
                    time: CurrentTime.timeChat(state
                        .recentChatActive[i].lastChat!.createdAt
                        .toString()),
                    valueChat: state.recentChatActive[i].unseenCount.toString(),
                    chat: state.recentChatActive[i].lastChat!.message ?? '-',
                    seen: state.recentChatActive[i].lastChat!.seen ?? false,
                    isMe: state.recentChatActive[i].lastChat!.senderId ==
                                state.doctorId.value ||
                            state.recentChatActive[i].lastChat!.senderId == 0
                        ? true
                        : false,
                    senderId: state.recentChatActive[i].doctorId!.toInt(),
                    receiverId: state.recentChatActive[i].customerId!.toInt(),
                  ),
                );
              },
            ),
    );
  }

  Widget isDone() {
    return Obx(
      () => state.totalRecentChatDone.value == 0
          ? Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(
                child: Text(
                  'Belum ada chat konsultasi yang selesai',
                  style: TextStyle(
                    fontWeight: bold,
                    fontFamily: 'ProximaNova',
                    fontSize: 15,
                  ),
                ),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.totalRecentChatDone.value,
              itemBuilder: (BuildContext context, int i) {
                return ChatAktif(
                  id: state.recentChatActive[i].id!.toInt(),
                  roomCode: state.recentChatDone[i].code.toString(),
                  roomId: state.recentChatDone[i].id!.toInt(),
                  customerName:
                      state.recentChatDone[i].customer!.fullname ?? '-',
                  doctorName: '',
                  subNameTitle: '22 tahun; Korektif Wajah - Bekas Jerawat',
                  img: 'assets/icons/logo.png',
                  // img:
                  //     '${Global.FILE}${state.recentChatActive[i].customer?.photoProfile}',
                  chat: state.recentChatDone[i].lastChat!.message ?? '-',
                  // topic: 'Licorice',
                  time: CurrentTime.timeChat(
                      state.recentChatDone[i].createdAt.toString()),

                  seen: state.recentChatDone[i].lastChat!.seen ?? false,
                  valueChat: state.recentChatDone[i].unseenCount.toString(),
                  isMe: state.recentChatDone[i].lastChat!.senderId ==
                              state.doctorId.value ||
                          state.recentChatDone[i].lastChat!.senderId == 0
                      ? true
                      : false,
                  senderId: state.recentChatDone[i].lastChat!.senderId!.toInt(),
                  receiverId:
                      state.recentChatDone[i].lastChat!.receiverId!.toInt(),
                );
              },
            ),
    );
  }
}
