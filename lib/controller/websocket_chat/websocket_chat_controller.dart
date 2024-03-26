import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core/global.dart';
import '../../core/local_storage.dart';
import '../../core/state_class.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';

import '../doctor/home/home_controller.dart';

class WebSocketChatController extends StateClass {
  IO.Socket? _socket;
  RxBool isOnline = false.obs;
  final DoctorHomeController state = Get.put(DoctorHomeController());
  List dataScheduleConsultation = [];

  connectSocket(BuildContext context) async {
    try {
      _socket = IO.io(
        '${Global.BASE_API}/socket',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .setExtraHeaders(
              {
                'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
              },
            )
            .build(),
      );

      _socket?.onConnect((data) async {
        await newConsultationSchedule();
        print('Connection established masuk sini');

        // await recentChatt();
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

  newConsultationSchedule() async {
    print("newConsultationSchedule");
    print('brap ' + state.totalFindSchedule.toString());
    _socket?.on('newConsultationSchedule', (newConsultationSchedule) async {
      print("newConsultationSchedule $newConsultationSchedule");
      log("newConsultationSchedule $newConsultationSchedule");

      print("cout" + dataScheduleConsultation.length.toString());
      print("cout" + dataScheduleConsultation.toString());
      // state.totalFindSchedule.value = newConsultationSchedule.length;
      state.init(Get.context!);
    });
  }
}
