import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/intiate_chat_model.dart';
import 'package:heystetik_mobileapps/service/customer/consultation/consultation_service.dart';

class ConsultationController extends StateClass {
  Rx<InitiateChatModel?> initiate = InitiateChatModel.fromJson({}).obs;
  RxString virtualAccount = '-'.obs;
  RxString expirytime = '-'.obs;
  RxString grossAmount = '-'.obs;
  RxString statusTransaction = '-'.obs;

  initiateChat(BuildContext context, String orderId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      initiate.value = await ConsultationService().initiateChat(orderId);

      if (initiate.value!.success != true &&
          initiate.value!.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: initiate.value!.message.toString(),
        );
      }
    });
    isLoading.value = false;
  }
}
