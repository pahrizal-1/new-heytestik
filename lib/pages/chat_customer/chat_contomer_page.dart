// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
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
import '../../controller/doctor/consultation/consultation_controller.dart';
import '../../core/global.dart';
import '../../core/local_storage.dart';
import '../../service/doctor/consultation/notif_service.dart';
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
  final int? id;
  const ChatCostomerPage({
    super.key,
    required this.roomCode,
    required this.sendBy,
    required this.receiverBy,
    required this.roomId,
    required this.senderId,
    required this.receiverId,
    this.id,
  });

  @override
  State<ChatCostomerPage> createState() => _ChatCostomerPageState();
}

class _ChatCostomerPageState extends State<ChatCostomerPage> {
  final DoctorConsultationController doktorState =
      Get.put(DoctorConsultationController());
  final CustomerChatController state = Get.put(CustomerChatController());
  IO.Socket? _socket;
  bool isOnline = false;
  bool isTyping = false;
  List<Data2>? msglist = [];
  bool isLoading = false;

  List fileImage = [];

  List<XFile> selectedMultipleImage = [];
  String? fileImg64;

  File? imagePath;
  RxString mediaImg = ''.obs;
  late final NotificationService notificationService;
  final ScrollController controller = ScrollController();
  int take = 1000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('id' + widget.id.toString());
    print('romid' + widget.roomId.toString());
    getRequest(widget.roomCode, take);
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => doktorState.getDetailConsltation(context, widget.id!));
    // controller.addListener(
    //   () {
    //     if (controller.position.pixels == controller.position.maxScrollExtent) {
    //       setState(() {});
    //       take += 10;
    //       getRequest(widget.roomCode, take);
    //     }
    //   },
    // );
    connectSocket(context, widget.receiverBy);
    LocalNotificationService.initialize();
    notificationService = NotificationService();
    notificationService.initializePlatformNotifications();
    // joinRoom(widget.roomCode);
    // readMessage(widget.roomCode);
  }

  bool clik = true;
  void _scrollDown() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

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

  Future getRequest(String roomCode, int take) async {
    setState(() {
      isLoading = true;
    });
    //replace your restFull API here.
    var response = await FetchMessageByRoom().getFetchMessage(roomCode, take);
    ListMessageModel result = ListMessageModel.fromJson(response);
    msglist = result.data?.data;
    setState(() {});
    print('msg ' + response.toString());

    // listLastChat = response;
    setState(() {
      isLoading = false;
    });
    Timer.periodic(Duration.zero, (timer) {
      if (mounted) {
        _scrollDown();
        controller.dispose();
      } else {
        timer.cancel();
      }
    });
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
    var data = {
      "room": roomCode,
    };
    _socket?.emit('readMessage', data);
    print('readMessage ${roomCode}');
  }

  // EVENT JOIN ROOM (udah dipanggil)

  joinRoom(String roomCode) {
    print('joinRoom');
    var data = {
      "room": roomCode,
    };
    _socket?.emit(
      'joinRoom',
      data,
    );
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

    // final dateTime = DateTime.now();
    // final stringDateTime = dateTime.toIso8601String();
    // final parsedDateTime = DateTime.parse(stringDateTime);
    // var dateFormatted =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());

    // var newMes = {
    //   "id": 24,
    //   "chat_room_id": chatRoomId,
    //   "sender_id": userId,
    //   "receiver_id": receiverId,
    //   "message": textMessage,
    //   "seen": false,
    //   "created_by": null,
    //   "updated_by": null,
    //   "created_at": "2023-07-04T12:35:06.173Z",
    //   "updated_at": "2023-07-04T12:35:06.173Z",
    //   "deleted_at": null,
    //   "media_chat_messages": [],
    //   "sender": {
    //     "fullname": senderBy,
    //   },
    //   "receiver": {
    //     "fullname": receiverBy,
    //   }
    // };
    // // listLastChat.add(newMes);
    // Data2 result = Data2.fromJson(newMes);
    // setState(() {
    //   msglist?.add(result);
    // });
    state.messageController.clear();
    selectedMultipleImage = [];
    fileImage = [];
    imagePath = null;

    // setState(() {
    //   isSuggestion = false;
    // });
    print('list mesage' + msglist.toString());
  }

  // EVENT My MESSAGE (udah dipanggil)
  myMessage() async {
    print("myMessage");
    _socket?.on('myMessage', (myMessage) async {
      // infoLog();
      print("myMessage $myMessage");
      print("message ${myMessage['message']}");
      print("message ${myMessage['sender']['fullname']}");
      // var result = json.decode(newMessage);

      Data2 result = Data2.fromJson(myMessage);
      setState(() {
        msglist?.add(result);
      });
      print('hey $result');

      // setState(() {
      //   msglist?.add(result);
      // });
    });
  }

  newMessagee() {
    print("newMessage");
    _socket?.on('newMessage', (newMessage) async {
      print("newMessage $newMessage");
      print("message ${newMessage['message']}");
      print("message ${newMessage['sender']['fullname']}");
      // var result = json.decode(newMessage);

      notificationService.showLocalNotification(
        id: widget.receiverId,
        title: widget.receiverBy,
        body: "${newMessage['message']}",
      );

      Data2 result = Data2.fromJson(newMessage);
      setState(() {
        msglist?.add(result);
      });
      log('hey ' + result.toString());

      // setState(() {
      //   msglist?.add(result);
      // });
    });
  }

  // EVENT TYPING INDICATOR (udah dipanggil)
  recentChatt() {
    print("recentChat");
    _socket?.on('recentChat', (recentChat) async {
      log("recentChat $recentChat");
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
        await joinRoom(widget.roomCode);
        await readMessage(widget.roomCode);
        await onlineClients(receiver);
        await newMessagee();
        await myMessage();
        await typingIndicator();
        await infoLog();
      });
      _socket?.onConnectError((data) async {
        print('Connect Error: $data');
      });
      _socket?.onDisconnect((data) async {
        setState(() {
          if (data is Map) {
            data = json.encode(data);
          }
          print('Socket.IO server disconnected' + data.toString());
        });
      });
    } catch (e) {
      print('error nih $e');
    }
  }

  infoLog() {
    print("logInfo");
    _socket?.on('log', (logInfo) {
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
          // TextButton(
          //     onPressed: () {
          //       customeshomodal(context, AkhiriConsultasi());
          //     },
          //     child: Text(
          //       'Selesai',
          //       style: whiteTextStyle.copyWith(fontSize: 18),
          //     )),
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
                            Navigator.pop(context, 'refresh');
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
                              builder: (context) => TabBarChat(id: widget.id),
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
                        " 'Detail Perawatan’",
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: controller,
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
                    widget.id == widget.roomId
                        ? Container(
                            // height: 1000,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: msglist!.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (buildex, index) {
                                  var formatter = DateFormat('dd-MM-yyyy');
                                  String formattedTime = DateFormat('kk:mm')
                                      .format(DateTime.parse(msglist![index]
                                          .createdAt
                                          .toString()));

                                  if (widget.id == widget.roomId &&
                                      msglist![index].senderId == 0) {
                                    return ChatLeft(
                                      // imgDoctor: 'assets/icons/logo.png',
                                      // nameDoctor: 'Rina Rasmalina',
                                      timetitle: formattedTime,
                                      color: subwhiteColor,
                                      title: msglist![index].message,
                                    );
                                  } else if (msglist![index].senderId ==
                                          widget.senderId &&
                                      msglist![index]
                                              .mediaChatMessages!
                                              .length ==
                                          0) {
                                    return ChatRight(
                                      imgUser: 'assets/images/doctor-img.png',
                                      nameUser: widget.sendBy,
                                      timetitle: formattedTime,
                                      color: subgreenColor,
                                      title: msglist![index].message.toString(),
                                    );
                                  } else if (msglist![index].senderId ==
                                          widget.senderId &&
                                      (msglist![index]
                                                  .mediaChatMessages
                                                  ?.length ??
                                              0) >
                                          0) {
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
                                          print('hsail date $dateFormatted');
                                          print(
                                              'hsail format ${dateTime.timeZoneOffset}');
                                        },
                                        child: msglist![index]
                                                    .mediaChatMessages!
                                                    .length ==
                                                1
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        widget.sendBy
                                                            .toString(),
                                                        style: blackTextStyle
                                                            .copyWith(
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
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 40),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12,
                                                            top: 11,
                                                            right: 12,
                                                            bottom: 7),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: subgreenColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        GridView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: msglist![
                                                                  index]
                                                              .mediaChatMessages!
                                                              .length,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      4.0,
                                                                  mainAxisSpacing:
                                                                      4.0),
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  count) {
                                                            return Image
                                                                .network(
                                                              '${Global.FILE}/${msglist![index].mediaChatMessages![0].media!.path!}',
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
                                                              MainAxisAlignment
                                                                  .end,
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
                                                ],
                                              )
                                            : msglist![index]
                                                        .mediaChatMessages!
                                                        .length >
                                                    1
                                                ? Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            widget.sendBy
                                                                .toString(),
                                                            style: blackTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        15,
                                                                    color: const Color(
                                                                        0xFF616161)),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          // Image.asset(
                                                          //   'assets/images/doctor-img.png'
                                                          //       .toString(),
                                                          //   width: 30,
                                                          // ),
                                                        ],
                                                      ),
                                                      Stack(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        40),
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 12,
                                                                    top: 11,
                                                                    right: 12,
                                                                    bottom: 7),
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  subgreenColor,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                GridView
                                                                    .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount: msglist![
                                                                          index]
                                                                      .mediaChatMessages!
                                                                      .length,
                                                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          2,
                                                                      crossAxisSpacing:
                                                                          4.0,
                                                                      mainAxisSpacing:
                                                                          4.0),
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          count) {
                                                                    return Image
                                                                        .network(
                                                                      '${Global.FILE}/${msglist![index].mediaChatMessages![count].media!.path!}',
                                                                    );
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                  msglist![
                                                                          index]
                                                                      .message
                                                                      .toString(),
                                                                  style: greyTextStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/images/logo_cheac_wa.png',
                                                                      width: 14,
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 2,
                                                                    ),
                                                                    Text(
                                                                        formattedTime,
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
                                                              child:
                                                                  ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.5), // background
                                                                ),
                                                                onPressed: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          ((context) =>
                                                                              PreviewImage(
                                                                                path: msglist![index].mediaChatMessages,
                                                                                senderId: widget.sendBy ?? '',
                                                                              )),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    Text('+1'),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : ChatRight(
                                                    // imgUser:
                                                    //     'assets/images/doctor-img.png',
                                                    // imgData: msglist![index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + msglist![index]['media_chat_messages'][index]['media']['path'] : '',
                                                    nameUser: widget.sendBy,
                                                    timetitle: formattedTime,
                                                    color: subgreenColor,
                                                    title: msglist![index]
                                                        .message
                                                        .toString(),
                                                  ),
                                      ),
                                    );
                                  } else if (msglist![index].senderId ==
                                          widget.receiverId &&
                                      msglist![index].message == '####') {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.sendBy.toString(),
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 15,
                                                    color: const Color(
                                                        0xFF616161)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: FutureBuilder(
                                              future: doktorState
                                                  .detailConsultation(
                                                      context, widget.id!),
                                              builder: ((context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 14),
                                                          height: 43,
                                                          width: 270,
                                                          decoration: BoxDecoration(
                                                              color: greenColor,
                                                              borderRadius: const BorderRadius
                                                                  .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: Text(
                                                            'Rekomendasi Dokter',
                                                            style: whiteTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 11),
                                                          // height: 299,
                                                          width: 270,
                                                          color: whiteColor,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              const Text(
                                                                'Obat',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10),
                                                                child: ListView
                                                                    .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: doktorState
                                                                            .data
                                                                            .value
                                                                            .consultationRecipeDrug
                                                                            ?.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Column(
                                                                            children: [
                                                                              Row(
                                                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      doktorState.data.value.consultationRecipeDrug?[index].product?.name ?? '-',
                                                                                      style: grenTextStyle.copyWith(fontSize: 12),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      doktorState.data.value.consultationRecipeDrug?[index].product?.drugDetail?.specificationDose ?? '-',
                                                                                      maxLines: 1,
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: greyTextStyle,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }),
                                                              ),
                                                              Divider(
                                                                thickness: 2,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              const Text(
                                                                'Skincare',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10),
                                                                child: ListView
                                                                    .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: doktorState
                                                                            .data
                                                                            .value
                                                                            .consultationRecomendationSkincare
                                                                            ?.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    doktorState.data.value.consultationRecomendationSkincare?[index].product?.name ?? '-',
                                                                                    style: grenTextStyle.copyWith(fontSize: 12),
                                                                                  ),
                                                                                  Text(
                                                                                    doktorState.data.value.consultationRecomendationSkincare?[index].product?.drugDetail?.specificationDose ?? '-',
                                                                                    style: greyTextStyle,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }),
                                                              ),
                                                              Divider(
                                                                thickness: 2,
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              const Text(
                                                                'Treatment',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10),
                                                                child: ListView
                                                                    .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        itemCount: doktorState
                                                                            .data
                                                                            .value
                                                                            .consultationRecomendationTreatment
                                                                            ?.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    doktorState.data.value.consultationRecomendationTreatment?[index].name ?? '-',
                                                                                    style: grenTextStyle.copyWith(fontSize: 12),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              const ButtonGreenWidget(
                                                                  title:
                                                                      'Lihat Detail')
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                                return Container();
                                              }),
                                            ),
                                          ),
                                          // Align(
                                          //     alignment: Alignment.centerRight,
                                          //     child: RekomendasiDokterWidget(id: widget.id!.toInt(),)),
                                        ],
                                      ),
                                    );
                                  } else if (msglist![index].senderId ==
                                          widget.receiverId &&
                                      (msglist![index]
                                                  .mediaChatMessages
                                                  ?.length ??
                                              0) >
                                          0) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: msglist![index]
                                                  .mediaChatMessages
                                                  ?.length ==
                                              1
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      widget.receiverBy
                                                          .toString(),
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 15,
                                                              color: const Color(
                                                                  0xFF616161)),
                                                    ),
                                                    Text(
                                                      msglist![index]
                                                          .mediaChatMessages!
                                                          .length
                                                          .toString(),
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 15,
                                                              color: const Color(
                                                                  0xFF616161)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    // Image.asset(
                                                    //   'assets/images/doctor-img.png'
                                                    //       .toString(),
                                                    //   width: 30,
                                                    // ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 40),
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                      topLeft:
                                                          Radius.circular(0),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      GridView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: msglist![
                                                                index]
                                                            .mediaChatMessages!
                                                            .length,
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    4.0,
                                                                mainAxisSpacing:
                                                                    4.0),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                count) {
                                                          return Image.network(
                                                            '${Global.FILE}/' +
                                                                msglist![index]
                                                                    .mediaChatMessages![
                                                                        0]
                                                                    .media!
                                                                    .path!
                                                                    .toString(),
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
                                                            MainAxisAlignment
                                                                .end,
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
                                              ],
                                            )
                                          : msglist![index]
                                                      .mediaChatMessages
                                                      ?.length !=
                                                  1
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          widget.receiverBy
                                                              .toString(),
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 15,
                                                                  color: const Color(
                                                                      0xFF616161)),
                                                        ),
                                                        Text(
                                                          msglist![index]
                                                              .mediaChatMessages!
                                                              .length
                                                              .toString(),
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontSize: 15,
                                                                  color: const Color(
                                                                      0xFF616161)),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        // Image.asset(
                                                        //   'assets/images/doctor-img.png'
                                                        //       .toString(),
                                                        //   width: 30,
                                                        // ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      40),
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 12,
                                                                  top: 11,
                                                                  right: 12,
                                                                  bottom: 7),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                subwhiteColor,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(0),
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              GridView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: msglist![
                                                                        index]
                                                                    .mediaChatMessages
                                                                    ?.length,
                                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    crossAxisSpacing:
                                                                        4.0,
                                                                    mainAxisSpacing:
                                                                        4.0),
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        count) {
                                                                  return Column(
                                                                    children: [
                                                                      Image
                                                                          .network(
                                                                        '${Global.FILE}/' +
                                                                            msglist![index].mediaChatMessages![count].media!.path!,
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(
                                                                msglist![index]
                                                                    .message
                                                                    .toString(),
                                                                style:
                                                                    greyTextStyle
                                                                        .copyWith(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/logo_cheac_wa.png',
                                                                    width: 14,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 2,
                                                                  ),
                                                                  Text(
                                                                      formattedTime,
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
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
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
                                                                    builder:
                                                                        ((context) =>
                                                                            PreviewImage(
                                                                              path: msglist![index].mediaChatMessages,
                                                                              senderId: widget.receiverBy,
                                                                            )),
                                                                  ),
                                                                );
                                                              },
                                                              child: Text(msglist![
                                                                      index]
                                                                  .mediaChatMessages!
                                                                  .length
                                                                  .toString()),
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
                                                  title: msglist![index]
                                                      .message
                                                      .toString(),
                                                ),
                                    );
                                  } else if (msglist?[index].senderId ==
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
                                }),
                          )
                        : Container(),
                    Obx(() => Container(
                          height: 30,
                          width: double.infinity,
                          color: Colors.grey,
                          margin: EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              "Konsultasi selesai di ${doktorState.endDate.value}",
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: ChatBottomCostomer(
        onCamera: () {
          openCamera();
        },
        onGallery: () {
          // pickgalery();
          selectImageMultiple(
            widget.roomId ?? 0,
            widget.roomId ?? 0,
            widget.senderId ?? 0,
            widget.receiverId ?? 0,
            widget.roomCode,
            widget.sendBy ?? '',
            widget.receiverBy ?? '',
          );
        },
        textC: state.messageController,
        roomId: widget.roomId,
        senderId: widget.senderId,
        receiverId: widget.receiverId,
        roomCode: widget.roomCode,
        senderBy: widget.sendBy,
        receiverBy: widget.receiverBy,
        sendMsg: () {
          sendMessage(
            widget.roomId,
            widget.roomId,
            widget.senderId,
            widget.receiverId,
            widget.roomCode,
            state.messageController.text,
            widget.sendBy,
            widget.receiverBy,
          );
        },
      ),
    );
  }

  // image from camera
  void openCamera() async {
    final XFile? pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);
      print('img path $imagePath');
      final bytes = File(imagePath!.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      String baseImg64 = "data:/png;base64,$img64";
      fileImage.add(baseImg64);
      Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => PreviewImageCustomer(
              sendMsg: () {
                var data = {
                  "room": widget.roomCode,
                  "message": state.messageController.text,
                  "files": [baseImg64]
                };
                _socket?.emit('sendMessage', data);
                state.messageController.text = '';
                fileImage = [];
                // selectedMultipleImage = [];
                Get.back();
              },
              idRoom: widget.roomId,
              chatRoomId: widget.roomId,
              userId: widget.senderId,
              receiverId: widget.receiverId,
              roomCode: widget.roomCode,
              senderBy: widget.sendBy,
              receiverBy: widget.receiverBy,
              path: [imagePath],
            ),
          ));
      // return imagePath;
    } else {
      print("image not selected");
    }
  }

  void selectImageMultiple(
    int idRoom,
    int chatRoomId,
    int userId,
    int receiverId,
    String roomCode,
    String senderBy,
    String receiverBy,
  ) async {
    final List<XFile>? selectImage =
        await ImagePicker().pickMultiImage(imageQuality: 50);
    if (selectImage! != null) {
      selectedMultipleImage.addAll(selectImage);
      print('awal$selectedMultipleImage');
      Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: (context) => CameraViewPageCustomer(
            path: selectedMultipleImage,
            idRoom: idRoom,
            chatRoomId: chatRoomId,
            userId: userId,
            receiverId: receiverId,
            roomCode: roomCode,
            senderBy: senderBy,
            receiverBy: receiverBy,
            sendMsg: () {
              sendMessage(
                widget.roomId ?? 0,
                widget.roomId ?? 0,
                widget.senderId ?? 0,
                widget.receiverId ?? 0,
                widget.roomCode,
                state.messageController.text.isNotEmpty
                    ? state.messageController.text
                    : ' ',
                widget.sendBy ?? '',
                widget.receiverBy ?? '',
              );
              // selectedMultipleImage = [];
              Get.back();
            },
          ),
        ),
      );
      for (var i = 0; i < selectedMultipleImage.length; i++) {
        final bytes = File(selectedMultipleImage[i].path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        String baseImg64 = "data:/png;base64,$img64";
        fileImage.add(baseImg64);
      }
    }
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
