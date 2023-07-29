import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/chat/chat_controller.dart';

// import '../controller/doctor/chat/chat_controller.dart';
import '../controller/doctor/consultation/consultation_controller.dart';
import '../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/balasan_chat_page.dart';
import '../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produck_doctor_page.dart';
import '../theme/theme.dart';

class ChatBottomNavigator extends StatelessWidget {
  final TextEditingController textC;
  final void Function()? onCamera;
  final void Function()? onGallery;
  final int? roomId, senderId, receiverId;
  final String? roomCode, senderBy, receiverBy;
  final void Function()? sendMsg;
  // final void Function()? sendMsgQuick;
  final void Function(String)? onChanged;

  const ChatBottomNavigator({
    Key? key,
    required this.textC,
    this.onCamera,
    this.onGallery,
    this.roomId,
    this.senderId,
    this.receiverId,
    this.roomCode,
    this.senderBy,
    this.receiverBy,
    this.sendMsg,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  controller: textC,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10000)),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0,
                      ),
                    ),
                    fillColor: whiteColor,
                    hintText: 'Messeges',
                    suffixIcon: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: PopupMenuButton(
                          icon: Image.asset(
                            'assets/icons/atement.png',
                            width: 20,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              height: 206,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BalasanCepatPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Balasan Cepat',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/lighr.png',
                                            color: whiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CatatanDocter(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Catatan Dokter &\nRekomendasi',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/book1.png',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: onCamera,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Camera',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                            height: 44,
                                            width: 44,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                                color: greenColor,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: onGallery,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Gallery',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                            height: 44,
                                            width: 44,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                                color: greenColor,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.insert_photo,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )),
                    hintStyle: subGreyTextStyle,
                  ),
                  onChanged: onChanged
                  // (value) async {
                  //   if (textC.text == '/') {
                  //     Get.put(DoctorConsultationController())
                  //         .isSuggestion
                  //         .value = true;
                  //     showBottomSheet(
                  //       context: context,
                  //       builder: (builder) => Obx(
                  //         () => Visibility(
                  //           visible: Get.put(DoctorConsultationController())
                  //               .isSuggestion
                  //               .value,
                  //           child: Container(
                  //             height: 150,
                  //             width: 420,
                  //             decoration: BoxDecoration(
                  //               color: Colors.grey[300],
                  //             ),
                  //             child: ListView.builder(
                  //                 shrinkWrap: true,
                  //                 itemCount:
                  //                     Get.put(DoctorConsultationController())
                  //                         .quickReplyChat
                  //                         .length,
                  //                 itemBuilder: ((context, index) {
                  //                   return GestureDetector(
                  //                     // onTap: () async {
                  //                     //   String desc = Get.put(
                  //                     //           DoctorConsultationController())
                  //                     //       .quickReplyChat[index]['message'];
                  //                     //     await sendMsg
                  //                     //   // await Get.put(
                  //                     //   //         DoctorConsultationController())
                  //                     //   //     .sendMessage(
                  //                     //   //         roomId!,
                  //                     //   //         roomId!,
                  //                     //   //         senderId!,
                  //                     //   //         receiverId!,
                  //                     //   //         roomCode!,
                  //                     //   //         desc,
                  //                     //   //         senderBy!,
                  //                     //   //         receiverBy!);
                  //                     //   Get.back();
                  //                     //   Get.put(DoctorConsultationController())
                  //                     //       .isSuggestion
                  //                     //       .value = false;
                  //                     // },
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Text(Get.put(
                  //                               DoctorConsultationController())
                  //                           .quickReplyChat[index]['shortcut']),
                  //                     ),
                  //                   );
                  //                 })),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   } else if (textC.text.isEmpty) {
                  //     Get.back();
                  //     Get.put(DoctorConsultationController())
                  //         .isSuggestion
                  //         .value = false;
                  //   }
                  // },
                ),
              ),
              InkWell(
                onTap: sendMsg,
                child: Image.asset(
                  'assets/icons/Group 461.png',
                  width: 40,
                ),
              )
            ],
          ),
        ));
  }
}

class ChatBottomCostomer extends StatelessWidget {
  final TextEditingController textC;
  final int? roomId, senderId, receiverId;
  final String? roomCode;
  final String? senderBy;
  final String? receiverBy;
  const ChatBottomCostomer({
    Key? key,
    required this.textC,
    this.roomId,
    this.senderId,
    this.receiverId,
    this.roomCode,
    this.senderBy,
    this.receiverBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                    controller: textC,
                    maxLines: 6,
                    minLines: 1,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10000)),
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          width: 0,
                        ),
                      ),
                      fillColor: whiteColor,
                      hintText: 'Messeges',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset(
                          'assets/icons/plus-icosn.png',
                          width: 16,
                        ),
                      ),
                      hintStyle: subGreyTextStyle,
                    ),
                    onChanged: (value) {
                      if (Get.put(CustomerChatController())
                          .messageController
                          .text
                          .isEmpty) {
                        Get.put(CustomerChatController())
                            .typing(false, 'RX65E1M8U9');
                      } else {
                        Get.put(CustomerChatController())
                            .typing(true, 'RX65E1M8U9');
                      }
                    }),
              ),
              InkWell(
                onTap: () {
                  Get.put(CustomerChatController()).sendMessage(
                      roomId!,
                      roomId!,
                      senderId!,
                      receiverId!,
                      roomCode!,
                      textC.text,
                      senderBy!,
                      receiverBy!);
                },
                child: Image.asset(
                  'assets/icons/Group 461.png',
                  width: 40,
                ),
              )
            ],
          ),
        ));
  }
}
