// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/models/doctor/list_message_model.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/tab_bar_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../controller/customer/chat/chat_controller.dart';
import '../../core/global.dart';
import '../../core/local_storage.dart';
import '../../service/doctor/recent_chat/recent_chat_service.dart';
import '../../theme/theme.dart';
import '../../widget/chat_widget.dart';
import '../../widget/preview_widget.dart';
import '../../widget/text_button_vaigator.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
  IO.Socket? _socket;
  bool isOnline = false;
  bool isTyping = false;
  List<Data2>? msglist = [];

  List fileImage = [];

  List<XFile> selectedMultipleImage = [];
  String? fileImg64;

  File? imagePath;
  RxString mediaImg = ''.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest(widget.roomCode);
    connectSocket(context, widget.receiverBy);
    joinRoom(widget.roomCode);
    readMessage(widget.roomCode);
  }

  bool clik = true;

  // EVENT ONLINE CLIENT (udah dipanggil)
  onlineClients(String receiver) {
    print("onlineClients");
    _socket?.on('onlineClients', (onlineClients) async {
      print("onlineClients $onlineClients");
      if (onlineClients.length != null) {
        for (int i = 0; i < onlineClients.length; i++) {
          if (onlineClients[i]['user_fullname'] == receiver) {
            setState(() {
              isOnline = true;
            });
          } else {
            isOnline = false;
          }
        }
      }
    });
    print("onlineClients");
  }

  // EVENT NEW MESSAGE (udah dipanggil)
  newMessage() async {
    print("newMessage");
    _socket?.on('newMessage', (newMessage) async {
      print("newMessage $newMessage");
      print("message ${newMessage['message']}");
      print("message ${newMessage['sender']['fullname']}");
      // var result = json.decode(newMessage);
      Data2 result = Data2.fromJson(newMessage);
      setState(() {
        msglist?.add(result);
      });
      print('hey ' + result.toString());

      // setState(() {
      //   msglist?.add(result);
      // });
    });
  }

  Future getRequest(String roomCode) async {
    // isLoading.value = true;
    //replace your restFull API here.
    var response = await FetchMessageByRoom().getFetchMessage(roomCode, 1000);
    ListMessageModel result = ListMessageModel.fromJson(response);
    msglist = result.data?.data;
    setState(() {});
    print('msg ' + response.toString());

    // listLastChat.value = response;
    // isLoading.value = false;
  }

  // EVENT TYPING INDICATOR (udah dipanggil)
  typingIndicator() {
    try {
      print("typingIndicator");
      _socket?.on('typingIndicator', (typingIndicator) async {
        print("typingIndicator $typingIndicator");
        if (typingIndicator['isTyping']) {
          setState(() {
            isTyping = true;
          });
        } else {
          isTyping = false;
        }
      });
      print("typingIndicator");
    } catch (e) {
      print("error indikasi $e");
    }
  }

  typing(bool isTyping, String roomCode) {
    // jika karakter dalam text message >= 1 emit is_typing true, jika kurang dari < 1 emit is_typing false
    print('typing');
    _socket?.emit(
      'typing',
      {"room": roomCode, "is_typing": isTyping},
    );
    typingIndicator();
    print('typing');
  }

  // EVENT JOIN ROOM (udah dipanggil)
  readMessage(String roomCode) {
    print('readMessage');
    _socket?.emit('readMessage', {"room": roomCode});
    print('readMessage');
  }

  // EVENT JOIN ROOM (udah dipanggil)

  joinRoom(String roomCode) {
    print('joinRoom');
    _socket?.emit('joinRoom', {"room": roomCode});
    print('joinRoom ${roomCode}');
  }

  // EVENT LEAVE ROOM (udah dipanggil)
  leaveRoom(String roomCode) {
    print('leaveRoom');
    _socket?.emit('leaveRoom', {"room": roomCode});
    print('leaveRoom ${roomCode}');
  }

  // EVENT SEND MESSAGE
  sendMessage(
    int idRoom,
    int chatRoomId,
    int userId,
    int receiverId,
    String roomCode,
    String textMessage,
    String senderBy,
    String receiverBy,
  ) {
    print('sendMessage $textMessage');

    if (fileImage != null) {
      var data = {
        "room": roomCode,
        "message": textMessage,
        "files": [for (var i in fileImage) fileImg64 = i],
      };
      _socket?.emit('sendMessage', data);
    } else {
      var data = {
        "room": roomCode,
        "message": textMessage,
      };
      _socket?.emit('sendMessage', data);
    }

    final dateTime = DateTime.now();
    final stringDateTime = dateTime.toIso8601String();
    final parsedDateTime = DateTime.parse(stringDateTime);
    var dateFormatted =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());

    var newMes = {
      "id": 24,
      "chat_room_id": chatRoomId,
      "sender_id": userId,
      "receiver_id": receiverId,
      "message": textMessage,
      "seen": false,
      "created_by": null,
      "updated_by": null,
      "created_at": "2023-07-04T12:35:06.173Z",
      "updated_at": "2023-07-04T12:35:06.173Z",
      "deleted_at": null,
      "media_chat_messages": [],
      "sender": {
        "fullname": senderBy,
      },
      "receiver": {
        "fullname": receiverBy,
      }
    };
    // listLastChat.add(newMes);
    Data2 result = Data2.fromJson(newMes);
    setState(() {
      msglist?.add(result);
    });
    state.messageController.clear();
    selectedMultipleImage = [];

    // setState(() {
    //   isSuggestion = false;
    // });
    print('list mesage' + msglist.toString());
  }

  // EVENT TYPING INDICATOR (udah dipanggil)
  recentChatt() {
    print("recentChat");
    _socket?.on('recentChat', (recentChat) async {
      log("recentChat $recentChat");
      Data2 result = Data2.fromJson(recentChat['last_chat']);
      setState(() {
        msglist?.add(result);
      });
      // listLastChat.add(recentChat['last_chat']);
      log("de $msglist");

      // await NotificationService().notifChat(
      //   1,
      //   widget.username == "Doctor" ? "Customer" : "Doctor",
      //   recentChat['last_chat']['message'],
      //   100,
      // );
    });
    print("recentChat");
  }

  // INIATE CONNECT TO SOCKET
  connectSocket(BuildContext context, String receiver) async {
    try {
      _socket = IO.io(
        '${Global.BASE_API}/socket',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .setExtraHeaders(
              {
                'Authorization':
                    'Bearer ${await LocalStorage().getAccessToken()}',
              },
            )
            .build(),
      );

      _socket?.onConnect((data) async {
        print('Connection established');
        await onlineClients(receiver);
        await newMessage();
        await typingIndicator();
        await infoLog();
        await recentChatt();
      });
      _socket?.onConnectError((data) async {
        print('Connect Error: $data');
      });
      _socket?.onDisconnect((data) async {
        print('Socket.IO server disconnected');
      });
    } catch (e) {
      print('error nih $e');
    }
  }

  infoLog() {
    print("logInfo");
    _socket?.on('logInfo', (logInfo) {
      print('logInfo $logInfo');
      print('logInfo ${logInfo['success']}');
      // if (logInfo['success'] == false) {
      //   Navigator.pop(context);
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(logInfo['message']),
      //       backgroundColor: Colors.red,
      //     ),
      //   );
      // }
    });
    print("logInfo");
  }

  // CLOSE / DISCONNECTED (udah dipanggil)
  close() {
    try {
      _socket?.disconnect();
      _socket?.close();
      _socket?.destroy();
      print('SOCKET DISCONNECTED');
    } catch (e) {
      print("error close $e");
    }
  }

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
          TextButton(
              onPressed: () {
                customeshomodal(context, AkhiriConsultasi());
              },
              child: Text(
                'Selesai',
                style: whiteTextStyle.copyWith(fontSize: 18),
              )),
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
                            selectedMultipleImage = [];
                            fileImage = [];
                            leaveRoom(widget.roomCode);
                            close();
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
                      Expanded(
                        child: Text(
                          widget.receiverBy,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
              Container(
                // height: 1000,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: msglist!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (buildex, index) {
                      var formatter = new DateFormat('dd-MM-yyyy');
                      String formattedTime = DateFormat('kk:mm').format(
                          DateTime.parse(msglist![index].createdAt.toString()));

                      if (msglist![index].id == widget.roomId &&
                          msglist![index].senderId == 0) {
                        return ChatLeft(
                          // imgDoctor: 'assets/icons/logo.png',
                          // nameDoctor: 'Rina Rasmalina',
                          timetitle: formattedTime,
                          color: subwhiteColor,
                          title: msglist![index].message,
                        );
                      } else if (msglist![index].senderId == widget.senderId &&
                          msglist![index].mediaChatMessages!.length == 0) {
                        return ChatRight(
                          imgUser: 'assets/images/doctor-img.png',
                          nameUser: widget.sendBy,
                          timetitle: formattedTime,
                          color: subgreenColor,
                          title: msglist![index].message.toString(),
                        );
                      } else if (msglist![index].senderId == widget.senderId &&
                          msglist![index].mediaChatMessages!.length > 1) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              final dateTime = DateTime.now();
                              final stringDateTime = dateTime.toIso8601String();
                              final parsedDateTime =
                                  DateTime.parse(stringDateTime);

                              var dateFormatted =
                                  DateFormat("yyyy-MM-dd-HH:mm:ss")
                                      .format(DateTime.now());
                              print('hsail date ' + dateFormatted.toString());
                              print('hsail format ' +
                                  dateTime.timeZoneOffset.toString());
                            },
                            child: msglist![index].mediaChatMessages!.length ==
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
                                          itemCount: msglist![index]
                                              .mediaChatMessages!
                                              .length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 4.0,
                                                  mainAxisSpacing: 4.0),
                                          itemBuilder:
                                              (BuildContext context, count) {
                                            return Image.network(
                                              '${Global.FILE}/' +
                                                  msglist![index]
                                                      .mediaChatMessages![0]
                                                      .media!
                                                      .path!,
                                            );
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          msglist![index].message.toString(),
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
                                : msglist![index].mediaChatMessages!.length > 1
                                    ? Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
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
                                                bottomLeft: Radius.circular(10),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GridView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: msglist![index]
                                                      .mediaChatMessages!
                                                      .length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 4.0,
                                                          mainAxisSpacing: 4.0),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          count) {
                                                    return Image.network(
                                                      '${Global.FILE}' +
                                                          msglist![index]
                                                              .mediaChatMessages![
                                                                  count]
                                                              .media!
                                                              .path!,
                                                    );
                                                  },
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  msglist![index]
                                                      .message
                                                      .toString(),
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
                                          ),
                                          Positioned(
                                            top: 50,
                                            left: 80,
                                            child: Container(
                                              width: 200,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
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
                                                            path: msglist![
                                                                    index]
                                                                .mediaChatMessages,
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
                                        imgUser: 'assets/images/doctor-img.png',
                                        nameUser: widget.sendBy,
                                        timetitle: formattedTime,
                                        color: subgreenColor,
                                        title:
                                            msglist![index].message.toString(),
                                      ),
                          ),
                        );
                      } else if (msglist![index].senderId ==
                              widget.receiverId &&
                          msglist![index].mediaChatMessages!.isNotEmpty) {
                        return Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: msglist![index].mediaChatMessages!.length ==
                                    1
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.receiverBy.toString(),
                                            style: blackTextStyle.copyWith(
                                                fontSize: 15,
                                                color: const Color(0xFF616161)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/doctor-img.png'
                                                .toString(),
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            top: 11,
                                            right: 12,
                                            bottom: 7),
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                              itemCount: msglist![index]
                                                  .mediaChatMessages!
                                                  .length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 4.0,
                                                      mainAxisSpacing: 4.0),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      count) {
                                                return Image.network(
                                                  '${Global.FILE}/' +
                                                      msglist![index]
                                                          .mediaChatMessages![0]
                                                          .media!
                                                          .path!,
                                                );
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              msglist![index]
                                                  .message
                                                  .toString(),
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
                                      ),
                                    ],
                                  )
                                : msglist![index].mediaChatMessages!.length > 1
                                    ? Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                widget.receiverBy.toString(),
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 15,
                                                    color: const Color(
                                                        0xFF616161)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                'assets/images/doctor-img.png'
                                                    .toString(),
                                                width: 30,
                                              ),
                                            ],
                                          ),
                                          Stack(
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
                                                  color: subwhiteColor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(10),
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
                                                      itemCount: msglist![index]
                                                          .mediaChatMessages!
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
                                                          '${Global.FILE}/' +
                                                              msglist![index]
                                                                  .mediaChatMessages![
                                                                      count]
                                                                  .media!
                                                                  .path!,
                                                        );
                                                      },
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      msglist![index]
                                                          .message
                                                          .toString(),
                                                      style: greyTextStyle
                                                          .copyWith(
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
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: Colors
                                                          .grey
                                                          .withOpacity(
                                                              0.5), // background
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: ((context) =>
                                                              PreviewImage(
                                                                path: msglist![
                                                                        index]
                                                                    .mediaChatMessages,
                                                                senderId: widget
                                                                    .receiverBy,
                                                              )),
                                                        ),
                                                      );
                                                    },
                                                    child: Text('+1'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : ChatLeft(
                                        nameDoctor: widget.receiverBy,
                                        timetitle: formattedTime,
                                        color: subwhiteColor,
                                        title:
                                            msglist![index].message.toString(),
                                      ));
                      } else if (msglist![index].senderId ==
                          widget.receiverId) {
                        return ChatLeft(
                          nameDoctor: widget.receiverBy,
                          timetitle: formattedTime,
                          color: subwhiteColor,
                          title: msglist![index].message.toString(),
                        );
                      } else {
                        Container();
                      }

                      // return msglist[index]['id'] ==
                      //             widget.roomId &&
                      //         state.msglist[index]['sender_id'] == 0
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
              )
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
        senderBy: widget.sendBy,
        receiverBy: widget.receiverBy,
      ),
    );
  }
}

class AkhiriConsultasi extends StatelessWidget {
  const AkhiriConsultasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 27),
      child: Wrap(
        children: [
          Text(
            'Akhiri Konsultasi ini?',
            style: blackHigtTextStyle.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Kamu tidak dapat mengirimkan pesan ke dokter ini lagi.',
            style: blackRegulerTextStyle.copyWith(fontSize: 15),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Expanded(
                child: ButtonWhiteWidget(
                  title: 'Kemabli',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: ButtonGreenWidget(
                  title: 'Ya, Akhiri',
                  onPressed: () {
                    customeshomodal(
                        context,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 42, horizontal: 27),
                          child: Wrap(
                            children: [
                              Text(
                                'Akhiri Konsultasi ini?',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 20),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Kamu tidak dapat mengirimkan pesan ke dokter ini lagi.',
                                style: blackRegulerTextStyle.copyWith(
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ButtonGreenWidget(
                                      title: 'Oke',
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
