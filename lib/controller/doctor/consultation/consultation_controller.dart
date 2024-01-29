// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart'
    as RecentChat;
import 'package:heystetik_mobileapps/models/doctor/current_schedule_model.dart';
import 'package:heystetik_mobileapps/models/doctor/list_message_model.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
// import 'package:heystetik_mobileapps/service/doctor/consultation_schedule/consultation_schedule_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../core/convert_date.dart';
import '../../../models/doctor/detail_constultation_model.dart'
    as DetailConstultaion;
import '../../../models/doctor/find_doctor_note_model.dart' as DoctorNote;
import '../../../service/doctor/recent_chat/recent_chat_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:heystetik_mobileapps/service/doctor/consultation/consultation_service.dart';

class DoctorConsultationController extends StateClass {
  RxInt wigetIndex = 0.obs;
  Rx<CurrentDoctorScheduleModel?> currentSchedule =
      CurrentDoctorScheduleModel.fromJson({}).obs;
  RxInt currentScheduleId = 0.obs;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxString endCreatedAt = ''.obs;
  RxString startTime1 = ''.obs;
  RxString startTime2 = ''.obs;
  RxString endTime1 = ''.obs;
  RxString endTime2 = ''.obs;

  RxList listRecentChat = [].obs;
  RxList listLastChat = [].obs;
  RxList quickReplyChat = [].obs;
  RxList fetchMessageByRoom = [].obs;
  List fileImage = [];

  List<XFile> selectedMultipleImage = [];
  String? fileImg64;
  RxString dateStr = ''.obs;

  File? imagePath;
  RxString mediaImg = ''.obs;

  RxBool isFirstSchedule = false.obs;
  RxBool isSecondSchedule = false.obs;
  RxInt doctorId = 0.obs;

  Rx<RecentChat.RecentChatModel?> recentChat =
      RecentChat.RecentChatModel.fromJson({}).obs;
  Rx<DetailConstultaion.ConsultationDetailModel?> constultaionDetail =
      DetailConstultaion.ConsultationDetailModel.fromJson({}).obs;
  RxInt totalRecentChatActive = 0.obs;
  RxInt totalRecentChatDone = 0.obs;
  List<RecentChat.Data> recentChatActive = [];
  List<RecentChat.Data> recentChatDone = [];

  List<Data2>? msglist = [];
  Rx<DoctorNote.Data> data = DoctorNote.Data.fromJson({}).obs;
  RxList dataDoctorNote = [].obs;
  Rx<DoctorNote.FindDoctorNoteModel> dataFind =
      DoctorNote.FindDoctorNoteModel.fromJson({}).obs;

  IO.Socket? _socket;
  RxBool isOnline = false.obs;
  RxBool isTyping = false.obs;
  RxBool isSuggestion = false.obs;
  RxInt take = 0.obs;
  RxInt itemCount = 1.obs;

  TextEditingController messageController = TextEditingController();
  TextEditingController indicationController = TextEditingController();
  TextEditingController diagnosisPossibilityController =
      TextEditingController();
  TextEditingController diagnosisSecondaryController = TextEditingController();
  TextEditingController suggestionController = TextEditingController();

  RxList diagnosisPossibility = [].obs;
  RxList diagnosisSecondary = [].obs;
  RxList listConstulDetail = [].obs;
  RxString idConsultation = ''.obs;
  RxString status = ''.obs;
  RxString dateConsultation = ''.obs;
  RxString endDate = ''.obs;
  RxString pasienName = ''.obs;
  RxString topic = ''.obs;
  RxList listPreAssesment = [].obs;
  RxList listPreAssesmentImage = [].obs;
  List listSkincare = [].obs;
  List listTreatmentNote = [].obs;
  List listTreatment = [].obs;
  List listObat = [].obs;
  List<int>? listItemCount = [1];
  List<TextEditingController> notesSkincare = [];
  List<TextEditingController> notesMedicine = [];
  List findDoctorNote = [];

  void clearData() {
    indicationController.clear();
    diagnosisPossibilityController.clear();
    diagnosisSecondaryController.clear();
    diagnosisSecondary.value = [];
    diagnosisPossibility.value = [];
    listSkincare = [];
    notesSkincare = [];
    listTreatmentNote = [];
    listItemCount = [];
    listObat = [];
    notesMedicine = [];
  }

