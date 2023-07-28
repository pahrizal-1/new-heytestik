import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/detail_pasien_page.dart';
import 'package:heystetik_mobileapps/widget/chat_widget.dart';
import 'package:intl/intl.dart';

import '../../../../controller/doctor/chat/chat_controller.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/preview_widget.dart';
import '../../../../widget/rekomedasi_chat_widget.dart';
import '../../../../widget/text_button_vaigator.dart';

class ChatDoctorPage extends StatefulWidget {
  final String roomCode;
  final String sendBy;
  final String receiverBy;
  final int roomId;
  final int senderId;
  final int receiverId;
  ChatDoctorPage({
    super.key,
    required this.roomCode,
    required this.sendBy,
    required this.receiverBy,
    required this.roomId,
    required this.senderId,
    required this.receiverId,
  });

  @override
  State<ChatDoctorPage> createState() => _ChatDoctorPageState();
}

class _ChatDoctorPageState extends State<ChatDoctorPage> {
  bool isVisibeliti = true;
  bool clik = true;
  final DoctorChatController state = Get.put(DoctorChatController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // state.getLastChat();
    state.getRequest(widget.roomCode);
    state.connectSocket(context, widget.receiverBy);
    state.joinRoom(widget.roomCode);
    state.readMessage(widget.roomCode);
    state.quickReply();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        state.getRequest(widget.roomCode);
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: clik
            ? Image.asset(
                'assets/icons/logoheystetik.png',
                width: 108,
              )
            : Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    child: Text(
                      'Search',
                      style: blackTextStyle.copyWith(
                          fontSize: 17, fontWeight: regular),
                    ),
                  )
                ],
              ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                clik = !clik;
              });
              print('test room code' + widget.roomCode.toString());
              print('test sender id' + widget.senderId.toString());
              print('test receiver id' + widget.receiverId.toString());
            },
            child: Padding(
              padding: lsymetric,
              child: clik
                  ? Icon(
                      Icons.search,
                      size: 30,
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                    ),
            ),
          )
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: Container(
            height: 75.0,
            color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            state.listLastChat.value = [];
                            state.selectedMultipleImage = [];
                            state.fileImage = [];
                            state.leaveRoom(widget.roomCode);
                            state.close();
                          },
                          child: Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 21,
                      ),
                      Text(
                        widget.receiverBy,
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailPasienPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 25,
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              'Detail Pasien',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                  child: Obx(() => Text(
                        state.isOnline.value && state.isTyping.value
                            ? 'Mengetik . . .'
                            : state.isOnline.value
                                ? 'Online'
                                : '',
                        style: blackTextStyle.copyWith(fontSize: 13),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
          child: Column(
            children: [
              Container(
                height: 20,
                width: 62,
                decoration: BoxDecoration(
                    color: subwhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'Hari Ini',
                    style: blackTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              // Container(
              //   padding:
              //       EdgeInsets.only(left: 18, right: 18, top: 11, bottom: 11),
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     color: Color(
              //       0XFFF1F1F1,
              //     ),
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(0),
              //       topRight: Radius.circular(10),
              //       bottomRight: Radius.circular(10),
              //       bottomLeft: Radius.circular(10),
              //     ),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       // Text(
              //       //   'Hai Dokter !',
              //       //   style: blackHigtTextStyle.copyWith(
              //       //     fontSize: 20,
              //       //   ),
              //       // ),
              //       // Text(
              //       //   'Untuk memaksimalkan solusi yang akan diberikan buat pasien, mohon dibaca dan dipahami dulu pre-assessment yang telah diisi oleh pasienya ya, dok :)',
              //       //   style: subGreyTextStyle.copyWith(fontSize: 15),
              //       // ),
              //       // SizedBox(
              //       //   height: 20,
              //       // ),
              //       // Row(
              //       //   crossAxisAlignment: CrossAxisAlignment.start,
              //       //   children: [
              //       //     Text(
              //       //       'Silakan klik "',
              //       //       style: subGreyTextStyle.copyWith(fontSize: 15),
              //       //     ),
              //       //     Text(
              //       //       'Detail Pesanan',
              //       //       style: grenTextStyle.copyWith(fontSize: 15),
              //       //     ),
              //       //     Text(
              //       //       '" Di atas.',
              //       //       style: subGreyTextStyle.copyWith(
              //       //         fontSize: 15,
              //       //       ),
              //       //     )
              //       //   ],
              //       // ),
              //       // Text(
              //       //   'Terima Kasih\nSelamat bertugas Dokter! 🥰',
              //       //   style: subGreyTextStyle.copyWith(
              //       //     fontSize: 15,
              //       //   ),
              //       // ),
              //       // Row(
              //       //   mainAxisAlignment: MainAxisAlignment.end,
              //       //   children: [
              //       //     Text(
              //       //       '08:15',
              //       //       style: greyTextStyle,
              //       //     )
              //       //   ],
              //       // )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 8,
              ),
              Obx(() {
                return Container(
                  // height: 1000,
                  child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: state.listLastChat.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (buildex, index) {
                        var formatter = new DateFormat('dd-MM-yyyy');
                        String formattedTime = DateFormat('kk:mm').format(
                            DateTime.parse(state.listLastChat[index]
                                    ['created_at']
                                .toString()));

                        if (state.listLastChat[index]['id'] == widget.roomId &&
                            state.listLastChat[index]['sender_id'] == 0) {
                          return ChatLeft(
                            // imgDoctor: 'assets/icons/logo.png',
                            // nameDoctor: 'Rina Rasmalina',
                            timetitle: formattedTime,
                            color: subwhiteColor,
                            title: state.listLastChat[index]['message'],
                          );
                        } else if (state.listLastChat[index]['sender_id'] ==
                                widget.senderId &&
                            state.listLastChat[index]['media_chat_messages']
                                .isEmpty) {
                          return ChatRight(
                            imgUser: 'assets/images/doctor-img.png',
                            // imgData: state.listLastChat[index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + state.listLastChat[index]['media_chat_messages'][index]['media']['path'] : '',
                            nameUser: widget.sendBy,
                            timetitle: formattedTime,
                            color: subgreenColor,
                            title: state.listLastChat[index]['message'],
                          );
                        } else if (state.listLastChat[index]['sender_id'] ==
                                widget.senderId &&
                            state.listLastChat[index]['media_chat_messages']
                                .isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: () {
                                final dateTime = DateTime.now();
                                final stringDateTime =
                                    dateTime.toIso8601String();
                                final parsedDateTime =
                                    DateTime.parse(stringDateTime);

                                var dateFormatted =
                                    DateFormat("yyyy-MM-dd-HH:mm:ss")
                                        .format(DateTime.now());
                                print('hsail date ' + dateFormatted.toString());
                                print('hsail format ' +
                                    dateTime.timeZoneOffset.toString());
                              },
                              child: state
                                          .listLastChat[index]
                                              ['media_chat_messages']
                                          .length <
                                      1
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          top: 11,
                                          right: 12,
                                          bottom: 7),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: subgreenColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(0),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: state
                                                .listLastChat[index]
                                                    ['media_chat_messages']
                                                .length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 4.0,
                                                    mainAxisSpacing: 4.0),
                                            itemBuilder:
                                                (BuildContext context, count) {
                                              return Image.network(
                                                'http://117.53.46.208:8192/files/' +
                                                    state.listLastChat[index][
                                                            'media_chat_messages']
                                                        [
                                                        count]['media']['path'],
                                              );
                                            },
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            state.listLastChat[index]
                                                ['message'],
                                            style: greyTextStyle.copyWith(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Image.asset(
                                                'assets/images/logo_cheac_wa.png',
                                                width: 14,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(formattedTime,
                                                  style: subGreyTextStyle)
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  : state
                                              .listLastChat[index]
                                                  ['media_chat_messages']
                                              .length >
                                          1
                                      ? Stack(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40),
                                              padding: const EdgeInsets.only(
                                                  left: 12,
                                                  top: 11,
                                                  right: 12,
                                                  bottom: 7),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: subgreenColor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(0),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GridView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: state
                                                        .listLastChat[index][
                                                            'media_chat_messages']
                                                        .length,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                4.0,
                                                            mainAxisSpacing:
                                                                4.0),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            count) {
                                                      return Image.network(
                                                        'http://117.53.46.208:8192/files/' +
                                                            state.listLastChat[
                                                                            index]
                                                                        [
                                                                        'media_chat_messages']
                                                                    [count][
                                                                'media']['path'],
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    state.listLastChat[index]
                                                        ['message'],
                                                    style:
                                                        greyTextStyle.copyWith(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/logo_cheac_wa.png',
                                                        width: 14,
                                                      ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(formattedTime,
                                                          style:
                                                              subGreyTextStyle)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 50,
                                              left: 80,
                                              child: Container(
                                                width: 200,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.grey
                                                        .withOpacity(
                                                            0.5), // background
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: ((context) =>
                                                            PreviewImage(
                                                              path: state.listLastChat[
                                                                      index][
                                                                  'media_chat_messages'],
                                                              senderId:
                                                                  widget.sendBy,
                                                            )),
                                                      ),
                                                    );
                                                  },
                                                  child: Text('+1'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : ChatRight(
                                          imgUser:
                                              'assets/images/doctor-img.png',
                                          // imgData: state.listLastChat[index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + state.listLastChat[index]['media_chat_messages'][index]['media']['path'] : '',
                                          nameUser: widget.sendBy,
                                          timetitle: formattedTime,
                                          color: subgreenColor,
                                          title: state.listLastChat[index]
                                              ['message'],
                                        ),
                            ),
                          );
                        } else if (state.listLastChat[index]['sender_id'] ==
                            widget.receiverId) {
                          return ChatLeft(
                            // imgUser: 'assets/images/doctor-img.png',
                            // imgData: 'https://heystetik.ahrulsyamil.com/files/' + state.listLastChat[index]['media_chat_messages'][0]['media']['path'],
                            nameDoctor: widget.receiverBy,
                            timetitle: formattedTime,
                            color: subwhiteColor,
                            title: state.listLastChat[index]['message'],
                          );
                        } else {
                          Container();
                        }
                        // state.listLastChat[index]['id'] == widget.roomId &&
                        //         state.listLastChat[index]['sender_id'] == 0
                        //     ? ChatLeft(
                        //         // imgDoctor: 'assets/icons/logo.png',
                        //         // nameDoctor: 'Rina Rasmalina',
                        //         timetitle: formattedTime,
                        //         color: subwhiteColor,
                        //         title: state.listLastChat[index]['message'],
                        //       )
                        //     : state.listLastChat[index]['sender_id'] ==
                        //             widget.senderId
                        //         ? ChatRight(
                        //             imgUser: 'assets/images/doctor-img.png',
                        //             // imgData: state.listLastChat[index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + state.listLastChat[index]['media_chat_messages'][index]['media']['path'] : '',
                        //             nameUser: widget.sendBy,
                        //             timetitle: formattedTime,
                        //             color: subgreenColor,
                        //             title: state.listLastChat[index]['message'],
                        //           )
                        //         : state.listLastChat[index]['sender_id'] ==
                        //                 widget.receiverId
                        //             ? ChatLeft(
                        //                 // imgUser: 'assets/images/doctor-img.png',
                        //                 // imgData: 'https://heystetik.ahrulsyamil.com/files/' + state.listLastChat[index]['media_chat_messages'][0]['media']['path'],
                        //                 nameDoctor: widget.receiverBy,
                        //                 timetitle: formattedTime,
                        //                 color: subwhiteColor,
                        //                 title: state.listLastChat[index]
                        //                     ['message'],
                        //               )
                        //             : Container();
                      }),
                );
              }),

              // RekomendasiDokterWidget(),
              // TextChat(
              //   timetitle: ' 10:90',
              //   color: subgreenColor,
              //   title:
              //       'Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChatBottomNavigator(
        textC: state.messageController,
        roomId: widget.roomId,
        senderId: widget.senderId,
        receiverId: widget.receiverId,
        roomCode: widget.roomCode,
        // onTap: () {
        //   state.sendMessage(
        //     widget.roomId,
        //     widget.roomId,
        //     widget.senderId,
        //     widget.receiverId,
        //     widget.roomCode,
        //     state.messageController.text,
        //   );
        // },

        onCamera: () {
          state.openCamera();
        },
        onGallery: () {
          state.selectImageMultiple(
            widget.roomId,
            widget.roomId,
            widget.senderId,
            widget.receiverId,
            widget.roomCode,
          );
        },
      ),
    );
  }
}
