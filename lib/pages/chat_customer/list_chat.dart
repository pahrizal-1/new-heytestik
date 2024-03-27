// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:intl/intl.dart';

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
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.recentChat!.data!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return DoctorChat(
                      ontap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return ChatCostomerPage(
                                id: state.recentChat.value!.data![i].id!.toInt(),
                                // roomId: state.recentChat.value!.data![i].id!
                                //     .toInt(),
                                roomCode: state.recentChat.value!.data![i].code.toString(),

                                // senderId: state
                                //     .recentChat.value!.data![i].customerId!
                                //     .toInt(),
                                // receiverId: state
                                //     .recentChat.value!.data![i].doctorId!
                                //     .toInt(),
                                // sendBy: state.recentChat.value!.data![i]
                                //     .customer!.fullname
                                //     .toString(),
                                // receiverBy: state
                                //     .recentChat.value!.data![i].doctor!.fullname
                                //     .toString(),
                                // image: state.recentChat.value!.data![i].doctor!
                                //             .mediaUserProfilePicture ==
                                //         null
                                //     ? 'https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg'
                                //     : '${Global.FILE}/' +
                                //         state
                                //             .recentChat
                                //             .value!
                                //             .data![i]
                                //             .doctor!
                                //             .mediaUserProfilePicture!
                                //             .media!
                                //             .path!,
                              );
                            }),
                          ),
                        ).then((value) {
                          setState(() {
                            state.getRecentChat(context, search: search);
                          });
                        });
                      },
                      // doctorId:
                      //     state.recentChat.value!.data![i].doctorId!.toInt(),
                      doctorName: state.recentChat.value!.data?[i].doctor?.fullname ?? '',
                      chat: state.recentChat.value!.data?[i].lastChat!.message == '#####' ? state.recentChat.value!.data![i].lastChat!.message = 'Resep Obat ' : state.recentChat.value!.data?[i].lastChat!.message ?? '-',
                      // img: 'https://asset.kompas.com/crops/xxJOBtGmPRnsYjmTJu1Od6MnlhU=/153x0:1773x1080/1200x800/data/photo/2022/08/08/62f07b64afff9.jpg',
                      img: state.recentChat.value!.data![i].doctor!.mediaUserProfilePicture == null ? 'https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg' : '${Global.FILE}/' + state.recentChat.value!.data![i].doctor!.mediaUserProfilePicture!.media!.path!,
                      time: DateFormat('HH:mm').format(DateTime.parse('${state.recentChat.value!.data![i].lastChat!.createdAt}').toUtc().add(Duration(hours: 7, minutes: 00))),

                      // roomCode:
                      //     state.recentChat.value!.data![i].code.toString(),
                      seen: state.recentChat.value!.data![i].lastChat!.seen ?? false,
                      valueChat: state.recentChat.value!.data?[i].unseenCount.toString(),
                      isMe: state.recentChat.value?.data?[i].lastChat!.senderId == state.customerId.value ? true : false,
                      status: state.recentChat.value!.data![i].ended == true ? true : false,
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
  final bool status;
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
    required this.status,
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
                          fit: BoxFit.cover,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Color(0xff24A7A0).withOpacity(0.1),
                      ),
                      child: Text(
                        status ? 'Selesai' : 'Aktif',
                        style: grenTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
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
                            decoration: BoxDecoration(color: greenColor, shape: BoxShape.circle),
                            child: Text(
                              valueChat.toString(),
                              style: whiteTextStyle.copyWith(fontSize: 12, color: whiteColor),
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

class ChatIsDone extends StatelessWidget {
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
  final bool status;
  const ChatIsDone({
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
    required this.status,
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
                          fit: BoxFit.cover,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Color(0xff24A7A0).withOpacity(0.1),
                      ),
                      child: Text(
                        status ? 'Selesai' : 'Aktif',
                        style: grenTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
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
                            decoration: BoxDecoration(color: greenColor, shape: BoxShape.circle),
                            child: Text(
                              valueChat.toString(),
                              style: whiteTextStyle.copyWith(fontSize: 12, color: whiteColor),
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
