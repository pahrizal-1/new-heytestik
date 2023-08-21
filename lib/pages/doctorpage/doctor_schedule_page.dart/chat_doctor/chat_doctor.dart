import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/models/doctor/list_message_model.dart';

import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/detail_pasien_page.dart';
import 'package:heystetik_mobileapps/widget/chat_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// import '../../../../controller/doctor/chat/chat_controller.dart';
import '../../../../controller/doctor/consultation/consultation_controller.dart';
import '../../../../core/global.dart';
import '../../../../core/local_storage.dart';
import '../../../../service/doctor/consultation/notif_service.dart';
import '../../../../service/doctor/recent_chat/recent_chat_service.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/preview_widget.dart';
import '../../../../widget/text_button_vaigator.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatDoctorPage extends StatefulWidget {
  final String roomCode;
  final String? senderBy, receiverBy;
  final int? roomId, senderId, receiverId, id;
  ChatDoctorPage({
    super.key,
    required this.roomCode,
    this.senderBy,
    this.receiverBy,
    this.roomId,
    this.senderId,
    this.receiverId,
    this.id,
  });

  @override
  State<ChatDoctorPage> createState() => _ChatDoctorPageState();
}

class _ChatDoctorPageState extends State<ChatDoctorPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isVisibeliti = true;
  bool clik = true;
  final DoctorConsultationController state =
      Get.put(DoctorConsultationController());
  IO.Socket? _socket;
  bool isOnline = false;
  bool isTyping = false;
  bool isLoading = false;
  bool isSuggestion = false;
  List<Data2>? msglist = [];
  List fileImage = [];

  List<XFile> selectedMultipleImage = [];
  String? fileImg64;

  File? imagePath;
  RxString mediaImg = ''.obs;
  late final NotificationService notificationService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest(widget.roomCode);
    connectSocket(context);
    LocalNotificationService.initialize();
    notificationService = NotificationService();
    notificationService.initializePlatformNotifications();
    state.quickReply();
    print('id ' + widget.id.toString());
  }

  // image from camera
  Future openCamera(
    int idRoom,
    int chatRoomId,
    int userId,
    int receiverId,
    String roomCode,
    String senderBy,
    String receiverBy,
  ) async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);
      print('img path $imagePath');
      final bytes = File(imagePath!.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      String baseImg64 = "data:/png;base64,$img64";
      fileImage.add(baseImg64);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewImageDoctor(
              sendMsg: () {
                print('mesg' + state.messageController.text.toString());
                sendMessage(
                  widget.roomId ?? 0,
                  widget.roomId ?? 0,
                  widget.senderId ?? 0,
                  widget.receiverId ?? 0,
                  widget.roomCode,
                  state.messageController.text ?? '',
                  widget.senderBy ?? '',
                  widget.receiverBy ?? '',
                );
                // selectedMultipleImage = [];
                Get.back();
              },
              idRoom: idRoom,
              chatRoomId: chatRoomId,
              userId: userId,
              receiverId: receiverId,
              roomCode: roomCode,
              senderBy: senderBy,
              receiverBy: receiverBy,
              path: [imagePath],
            ),
          ));

      // return imagePath;
    } else {
      print("image not selected");
    }
  }

  // image multiple
  void selectImageMultiple(
    int idRoom,
    int chatRoomId,
    int userId,
    int receiverId,
    String roomCode,
    String senderBy,
    String receiverBy,
  ) async {
    final List<XFile>? selectImage = await ImagePicker().pickMultiImage();
    if (selectImage! != null) {
      selectedMultipleImage.addAll(selectImage);
      print('awal$selectedMultipleImage');
      Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: (context) => CameraViewPage(
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
                state.messageController.text,
                widget.senderBy ?? '',
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

  Future getRequest(String roomCode) async {
    setState(() {
      isLoading = true;
    });
    //replace your restFull API here.
    var response = await FetchMessageByRoom().getFetchMessage(roomCode, 1000);
    ListMessageModel result = ListMessageModel.fromJson(response);
    setState(() {
      msglist = result.data?.data;
    });
    print('msg $response');

    setState(() {
      isLoading = false;
    });
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
    var data = {
      'room': roomCode,
    };
    // infoLog();
    _socket?.emit('joinRoom', data);
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
      print('sen' + data.toString());
    }

    final dateTime = DateTime.now();
    final stringDateTime = dateTime.toUtc().toIso8601String();
    final parsedDateTime = DateTime.parse(stringDateTime);
    var dateFormatted =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());

    // "2023-08-05T07:22:49.127Z"

    // var newMes = {
    //   "id": 24,
    //   "chat_room_id": chatRoomId,
    //   "sender_id": userId,
    //   "receiver_id": receiverId,
    //   "message": textMessage,
    //   "seen": false,
    //   "created_by": null,
    //   "updated_by": null,
    //   "created_at": stringDateTime,
    //   "updated_at": stringDateTime,
    //   "deleted_at": null,
    //   "media_chat_messages": [],
    //   "sender": {
    //     "fullname": senderBy,
    //   },
    //   "receiver": {
    //     "fullname": receiverBy,
    //   }
    // };
    // Data2 result = Data2.fromJson(newMes);
    // setState(() {
    //   msglist?.add(result);
    // });

    // listLastChat.add(newMes);
    state.messageController.clear();
    selectedMultipleImage = [];
    fileImage = [];

    setState(() {
      isSuggestion = false;
    });
    print('list mesage$msglist');
  }

  // EVENT NEW MESSAGE (udah dipanggil)
  newMessage() async {
    print("newMessage");
    _socket?.on('newMessage', (newMessage) async {
      // infoLog();
      print("newMessage $newMessage");
      print("message ${newMessage['message']}");
      print("message ${newMessage['sender']['fullname']}");
      // var result = json.decode(newMessage);

      notificationService.showLocalNotification(
        id: widget.receiverId ?? 0,
        title: widget.receiverBy ?? '',
        body: "${newMessage['message']}",
      );

      Data2 result = Data2.fromJson(newMessage);
      setState(() {
        msglist?.add(result);
      });
      print('hey $result');

      // setState(() {
      //   msglist?.add(result);
      // });
    });
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

  // EVENT TYPING INDICATOR (udah dipanggil)
  recentChatt() {
    print("recentChat");
    _socket?.on('recentChat', (recentChat) async {
      log("recentChat ${recentChat['last_chat']['message']}");
    });
    print("recentChat");
  }

  // INIATE CONNECT TO SOCKET
  connectSocket(BuildContext context) async {
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

        await onlineClients(widget.receiverBy ?? '');
        await newMessage();
        await myMessage();
        await typingIndicator();
        await recentChatt();
        await infoLog();
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
    print("log");
    _socket?.on('log', (logInfo) {
      // joinRoom(widget.roomCode);
      // readMessage(widget.roomCode);
      // recentChatt();
      // newMessage();
      print('logInfo $logInfo');
      print('logInfo ${logInfo['success']}');
      print('logInfo ${logInfo['event']}');
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
  void dispose() {
    if (_socket != null) {
      _socket?.disconnect();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
              print('test room code${widget.roomCode}');
              print('test sender id${widget.senderId}');
              print('test receiver id${widget.receiverId}');
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
                            Navigator.pop(context, 'refresh');
                            selectedMultipleImage = [];
                            fileImage = [];
                            state.messageController.text = '';
                            leaveRoom(widget.roomCode);
                            close();
                          },
                          child: Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 21,
                      ),
                      Text(
                        widget.receiverBy ?? '',
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
                              builder: (context) =>
                                  DetailPasienPage(id: widget.id ?? 0),
                            ),
                          );
                          print('id ' + widget.id.toString());
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
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
                    // Obx(() => )
                    widget.id == widget.roomId
                        ? Container(
                            // height: 1000,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: msglist!.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (buildex, index) {
                                  var formatter = new DateFormat('dd-MM-yyyy');
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
                                      // imgData: msglist![index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + msglist![index]['media_chat_messages'][index]['media']['path'] : '',
                                      nameUser: widget.senderBy,
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
                                                        widget.senderBy
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
                                                            widget.senderBy
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
                                                                                senderId: widget.senderBy ?? '',
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
                                                    imgUser:
                                                        'assets/images/doctor-img.png',
                                                    // imgData: msglist![index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + msglist![index]['media_chat_messages'][index]['media']['path'] : '',
                                                    nameUser: widget.senderBy,
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
                                                                              senderId: widget.receiverBy.toString(),
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
                                  } else if (msglist![index].senderId ==
                                      widget.receiverId) {
                                    return ChatLeft(
                                      // imgUser: 'assets/images/doctor-img.png',
                                      // imgData: 'https://heystetik.ahrulsyamil.com/files/' + msglist![index]['media_chat_messages'][0]['media']['path'],
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
                        : Container()
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
        senderBy: widget.senderBy,
        receiverBy: widget.receiverBy,
        id: widget.id,
        sendMsg: () {
          sendMessage(
            widget.roomId ?? 0,
            widget.roomId ?? 0,
            widget.senderId ?? 0,
            widget.receiverId ?? 0,
            widget.roomCode,
            state.messageController.text,
            widget.senderBy ?? '',
            widget.receiverBy ?? '',
          );
        },
        onChanged: (value) {
          if (state.messageController.text == '/') {
            setState(() {
              isSuggestion = true;
            });
            scaffoldKey.currentState!.showBottomSheet(
              (context) => Visibility(
                visible: isSuggestion,
                child: Container(
                  height: 150,
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: Get.put(DoctorConsultationController())
                          .quickReplyChat
                          .length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () async {
                            String desc =
                                Get.put(DoctorConsultationController())
                                    .quickReplyChat[index]['message'];
                            await sendMessage(
                              widget.roomId ?? 0,
                              widget.roomId ?? 0,
                              widget.senderId ?? 0,
                              widget.receiverId ?? 0,
                              widget.roomCode,
                              desc,
                              widget.senderBy ?? '',
                              widget.receiverBy ?? '',
                            );

                            Get.back();
                            setState(() {
                              isSuggestion = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(Get.put(DoctorConsultationController())
                                .quickReplyChat[index]['shortcut']),
                          ),
                        );
                      })),
                ),
              ),
            );
          } else if (state.messageController.text.isEmpty) {
            Get.back();
            setState(() {
              isSuggestion = false;
            });
          }
        },
        onCamera: () {
          openCamera(
            widget.roomId ?? 0,
            widget.roomId ?? 0,
            widget.senderId ?? 0,
            widget.receiverId ?? 0,
            widget.roomCode,
            widget.senderBy ?? '',
            widget.receiverBy ?? '',
          );
        },
        onGallery: () {
          selectImageMultiple(
            widget.roomId ?? 0,
            widget.roomId ?? 0,
            widget.senderId ?? 0,
            widget.receiverId ?? 0,
            widget.roomCode,
            widget.senderBy ?? '',
            widget.receiverBy ?? '',
          );
        },
      ),
    );
  }
}
