import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/intiate_chat_model.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/approve_page.dart';
import 'package:heystetik_mobileapps/service/customer/consultation/consultation_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../core/global.dart';
import '../../../pages/tabbar/tabbar_customer.dart';
import '../../../widget/alert_dialog.dart';

class ConsultationController extends StateClass {
  RxString username = '-'.obs;
  Rx<InitiateChatModel?> initiate = InitiateChatModel.fromJson({}).obs;
  // RxString virtualAccount = '-'.obs;
  // RxString expirytime = '-'.obs;
  // RxString grossAmount = '-'.obs;
  // RxString statusTransaction = '-'.obs;
  RxInt customerId = 0.obs;
  Rx<RecentChatModel?> recentChat = RecentChatModel.fromJson({}).obs;
  RxInt totalRecentChat = 0.obs;
  RxInt resendTime = 120.obs;
  Timer? _timer;
  IO.Socket? socket;
  RxString status = ''.obs;

  getUser() async {
    username.value = await LocalStorage().getFullName();
  }

  startVerifyCountTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      resendTime.value = resendTime.value - 1;
      if (resendTime.value <= 0) {
        timer.cancel();
        Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const TabBarCustomer(currentIndex: 1),
          ),
        );
      }
    });
  }

  timeCondition() {
    if (_timer != null) _timer!.cancel();
  }

  @override
  void dispose() {
    timeCondition();
    close();
    super.dispose();
  }

  initiateChat(BuildContext context, String orderId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      startVerifyCountTime();
      status.value = '';
      initiate.value = await ConsultationService().initiateChat(orderId);

      print(jsonDecode(jsonEncode(initiate.value)));
      if (initiate.value!.success != true &&
          initiate.value!.message != 'Success') {
        resendTime.value == 200;
        // timeCondition();
        // connectSocket(Get.context!);
        close();
        // Get.back();
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: initiate.value!.message.toString(),
        );
      }

      if (initiate.value!.success == true &&
          initiate.value!.message == 'Success') {
        resendTime.value == 200;
        // timeCondition();
        // connectSocket(Get.context!);
        // Navigator.push(
        //   Get.context!,
        //   MaterialPageRoute(
        //     builder: (context) => const TabBarCustomer(currentIndex: 1),
        //   ),
        // );
        Get.to(ApprovePage(
          orderId: orderId,
        ));
        showDialog(
          context: Get.context!,
          builder: (context) =>
              AlertWidget(subtitle: 'Data Anda Sudah Terkirim ke Doktor'),
        );

        status.value =
            'Data anda sedang di review oleh dokter, harap tunggu yaa';
      } else {
        print("hasil ${initiate.value}");
        showDialog(
          context: Get.context!,
          builder: (context) =>
              AlertWidget(subtitle: 'Tidak Ada Doktor Yang Online'),
        );
      }
    });
    isLoading.value = false;
  }

  eventConsultationExpired() {
    socket?.on('consultationScheduleExpired', (expired) async {

    });
  }

  eventApp() {
    print("app");
    socket?.on('app', (app) async {
      log("appEvent $app");
      print("appEv ");
      print("ap ${app['message']}");
      // if (app['event'] != "consultationScheduleExpired") {
      //   Navigator.push(
      //     Get.context!,
      //     MaterialPageRoute(
      //       builder: (context) => const TabBarCustomer(currentIndex: 1),
      //     ),
      //   );
      // } else {
      //   Navigator.pushAndRemoveUntil<dynamic>(
      //     Get.context!,
      //     MaterialPageRoute<dynamic>(
      //       builder: (BuildContext context) => TabBarCustomer(),
      //     ),
      //     (route) => false, //if you want to disable back feature set to false
      //   );
      //   showDialog(
      //     context: Get.context!,
      //     builder: (context) =>
      //         AlertWidget(subtitle: 'Permintaan anda telah kadaluarsa'),
      //   );
      //   close();
      // }
      Navigator.pushAndRemoveUntil<dynamic>(
          Get.context!,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => TabBarCustomer(),
          ),
          (route) => false, //if you want to disable back feature set to false
        );
        showDialog(
          context: Get.context!,
          builder: (context) =>
              AlertWidget(subtitle: 'Permintaan anda telah kadaluarsa'),
        );
        close();
    });
  }

  connectSocket(BuildContext context) async {
    try {
      socket = IO.io(
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

      socket?.onConnect((data) async {
        print('Connection established');
        eventApp();
        infoLog();

        // await recentChatt();
      });
      socket?.onConnectError((data) async {
        print('Connect Error: $data');
      });
      socket?.onDisconnect((data) async {
        print('Socket.IO server disconnected');
      });
    } catch (e) {
      print('error nih $e');
    }
  }

  infoLog() {
    print("logInfo");
    socket?.on('log', (logInfo) {
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
      socket?.disconnect();
      socket?.close();
      socket?.destroy();
      print('SOCKET DISCONNECTED');
    } catch (e) {
      print("error close $e");
    }
  }

  getRecentChat(BuildContext context, {String? search}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      customerId.value = (await LocalStorage().getUserID())!;
      recentChat.value = await ConsultationService().recentChat(search: search);

      if (recentChat.value!.success != true &&
          recentChat.value!.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: recentChat.value!.message.toString(),
        );
      }

      // SET TOTAL RECENT CHAT
      totalRecentChat.value = recentChat.value!.data!.length;
    });
    isLoading.value = false;
  }
}
