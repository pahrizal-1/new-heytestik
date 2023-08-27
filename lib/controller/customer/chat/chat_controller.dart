import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/models/customer/detail_consultation_model.dart'
    as Detail;
import 'package:heystetik_mobileapps/models/customer/gallery_file_model.dart'
    as Gallery;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/local_storage.dart';
import '../../../core/state_class.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../models/doctor/list_message_model.dart';
import '../../../service/doctor/recent_chat/recent_chat_service.dart';

class CustomerChatController extends StateClass {
  RxList listRecentChat = [].obs;
  RxList listLastChat = [].obs;
  List fileImage = [];

  List<XFile> selectedMultipleImage = [];
  String? fileImg64;

  File? imagePath;
  IO.Socket? _socket;
  RxBool isOnline = false.obs;
  RxBool isTyping = false.obs;
  List<Data2>? msglist = [];

  TextEditingController messageController = TextEditingController();

  Future getListRecentChat() async {
    isLoading.value = true;
    var response = await RecentChatService().getRecentChat();
    listRecentChat.value = response;

    // for (var i in response) {
    //   log('print ' + i['last_chat']['message'].toString());
    //   listLastChat.add(i['last_chat']);
    //   log('brapa ' + listLastChat.length.toString());
    // }
    isLoading.value = false;
  }

  Future getLastChat() async {
    isLoading.value = true;
    var response = await LastChatService().getLastChat();
    for (var i in response) {
      listLastChat.add(i['last_chat']);
    }

    isLoading.value = false;
  }

  // image from camera
  Future openCamera() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imagePath = File(pickedImage.path);
      print('img path $imagePath');
      final bytes = File(imagePath!.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      String baseImg64 = "data:/png;base64,$img64";
      fileImage.add(baseImg64);
      return imagePath;
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
      // Navigator.push(
      //   Get.context!,
      //   MaterialPageRoute(
      //     builder: (context) => CameraViewPage(
      //       path: selectedMultipleImage,
      //       idRoom: idRoom,
      //       chatRoomId: chatRoomId,
      //       userId: userId,
      //       receiverId: receiverId,
      //       roomCode: roomCode,
      //       senderBy: senderBy,
      //       receiverBy: receiverBy,
      //     ),
      //   ),
      // );
      for (var i = 0; i < selectedMultipleImage.length; i++) {
        final bytes = File(selectedMultipleImage[i].path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        String baseImg64 = "data:/png;base64," + img64;
        fileImage.add(baseImg64);
      }
    }
    // selectedMultipleImage = [];
    // print('kosong ga' + selectedMultipleImage.toString());
  }

  // EVENT ONLINE CLIENT (udah dipanggil)
  onlineClients(String receiver) {
    print("onlineClients");
    _socket?.on('onlineClients', (onlineClients) async {
      print("onlineClients $onlineClients");
      if (onlineClients.length != null) {
        for (int i = 0; i < onlineClients.length; i++) {
          if (onlineClients[i]['user_fullname'] == receiver) {
            isOnline.value = true;
          } else {
            isOnline.value = false;
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
      msglist?.add(result);
      print('hey ' + result.toString());

      // setState(() {
      //   msglist?.add(result);
      // });
    });
    print("newMessage" + listLastChat.toString());
  }

  // EVENT JOIN ROOM (udah dipanggil)
  readMessage(String roomCode) {
    print('readMessage');
    _socket?.emit('readMessage', {"room": roomCode});
    print('readMessage');
  }

  Future getRequest(String roomCode) async {
    // isLoading.value = true;
    //replace your restFull API here.
    var response = await FetchMessageByRoom().getFetchMessage(roomCode, 1000);
    ListMessageModel result = ListMessageModel.fromJson(response);
    msglist = result.data?.data;
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
          isTyping.value = true;
        } else {
          isTyping.value = false;
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
      "chat_room_id": 2,
      "sender_id": userId,
      "receiver_id": receiverId,
      "message": textMessage,
      "seen": false,
      "created_by": null,
      "updated_by": null,
      "created_at": "2023-07-04T12:35:06.173Z",
      "updated_at": "2023-07-04T12:35:06.173Z",
      "deleted_at": null,
      "sender": {
        "fullname": senderBy,
      },
      "receiver": {
        "fullname": receiverBy,
      }
    };
    // listLastChat.add(newMes);
    Data2 result = Data2.fromJson(newMes);
    msglist?.add(result);
    messageController.clear();
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
      msglist?.add(recentChat['last_chat']['message']);
      // listLastChat.add(recentChat['last_chat']);
      log("de $listLastChat");

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
        'http://192.168.0.118:8193/socket',
        // 'wss://heystetik.ahrulsyamil.com/socket',
        // 'ws://101.255.117.74:8192/chat',
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

  Rx<Detail.Data> data = Detail.Data.fromJson({}).obs;

  detailConsultation(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await DetailConsultationService().detailConsultation(id);
      data.value = res.data!;
    });
    isLoading.value = false;
  }

  RxList<Gallery.Data2> gallery = List<Gallery.Data2>.empty(growable: true).obs;

  galleryFile(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await DetailConsultationService().galleryFile(id);
      gallery.value = res.data!.data!;
      print("hehehahahah" + jsonDecode(jsonEncode(res)));
    });
    isLoading.value = false;
  }

  Future invoiceDownload(BuildContext context, int id) async {
    var res;
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      res = await DetailConsultationService().invoiceDownload(id);

      print("hasass" + res);
    });
    isLoading.value = false;
    return res;
  }
}
