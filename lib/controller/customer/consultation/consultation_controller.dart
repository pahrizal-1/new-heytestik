import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/intiate_chat_model.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart';
import 'package:heystetik_mobileapps/service/customer/consultation/consultation_service.dart';

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
  RxInt resendTime = 200.obs;
  Timer? _timer;

  getUser() async {
    username.value = await LocalStorage().getFullName();
  }

  startVerifyCountTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      resendTime.value = resendTime.value - 1;
      if (resendTime.value <= 0) {
        timer.cancel();
      }
    });
  }

  timeCondition() {
    if (_timer != null) _timer!.cancel();
  }

  @override
  void dispose() {
    timeCondition();
    super.dispose();
  }

  initiateChat(BuildContext context, String orderId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      startVerifyCountTime();
      initiate.value = await ConsultationService().initiateChat(orderId);

      print(jsonDecode(jsonEncode(initiate.value)));
      if (initiate.value!.success != true &&
          initiate.value!.message != 'Success') {
        resendTime.value == 200;
        timeCondition();
        Get.back();
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: initiate.value!.message.toString(),
        );
      }
    });
    isLoading.value = false;
  }

  getRecentChat(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      customerId.value = (await LocalStorage().getUserID())!;
      recentChat.value = await ConsultationService().recentChat();

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
