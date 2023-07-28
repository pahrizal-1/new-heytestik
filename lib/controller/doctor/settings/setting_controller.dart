import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';

import '../../../core/error_config.dart';
import '../../../models/doctor/reply_chat_model.dart';
import '../../../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/balasan_chat_page.dart';
import '../../../pages/tabbar/tabbar_doctor.dart';
import '../../../service/doctor/settings/reply_chat_service.dart';

class SettingController extends StateClass {
  var replyChatService = ReplyChatService();
  // var quickReplyChat = Data2().obs;
  RxList quickListChat = [].obs;
  TextEditingController shortcutController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future getReplyChat() async {
    isLoading.value = true;
    var response = await replyChatService.getReplyChat();
    // quickReplyChat.add(response);
    quickListChat.value = response;
    print('GetUserInfoDataDompet : ' + quickListChat.toString());

    isLoading.value = false;
  }

  postQuickChat(
    BuildContext context,
  ) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (shortcutController.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Shortcut harus diisi',
        );
      }

      if (messageController.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Message harus diisi',
        );
      }
      var data = {
        'shortcut': shortcutController.text,
        'message': messageController.text,
      };

      var res = await replyChatService.postReplyChat(data);
      print('res' + res.toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TabBarDoctor(),
        ),
      );
      shortcutController.text = '';
      messageController.text = '';
    });
    isLoading.value = false;
  }
}
