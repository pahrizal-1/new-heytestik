// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/profile/profile_controller.dart';
import 'package:heystetik_mobileapps/core/string_name.dart';
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
import '../../../../widget/button_widget.dart';
import '../../../../widget/preview_widget.dart';
import '../../../../widget/text_button_vaigator.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:timeago/timeago.dart' as timeago;

class ChatDoctorPage extends StatefulWidget {
  final String roomCode;
  // final String? senderBy, receiverBy;
  final int? id;
  // final int? roomId, senderId, receiverId, id;
  // final String? image;
  ChatDoctorPage({
    super.key,
    required this.roomCode,
    // this.senderBy,
    // this.receiverBy,
    // this.roomId,
    // this.senderId,
    // this.receiverId,
    this.id,
    // this.image,
  });

  @override
  State<ChatDoctorPage> createState() => _ChatDoctorPageState();
}

class _ChatDoctorPageState extends State<ChatDoctorPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isVisibeliti = true;
  bool clik = true;
  final DoctorProfileController stateProfile = Get.put(DoctorProfileController());
  final DoctorConsultationController state = Get.put(DoctorConsultationController());
  IO.Socket? _socket;
  bool isOnline = false;
  bool isTyping = false;
  bool isLoading = false;
  bool isSuggestion = false;
  List<Data2>? msglist = [];
  List itemCount = [];
  List fileImage = [];
  int page = 1;
  int take = 1000;
  int itemCountt = 0;
  TextEditingController searchController = TextEditingController();
  int chatRoomId = 0;
  int idRoom = 0;
  String pengirim = '';
  String penerima = '';
  int pengirimId = 0;
  int penerimaId = 0;
  String imagDoktor = '';
  String imgUser = '';

  List<XFile> selectedMultipleImage = [];
  String? fileImg64;

  File? imagePath;
  RxString mediaImg = ''.obs;
  late final NotificationService notificationService;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest(widget.roomCode, take, '');
    state.status.value = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        stateProfile.getProfile(context);
        // state.status.value;
      });
    });

    connectSocket(context);
    LocalNotificationService.initialize();
    notificationService = NotificationService();
    notificationService.initializePlatformNotifications();
    state.quickReply();
  }

  void _scrollDown() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  // image from camera
  void openCamera(
    int idRoom,
    int chatRoomId,
    int userId,
    int receiverId,
    String roomCode,
    String senderBy,
    String receiverBy,
  ) async {
    final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);
      print('img path $imagePath');
      final bytes = File(imagePath!.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      String baseImg64 = "data:/png;base64,$img64";
      fileImage.add(baseImg64);

      // show

      Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => PreviewImageDoctor(
              idRoom: idRoom,
              chatRoomId: chatRoomId,
              userId: userId,
              receiverId: receiverId,
              roomCode: roomCode,
              senderBy: senderBy,
              receiverBy: receiverBy,
              path: [imagePath],
              sendMsg: () {
                var data = {
                  "room": roomCode,
                  "message": state.messageController.text,
                  "files": [baseImg64]
                };
                _socket?.emit('sendMessage', data);
                state.messageController.text = '';
                fileImage = [];
                Get.back();

                // Navigator.pop(context);
                // selectedMultipleImage = [];
              },
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
    final List<XFile>? selectImage = await ImagePicker().pickMultiImage(imageQuality: 50);
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
                chatRoomId,
                chatRoomId,
                pengirimId,
                penerimaId,
                widget.roomCode,
                state.messageController.text.isNotEmpty ? state.messageController.text : '',
                pengirim,
                penerima,
                // widget.roomId ?? 0,
                // widget.roomId ?? 0,
                // widget.senderId ?? 0,
                // widget.receiverId ?? 0,
                // widget.roomCode,
                // state.messageController.text.isNotEmpty ? state.messageController.text : '',
                // widget.senderBy ?? '',
                // widget.receiverBy ?? '',
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

  Future getRequest(String roomCode, int take, String? search) async {
    setState(() {
      isLoading = true;
    });
    //replace your restFull API here.
    var response = await FetchMessageByRoom().getFetchMessage(roomCode, take, search ?? '');
    ListMessageModel result = ListMessageModel.fromJson(response);
    setState(() {
      msglist = result.data?.data;
      itemCountt = result.data!.meta!.itemCount!.toInt();
      for (var i in msglist!) {
        if (i.chatRoomId == i.chatRoomId && i.senderId == 0) {
          null;
        } else {
          chatRoomId = i.chatRoomId ?? 0;
          idRoom = i.chatRoomId ?? 0;
          pengirim = "${i.sender!.fullname}";
          penerima = "${i.receiver!.fullname}";
          pengirimId = i.senderId ?? 0;
          penerimaId = i.receiverId ?? 0;
          imagDoktor = "${i.sender!.mediaUserProfilePicture!.media!.path}";
          imgUser = "${i.receiver!.mediaUserProfilePicture!.media!.path}";
        }
      }
      print('chat room dan id ${chatRoomId} ${idRoom}');

      // itemCount.add(result.data!.meta.itemCount);
    });

    print('msg $response');

    setState(() {
      isLoading = false;
    });
    Timer.periodic(Duration.zero, (timer) {
      if (mounted) {
        // for (var i in itemCount) {
        //     print('take' + i['itemCount'].toString());

        //   // setState(() {
        //   //   // take = i['itemCount'];
        //   //   var a = json.decode(i);
        //   //   print('take' + a.toString());
        //   // });
        // }
        // getRequest(widget.roomCode, take);
        _scrollDown();
        controller.dispose();

        // print('hey ' + itemCountt.toString());
      } else {
        timer.cancel();
      }
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

    // final dateTime = DateTime.now();
    // final stringDateTime = dateTime.toUtc().toIso8601String();
    // final parsedDateTime = DateTime.parse(stringDateTime);
    // var dateFormatted =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());

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
  newMessagee() {
    print("newMessage");
    _socket?.on('newMessage', (newMessage) async {
      print("newMessage $newMessage");
      print("message ${newMessage['message']}");
      print("message ${newMessage['sender']['fullname']}");
      // var result = json.decode(newMessage);

      // notificationService.showLocalNotification(
      //   id: widget.receiverId ?? 0,
      //   title: widget.receiverBy ?? '',
      //   body: "${newMessage['message']}",
      // );

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
            // .enableAutoConnect()
            // .setReconnectionDelay(1)
            .setExtraHeaders(
              {
                'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
              },
            )
            .build(),
      );
      _socket?.onConnect((data) async {
        print('Connection established');
        await joinRoom(widget.roomCode);
        await readMessage(widget.roomCode);

        await onlineClients(penerima);
        await newMessagee();
        await myMessage();
        await typingIndicator();
        await recentChatt();
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
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onSubmitted: (String value) {
                        getRequest(widget.roomCode, take, searchController.text);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        // enabledBorder: OutlineInputBorder(
                        //   // borderSide: BorderSide(
                        //   //     width: 3,
                        //   //     color: Colors.greenAccent), //<-- SEE HERE
                        //   // borderRadius: BorderRadius.circular(50.0),
                        // ),
                      ),
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
          preferredSize: Size.fromHeight(75.0),
          child: Container(
            height: 75.0,
            color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () async {
                            Navigator.pop(context);
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
                        penerima,
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
                              builder: (context) => DetailPasienPage(id: chatRoomId),
                            ),
                          ).then(
                            (value) => setState(() {
                              connectSocket(context);
                            }),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 25,
                          decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.circular(7)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
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
              controller: controller,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      width: 62,
                      decoration: BoxDecoration(color: subwhiteColor, borderRadius: BorderRadius.circular(5)),
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
                    idRoom == chatRoomId
                        ? Container(
                            // height: 1000,
                            child: ListView.builder(
                                // controller: controller,
                                shrinkWrap: true,
                                itemCount: msglist!.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (buildex, index) {
                                  String formattedTime = DateFormat('HH:mm').format(DateTime.parse('${msglist![index].createdAt}').toUtc().add(Duration(hours: 7, minutes: 00)));
                                  String namesImgDoktor = getInitials(msglist?[index].sender?.fullname ?? '-');
                                  String namesImguser = getInitials(msglist?[index].receiver?.fullname ?? '-');

                                  if (idRoom == chatRoomId && msglist![index].senderId == 0) {
                                    return ChatSystem(
                                      // image: widget.image,
                                      timetitle: formattedTime,
                                      // color: subwhiteColor,
                                      title: msglist![index].message,
                                    );
                                  } else if (msglist![index].senderId == pengirimId && msglist![index].message == '#####') {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                pengirim,
                                                style: blackTextStyle.copyWith(fontSize: 15, color: const Color(0xFF616161)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: FutureBuilder(
                                              future: state.detailConsultation(context, widget.id ?? 0),
                                              builder: ((context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                  return Center(child: CircularProgressIndicator());
                                                }
                                                if (snapshot.connectionState == ConnectionState.done) {
                                                  return Padding(
                                                    padding: const EdgeInsets.only(top: 10),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                                          height: 43,
                                                          width: 270,
                                                          decoration: BoxDecoration(color: greenColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                                          child: Text(
                                                            'Rekomendasi Dokter',
                                                            style: whiteTextStyle.copyWith(fontSize: 15),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                                                          // height: 299,
                                                          width: 270,
                                                          color: whiteColor,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              const Text(
                                                                'Obat',
                                                                style: TextStyle(fontSize: 15),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(top: 10),
                                                                child: ListView.builder(
                                                                    shrinkWrap: true,
                                                                    itemCount: state.data.value.consultationRecipeDrug?.length,
                                                                    itemBuilder: (context, index) {
                                                                      return Column(
                                                                        children: [
                                                                          Row(
                                                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  state.data.value.consultationRecipeDrug?[index].product?.name ?? '-',
                                                                                  style: grenTextStyle.copyWith(fontSize: 12),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  state.data.value.consultationRecipeDrug?[index].product?.drugDetail?.specificationDose ?? '-',
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
                                                                style: TextStyle(fontSize: 15),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(top: 10),
                                                                child: ListView.builder(
                                                                    shrinkWrap: true,
                                                                    itemCount: state.data.value.consultationRecomendationSkincare?.length,
                                                                    itemBuilder: (context, index) {
                                                                      return Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                state.data.value.consultationRecomendationSkincare?[index].product?.name ?? '-',
                                                                                style: grenTextStyle.copyWith(fontSize: 12),
                                                                              ),
                                                                              Text(
                                                                                state.data.value.consultationRecomendationSkincare?[index].product?.drugDetail?.specificationDose ?? '-',
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
                                                                style: TextStyle(fontSize: 15),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(top: 10),
                                                                child: ListView.builder(
                                                                    shrinkWrap: true,
                                                                    itemCount: state.data.value.consultationRecomendationTreatment?.length,
                                                                    itemBuilder: (context, index) {
                                                                      return Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                state.data.value.consultationRecomendationTreatment?[index].treatmentType ?? '-',
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
                                                              const ButtonGreenWidget(title: 'Lihat Detail')
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
                                  } else if (msglist![index].senderId == pengirimId && msglist![index].mediaChatMessages!.length == 0) {
                                    return ChatRight(
                                      imgUser: imagDoktor != "" ? '${Global.FILE}/$imagDoktor' : namesImgDoktor,
                                      // "${msglist?[index].mediaChatMessages } assets/images/doctor-img.png",
                                      // imgData: msglist![index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + msglist![index]['media_chat_messages'][index]['media']['path'] : '',
                                      nameUser: pengirim,
                                      timetitle: formattedTime,
                                      color: subgreenColor,
                                      title: msglist![index].message.toString(),
                                    );
                                  } else if (msglist![index].senderId == pengirimId && (msglist![index].mediaChatMessages?.length ?? 0) > 0) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: msglist![index].mediaChatMessages!.length == 1
                                          ? Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      pengirim,
                                                      style: blackTextStyle.copyWith(fontSize: 15, color: const Color(0xFF616161)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Image.network(
                                                      stateProfile.imgNetwork.value != "" ? '${Global.FILE}/${stateProfile.imgNetwork.value}' : 'https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg',
                                                      width: 30,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                                  padding: const EdgeInsets.only(left: 12, top: 11, right: 12, bottom: 7),
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
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      GridView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: msglist![index].mediaChatMessages!.length,
                                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                                                        itemBuilder: (BuildContext context, count) {
                                                          return Image.network(
                                                            '${Global.FILE}/${msglist![index].mediaChatMessages![0].media!.path!}',
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
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/logo_cheac_wa.png',
                                                            width: 14,
                                                          ),
                                                          const SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(formattedTime, style: subGreyTextStyle)
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
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          pengirim,
                                                          style: blackTextStyle.copyWith(fontSize: 15, color: const Color(0xFF616161)),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Image.asset(
                                                          'assets/images/doctor-img.png'.toString(),
                                                          width: 30,
                                                        ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets.symmetric(horizontal: 40),
                                                          padding: const EdgeInsets.only(left: 12, top: 11, right: 12, bottom: 7),
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              GridView.builder(
                                                                shrinkWrap: true,
                                                                itemCount: msglist![index].mediaChatMessages!.length,
                                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                                                                itemBuilder: (BuildContext context, count) {
                                                                  return Image.network(
                                                                    '${Global.FILE}/${msglist![index].mediaChatMessages![count].media!.path!}',
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
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/logo_cheac_wa.png',
                                                                    width: 14,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 2,
                                                                  ),
                                                                  Text(formattedTime, style: subGreyTextStyle)
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
                                                                backgroundColor: Colors.grey.withOpacity(0.5), // background
                                                              ),
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: ((context) => PreviewImage(
                                                                          path: msglist![index].mediaChatMessages,
                                                                          senderId: pengirim,
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
                                              : ChatRight(
                                                  imgUser: imagDoktor != "" ? '${Global.FILE}/$imagDoktor' : namesImgDoktor,

                                                  // imgData: msglist![index]['media_chat_messages'] != null ? 'https://heystetik.ahrulsyamil.com/files/' + msglist![index]['media_chat_messages'][index]['media']['path'] : '',
                                                  nameUser: pengirim,
                                                  timetitle: formattedTime,
                                                  color: subgreenColor,
                                                  title: msglist![index].message.toString(),
                                                ),
                                    );
                                  } else if (msglist![index].senderId == penerimaId && (msglist![index].mediaChatMessages?.length ?? 0) > 0) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: msglist![index].mediaChatMessages?.length == 1
                                          ? Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      penerima,
                                                      style: blackTextStyle.copyWith(fontSize: 15, color: const Color(0xFF616161)),
                                                    ),
                                                    Text(
                                                      msglist![index].mediaChatMessages!.length.toString(),
                                                      style: blackTextStyle.copyWith(fontSize: 15, color: const Color(0xFF616161)),
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
                                                  margin: const EdgeInsets.symmetric(horizontal: 40),
                                                  padding: const EdgeInsets.only(left: 12, top: 11, right: 12, bottom: 7),
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
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      GridView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: msglist![index].mediaChatMessages!.length,
                                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                                                        itemBuilder: (BuildContext context, count) {
                                                          return Image.network(
                                                            '${Global.FILE}/' + msglist![index].mediaChatMessages![0].media!.path!.toString(),
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
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/logo_cheac_wa.png',
                                                            width: 14,
                                                          ),
                                                          const SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(formattedTime, style: subGreyTextStyle)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : msglist![index].mediaChatMessages?.length != 1
                                              ? Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          penerima,
                                                          style: blackTextStyle.copyWith(fontSize: 15, color: const Color(0xFF616161)),
                                                        ),
                                                        Text(
                                                          msglist![index].mediaChatMessages!.length.toString(),
                                                          style: blackTextStyle.copyWith(fontSize: 15, color: const Color(0xFF616161)),
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
                                                          margin: const EdgeInsets.symmetric(horizontal: 40),
                                                          padding: const EdgeInsets.only(left: 12, top: 11, right: 12, bottom: 7),
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              GridView.builder(
                                                                shrinkWrap: true,
                                                                itemCount: msglist![index].mediaChatMessages?.length,
                                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                                                                itemBuilder: (BuildContext context, count) {
                                                                  return Column(
                                                                    children: [
                                                                      Image.network(
                                                                        '${Global.FILE}/' + msglist![index].mediaChatMessages![count].media!.path!,
                                                                      ),
                                                                    ],
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
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/logo_cheac_wa.png',
                                                                    width: 14,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 2,
                                                                  ),
                                                                  Text(formattedTime, style: subGreyTextStyle)
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
                                                                backgroundColor: Colors.grey.withOpacity(0.5), // background
                                                              ),
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: ((context) => PreviewImage(
                                                                          path: msglist![index].mediaChatMessages,
                                                                          senderId: penerima,
                                                                        )),
                                                                  ),
                                                                );
                                                              },
                                                              child: Text(msglist![index].mediaChatMessages!.length.toString()),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : ChatLeft(
                                                  image: imgUser != "" ? '${Global.FILE}/$imgUser' : namesImguser,
                                                  nameDoctor: penerima,
                                                  timetitle: formattedTime,
                                                  color: subwhiteColor,
                                                  title: msglist![index].message.toString(),
                                                ),
                                    );
                                  } else if (msglist![index].senderId == penerimaId) {
                                    return ChatLeft(
                                      image: imgUser != "" ? '${Global.FILE}/$imgUser' : namesImguser,
                                      // imgUser: 'assets/images/doctor-img.png',
                                      // imgData: 'https://heystetik.ahrulsyamil.com/files/' + msglist![index]['media_chat_messages'][0]['media']['path'],
                                      nameDoctor: penerima,
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
                    FutureBuilder(
                        future: state.getDetailConsltation(context, widget.id ?? 0),
                        builder: (context, snapshot) {
                          if (state.status.value == 'SELESAI') {
                            return Container(
                              height: 30,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 20),
                              color: Colors.grey,
                              child: Center(
                                child: Text(
                                  "Konsultasi selesai di ${state.endDate.value}",
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        })
                  ],
                ),
              ),
            ),
      bottomNavigationBar: FutureBuilder(
          future: state.getDetailConsltation(context, widget.id ?? 0),
          builder: (context, snapshot) {
            if (state.status.value != 'SELESAI') {
              return ChatBottomNavigator(
                textC: state.messageController,
                roomId: chatRoomId,
                senderId: pengirimId,
                receiverId: penerimaId,
                roomCode: widget.roomCode,
                senderBy: pengirim,
                receiverBy: penerima,
                id: chatRoomId,
                socket: _socket,
                sendMsg: () {
                  sendMessage(
                    chatRoomId,
                    chatRoomId,
                    pengirimId,
                    penerimaId,
                    widget.roomCode,
                    state.messageController.text.isNotEmpty ? state.messageController.text : '',
                    pengirim,
                    penerima,
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
                          decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7))),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: Get.put(DoctorConsultationController()).quickReplyChat.length,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    String desc = Get.put(DoctorConsultationController()).quickReplyChat[index]['message'];
                                    await sendMessage(
                                      chatRoomId,
                                      chatRoomId,
                                      pengirimId,
                                      penerimaId,
                                      widget.roomCode,
                                      desc,
                                      pengirim,
                                      penerima,
                                      // widget.roomId ?? 0,
                                      // widget.roomId ?? 0,
                                      // widget.senderId ?? 0,
                                      // widget.receiverId ?? 0,
                                      // widget.roomCode,
                                      // desc,
                                      // widget.senderBy ?? '',
                                      // widget.receiverBy ?? '',
                                    );

                                    Get.back();
                                    setState(() {
                                      isSuggestion = false;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(Get.put(DoctorConsultationController()).quickReplyChat[index]['shortcut']),
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
                    chatRoomId,
                    chatRoomId,
                    pengirimId,
                    penerimaId,
                    widget.roomCode,
                    pengirim,
                    penerima,
                    // widget.roomId ?? 0,
                    // widget.roomId ?? 0,
                    // widget.senderId ?? 0,
                    // widget.receiverId ?? 0,
                    // widget.roomCode,
                    // widget.senderBy ?? '',
                    // widget.receiverBy ?? '',
                  );
                },
                onGallery: () {
                  selectImageMultiple(
                    chatRoomId,
                    chatRoomId,
                    pengirimId,
                    penerimaId,
                    widget.roomCode,
                    pengirim,
                    penerima,
                  );
                },
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}