  Future<CurrentDoctorScheduleModel?> getCurrentDoctorSchedule(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      currentSchedule.value =
          await ConsultationDoctorScheduleServices().getCurrentDoctorSchedule();
      if (currentSchedule.value!.success!) {
        currentScheduleId.value = currentSchedule.value!.data!.id ?? 0;
        startTime.value = currentSchedule.value!.data!.firstSchedule ?? '-';
        endTime.value = currentSchedule.value!.data!.lastSchdule ?? '-';

        DateTime now = DateTime.now();
        print('now $now');

        String dateStr = now.toString().substring(0, 10);
        print('tanggal $dateStr');

        DateTime first1 = now;
        DateTime first2 = now;
        DateTime second1 = now;
        DateTime second2 = now;

        // CEK APAKAH JADWAL PERTAMA ADA ATAU TIDAK
        if (currentSchedule.value!.data!.firstSchedule != null) {
          // if (startTime.value.isNotEmpty ||
          //     startTime.value != '-' ||
          //     startTime.value != '') {
          startTime1.value = CurrentTime.getFirstTime(
            currentSchedule.value!.data!.firstSchedule.toString(),
          );
          print('startTime1 ${startTime1.value}');

          startTime2.value = CurrentTime.getLastTime(
            currentSchedule.value!.data!.firstSchedule.toString(),
          );
          print('startTime2 ${startTime2.value}');

          first1 = DateTime.parse('$dateStr ${startTime1.value}');
          first2 = DateTime.parse('$dateStr ${startTime2.value}');
          // }
        }
        // CEK APAKAH JADWAL KEDUA ADA ATAU TIDAK
        if (currentSchedule.value!.data!.lastSchdule != null) {
          // if (endTime.value.isNotEmpty ||
          //     endTime.value != '-' ||
          //     endTime.value != '') {
          endTime1.value = CurrentTime.getFirstTime(
            currentSchedule.value!.data!.lastSchdule.toString(),
          );
          print('endTime1 ${startTime2.value}');

          endTime2.value = CurrentTime.getLastTime(
            currentSchedule.value!.data!.lastSchdule.toString(),
          );
          print('endTime2 ${startTime2.value}');

          second1 = DateTime.parse('$dateStr ${endTime1.value}');
          second2 = DateTime.parse('$dateStr ${endTime2.value}');
          // }
        }

        print('first1 $first1');
        print('first2 $first2');
        print('second1 $second1');
        print('second2 $second2');

        if (now.isAfter(first1) && now.isBefore(first2)) {
          print('jadwal pertama');
          isFirstSchedule.value = true;
          isSecondSchedule.value = false;
        } else if (now.isAfter(second1) && now.isBefore(second2)) {
          print('jadwal kedua');
          isFirstSchedule.value = false;
          isSecondSchedule.value = true;
        } else {
          print('salah');
          isFirstSchedule.value = false;
          isSecondSchedule.value = false;
        }
      }
    });

    return currentSchedule.value;
  }

  detailConsultation(BuildContext context, int id) async {
    // isLoading.value = true;
    print('idspx' + id.toString());
    try {
      var res = await ConsultationDoctorScheduleServices().getDoctorNote(id);
      data.value = res.data!;
    } catch (e) {
      print('err ${e}');
    }
    // await ErrorConfig.doAndSolveCatchInContext(context, () async {
    //   var res = await ConsultationDoctorScheduleServices().getDoctorNote(id);
    //   data.value = res.data!;
    //   print('object' + data.toJson().toString());
    //   print('length' + data.value.consultationRecipeDrug!.length.toString());
    //   // findDoctorNote.add(res);
    //   // print('res' + findDoctorNote.toString());
    // });
    // isLoading.value = false;
  }

  Future getListRecentChat(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      totalRecentChatActive.value = 0;
      totalRecentChatDone.value = 0;
      recentChatActive.clear();
      recentChatDone.clear();

      doctorId.value = (await LocalStorage().getUserID())!;

      recentChat.value =
          await ConsultationDoctorScheduleServices().recentChat();

      print('recen ' + recentChat.toJson().toString());

      if (recentChat.value!.success != true &&
          recentChat.value!.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: recentChat.value!.message.toString(),
        );
      }

      for (int i = 0; i < recentChat.value!.data!.length; i++) {
        if (recentChat.value!.data![i].ended == false) {
          // ADD RECENT CHAT ACTIVE
          recentChatActive.add(recentChat.value!.data![i]);
        } else {
          // ADD RECENT CHAT DONE
          recentChatDone.add(recentChat.value!.data![i]);
        }
      }

      // SET TOTAL RECENT CHAT ACTIVE
      totalRecentChatActive.value = recentChatActive.length;
      print('total' + totalRecentChatActive.toString());

      // SET TOTAL RECENT CHAT DONE
      totalRecentChatDone.value = recentChatDone.length;
    });
    isLoading.value = false;
  }

  Future quickReply() async {
    // isLoading.value = true;
    var response = await QuickReplyChat().getQuickReply();
    quickReplyChat.value = response;

    // isLoading.value = false;
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
      // return imagePath;
    } else {
      print("image not selected");
    }
  }

  Future getDetailConsltation(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response =
          await ConsultationDoctorScheduleServices().getDetailConstultaion(id);
      print('data nya bpra ' + response.toString());

      listConstulDetail.add(response);
      print('hey ${listConstulDetail.toJson()}');
      listPreAssesment.value = [];
      listPreAssesmentImage.value = [];
      for (var i in listConstulDetail) {
        print("status nya berapa  ${i['status']}");
        idConsultation.value = i['code'];
        status.value = i['status'];
        dateConsultation.value = ConvertDate.defaultDate(i['created_at']);
        pasienName.value = i['customer']['fullname'];
        topic.value =
            i['medical_history']['interest_condition']['concern']['name'];
        listPreAssesment.value = [];
        listPreAssesmentImage.value = [];
        for (var e in i['medical_history']['medical_history_items']) {
          listPreAssesment.add(e);
          log('data  ' + listPreAssesment.toString());
        }
        for (var image in i['medical_history']['media_medical_histories']) {
          listPreAssesmentImage.add(image);
          log('data  ' + listPreAssesmentImage.toString());
        }
        if (i['end_date'] == null) {
          endDate.value = '-';
          endCreatedAt.value = '';
        } else {
          final dateString = i['end_date'];
          endCreatedAt.value = i['end_date'];
          final dateTime = DateTime.parse(dateString);
          final format = DateFormat('yyyy-MM-dd');
          endDate.value = format.format(dateTime);
          print('endD' + endDate.toString());
        }
      }
      log('resp  ' + listConstulDetail.toString());
    });
    isLoading.value = false;
  }

  postFinish(BuildContext context, int id) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      isLoading.value = true;
      var res = await ConsultationDoctorScheduleServices().postFinishReview(id);
      print('res' + res.toString());
      Navigator.pop(context);
      isLoading.value = false;
    });
  }

  postFinishConsultation(BuildContext context, int id) async {
    try {
      var res =
          await ConsultationDoctorScheduleServices().postFinishConsultation(id);
      print('res' + res.toString());
      Navigator.pop(context);
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(0),
              content: Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Silahkan Tunggu Sampai Dengan jam ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${endCreatedAt.value}').toUtc().add(Duration(hours: 7, minutes: 00)))}'),
                    SizedBox(height: 10,),
                    ButtonGreenWidget(
                      title: 'Kembali ke home',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            );
            // return AlertDialog(
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Navigator.pop(context);
            //           },
            //           child: Text('OK'))
            //     ],
            //     title: Text('Failed'),
            //     content: Text(
            //         'Silahkan Tunggu Sampai Dengan jam ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${endCreatedAt.value}').toUtc().add(Duration(hours: 7, minutes: 00)))}'));
          });
    }
    // await ErrorConfig.doAndSolveCatchInContext(context, () async {
    //   isLoading.value = true;
    //   var res =
    //       await ConsultationDoctorScheduleServices().postFinishConsultation(id);
    //   print('res' + res.toString());
    //   Navigator.pop(context);
    //   isLoading.value = false;
    // });
  }

  postDoctorNote(
    BuildContext context,
    int id,
  ) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (indicationController.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Gejala harus diisi',
        );
      }

      var data = {
        'indication': indicationController.text,
        'diagnosis_possibility': diagnosisPossibility,
        'diagnosis_secondary': diagnosisSecondary,
        'suggestion': suggestionController.text,
        'recomendation_skincare_items': [
          for (var i = 0; i < listSkincare.length; i++)
            {
              "skincare_id": listSkincare[i]['id'],
              "notes": notesSkincare[i].text,
              "qty": listItemCount![i]
            }
        ],
        'recomendation_treatment_items': [
          for (var i in listTreatmentNote)
            {
              "name": i['name'],
              "cost": i['cost'],
              "recovery_time": i['recovery_time'],
              "type": i['type'],
              "clinics": [
                for (var clinic in i['clinics'])
                  {"clinic_id": clinic['clinic']['id']}
              ]
            }
        ],
        'recipe_drug_items': [
          for (var i = 0; i < listObat.length; i++)
            {"drug_id": listObat[i]['id'], "notes": notesMedicine[i].text},
        ]
      };
      print('masyk sini');

      var postNote =
          await ConsultationDoctorScheduleServices().postDoctorNote(data, id);

      if (postNote['success'] != true && postNote['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: postNote['message'],
        );
      }
    });
    isLoading.value = false;
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

  Future getRequest(String roomCode) async {
    // isLoading.value = true;
    //replace your restFull API here.
    var response = await FetchMessageByRoom().getFetchMessage(roomCode, 1000, '');
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
      Data2 result = Data2.fromJson(recentChat['last_chat']);
      msglist?.add(result);
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
}
