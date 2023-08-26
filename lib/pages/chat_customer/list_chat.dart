// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../core/global.dart';
import 'chat_contomer_page.dart';

class ListChatPage extends StatefulWidget {
  RecentChatModel? recentChat;
  ListChatPage({required this.recentChat, super.key});

  @override
  State<ListChatPage> createState() => _ListChatPageState();
}

class _ListChatPageState extends State<ListChatPage> {
  final ConsultationController state = Get.put(ConsultationController());
  String? search;

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
                      ontap: () async {
                        print(state
                            .recentChat.value!.data![i].lastChat!.senderId!);
                        print(state
                            .recentChat.value!.data![i].lastChat!.receiverId!);
                        print(state
                            .recentChat.value!.data![i].customer!.fullname);
                        print(
                            state.recentChat.value!.data![i].doctor!.fullname);
                        String refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return ChatCostomerPage(
                                id: state.recentChat.value!.data![i].id!
                                    .toInt(),
                                roomId: state.recentChat.value!.data![i].id!
                                    .toInt(),
                                roomCode: state.recentChat.value!.data![i].code
                                    .toString(),
                                senderId: state
                                    .recentChat.value!.data![i].customerId!
                                    .toInt(),
                                receiverId: state
                                    .recentChat.value!.data![i].doctorId!
                                    .toInt(),
                                sendBy: state.recentChat.value!.data![i]
                                    .customer!.fullname
                                    .toString(),
                                receiverBy: state
                                    .recentChat.value!.data![i].doctor!.fullname
                                    .toString(),
                              );
                            }),
                          ),
                        );
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getRecentChat(context, search: search);
                          });
                        }
                      },
                      // doctorId:
                      //     state.recentChat.value!.data![i].doctorId!.toInt(),
                      doctorName:
                          state.recentChat.value!.data?[i].doctor?.fullname ??
                              '',
                      chat:
                          state.recentChat.value!.data?[i].lastChat?.message ??
                              '',
                      // img: 'https://asset.kompas.com/crops/xxJOBtGmPRnsYjmTJu1Od6MnlhU=/153x0:1773x1080/1200x800/data/photo/2022/08/08/62f07b64afff9.jpg',
                      img: '${Global.FILE}/' +
                          state.recentChat.value!.data![i].doctor!
                              .mediaUserProfilePicture!.media!.path!,
                      time: CurrentTime.timeChat(
                        state.recentChat.value!.data![i].lastChat!.createdAt
                            .toString(),
                      ),
                      // roomCode:
                      //     state.recentChat.value!.data![i].code.toString(),
                      seen: state.recentChat.value!.data![i].lastChat!.seen ??
                          false,
                      valueChat: state.recentChat.value!.data?[i].unseenCount
                          .toString(),
                      isMe:
                          state.recentChat.value?.data?[i].lastChat!.senderId ==
                                  state.customerId.value
                              ? true
                              : false,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class DoctorChat extends StatelessWidget {
  // final int doctorId;
  final String doctorName;
  final VoidCallback? ontap;
  final String chat;
  final String img;
  final String time;
  // final String roomCode;
  final bool isMe;
  // final Color? colorTanggal;
  final String? valueChat;
  final bool seen;
  const DoctorChat({
    super.key,
    // required this.doctorId,
    required this.doctorName,
    required this.chat,
    required this.img,
    required this.time,
    // required this.roomCode,
    this.valueChat = '',
    // this.colorTanggal,
    this.ontap,
    required this.seen,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: lsymetric.copyWith(top: 30),
      child: InkWell(
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRect(
              child: img != null
                  ? Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            img,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Image.asset(
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
                const SizedBox(
                  height: 8,
                ),
                isMe
                    ? Image.asset(
                        'assets/images/logo_cheac_wa.png',
                        width: 20,
                        color: seen ? null : greyColor,
                      )
                    : seen
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
