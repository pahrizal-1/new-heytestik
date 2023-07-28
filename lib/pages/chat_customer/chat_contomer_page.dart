// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/selesai_pembayaran_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/tab_bar_page.dart';
import 'package:intl/intl.dart';

import '../../controller/customer/chat/chat_controller.dart';
import '../../theme/theme.dart';
import '../../widget/chat_widget.dart';
import '../../widget/preview_widget.dart';
import '../../widget/rekomedasi_chat_widget.dart';
import '../../widget/text_button_vaigator.dart';

class ChatCostomerPage extends StatefulWidget {
  final String roomCode;
  final String sendBy;
  final String receiverBy;
  final int roomId;
  final int senderId;
  final int receiverId;
  const ChatCostomerPage({
    super.key,
    required this.roomCode,
    required this.sendBy,
    required this.receiverBy,
    required this.roomId,
    required this.senderId,
    required this.receiverId,
  });

  @override
  State<ChatCostomerPage> createState() => _ChatCostomerPageState();
}

class _ChatCostomerPageState extends State<ChatCostomerPage> {
  final CustomerChatController state = Get.put(CustomerChatController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state.getRequest(widget.roomCode);
    state.connectSocket(context, widget.receiverBy);
    state.joinRoom(widget.roomCode);
    state.readMessage(widget.roomCode);
  }

  bool clik = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            height: 80.0,
            color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 10, top: 10),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const SelesaiPembayaranPage(),
                            //   ),
                            // );
                            Navigator.pop(context);
                            state.listLastChat.value = [];
                            state.selectedMultipleImage = [];
                            state.fileImage = [];
                            state.leaveRoom(widget.roomCode);
                            state.close();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SelesaiPembayaranPage(),
                            //   ),
                            // );
                          },
                          child: Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 21,
                      ),
                      Text('#K1Z4DWJST'),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TabBarChat(),
                            ),
                          );
                        },
                        child: Container(
                          width: 135,
                          height: 25,
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              'Detail Perawatan',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 31,
                  color: Color(0xFFFFE2C1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rekomendasi Dokter sudah siap. Klik',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      ),
                      Text(
                        "'Detail Perawatan’",
                        style: blackHigtTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'ya :)',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 17),
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
              Obx(() {
                return Container(
                  // height: 1000,
                  child: ListView.builder(
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
                                          nameUser: widget.sendBy,
                                          timetitle: formattedTime,
                                          color: subgreenColor,
                                          title: state.listLastChat[index]
                                              ['message'],
                                        ),
                            ),
                          );
                        } else if (state.listLastChat[index]['sender_id'] ==
                                widget.receiverId &&
                            state.listLastChat[index]['media_chat_messages']
                                .isEmpty) {
                          return ChatLeft(
                            nameDoctor: widget.receiverBy,
                            timetitle: formattedTime,
                            color: subwhiteColor,
                            title: state.listLastChat[index]['message'],
                          );
                        } else if (state.listLastChat[index]['sender_id'] ==
                                widget.receiverId &&
                            state.listLastChat[index]['media_chat_messages']
                                .isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.receiverBy,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 15,
                                      color: const Color(0xFF616161)),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 11, right: 12, bottom: 7),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: subwhiteColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(10),
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
                                                state.listLastChat[index]
                                                        ['media_chat_messages']
                                                    [count]['media']['path'],
                                          );
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        state.listLastChat[index]['message'],
                                        style: greyTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(formattedTime,
                                              style: subGreyTextStyle)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Container();
                        }

                        // return state.listLastChat[index]['id'] ==
                        //             widget.roomId &&
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
              // ChatLeft(
              //   imgDoctor: 'assets/images/doctor-img.png',
              //   nameDoctor: 'dr. Risty Hafinah, Sp.DV',
              //   timetitle: '18:80',
              //   color: subwhiteColor,
              //   title:
              //       'Halo, Rina. Terima kasih sudah menunggu :) Saya dr. Risty Hafinah, Sp.DV yang akan membantu mengatasi keluhan kamu. Ada yang bisa saya bantu, kak?',
              // ),
              // ChatRight(
              //     color: subgreenColor,
              //     imgUser: 'assets/icons/logo.png',
              //     nameUser: 'Rina Romandi',
              //     timetitle: '10:90',
              //     title:
              //         'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok'),
              // ChatLeft(
              //   imgDoctor: 'assets/images/doctor-img.png',
              //   nameDoctor: 'dr. Risty Hafinah, Sp.DV',
              //   timetitle: '18:80',
              //   color: subwhiteColor,
              //   title:
              //       'Jerawat disebabkan produksi kelenjar minyak dan sel2 kulit mati berlebih terjadi sumbatan disertai peradangan bakteri P. acnes disebabkan banyak pencetus \n\nPencetus jerawat multifaktor yaitu genetik, stres psikis, hormon, makanan manis, indeks glikemik tinggi, dairy product, tidur larut malam, lembab keringat, debu, skincare, dan kosmetik.',
              // ),
              // TextChat(
              //   timetitle: ' 10:90',
              //   color: subwhiteColor,
              //   title:
              //       'Untuk mengetahui lebih jelas, apakah setelah menggunakan produk tersebut, malam harinya rajin double cleansing?',
              // ),
              // ChatRight(
              //     color: subgreenColor,
              //     imgUser: 'assets/icons/logo.png',
              //     nameUser: 'Rina Romandi',
              //     timetitle: '10:90',
              //     title: 'Mmmm...Double cleansing itu apa sih, dok?'),
              // RekomendasiDokterWidget(),
              // TextChat(
              //   timetitle: ' 10:90',
              //   color: subwhiteColor,
              //   title:
              //       'Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
              // ),
              // ChatRight(
              //     color: subgreenColor,
              //     imgUser: 'assets/icons/logo.png',
              //     nameUser: 'Rina Romandi',
              //     timetitle: '10:90',
              //     title: 'Oke dokter Terima kasih ☺️'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChatBottomCostomer(
        textC: state.messageController,
        roomId: widget.roomId,
        senderId: widget.senderId,
        receiverId: widget.receiverId,
        roomCode: widget.roomCode,
      ),
    );
  }
}
