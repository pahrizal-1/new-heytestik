// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/models/customer/recent_chat_customer_model.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

class ListChatPage extends StatefulWidget {
  RecentChatCustomerModel? recentChat;
  ListChatPage({required this.recentChat, super.key});

  @override
  State<ListChatPage> createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ListChatPage> {
  final ConsultationController state = Get.put(ConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: widget.recentChat!.data!.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada chat konsultasi',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.recentChat!.data!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return DoctorChat(
                      ontap: () {
                        print("chat");
                      },
                      doctorId:
                          state.recentChat.value!.data![i].doctorId!.toInt(),
                      doctorName:
                          state.recentChat.value!.data?[i].doctor?.fullname ??
                              '',
                      chat:
                          state.recentChat.value!.data?[i].lastChat?.message ??
                              '',
                      img: 'assets/images/doctor-img.png',
                      time: '11:09 AM',
                      roomCode:
                          state.recentChat.value!.data![i].code.toString(),
                      seen: state.recentChat.value!.data![i].lastChat!.seen ??
                          false,
                      valueChat: state.recentChat.value!.data?[i].unseenCount
                          .toString(),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class DoctorChat extends StatelessWidget {
  final int doctorId;
  final String doctorName;
  final VoidCallback? ontap;
  final String chat;
  final String img;
  final String time;
  final String roomCode;
  // final Color? colorTanggal;
  final String? valueChat;
  final bool seen;
  const DoctorChat({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.chat,
    required this.img,
    required this.time,
    required this.roomCode,
    this.valueChat = '',
    // this.colorTanggal,
    this.ontap,
    required this.seen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: lsymetric.copyWith(top: 30),
      child: InkWell(
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRect(
              child: Image.asset(
                img,
                width: 52,
                height: 52,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      chat,
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: grenTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                    color: seen ? greyColor : greenColor,
                  ),
                ),
                seen
                    ? Container()
                    : const SizedBox(
                        height: 9,
                      ),
                seen
                    ? Container()
                    : Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                            color: greenColor, shape: BoxShape.circle),
                        child: Text(
                          valueChat.toString(),
                          style: whiteTextStyle.copyWith(
                              fontSize: 12, color: whiteColor),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
