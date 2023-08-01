// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';

class AccountController extends StateClass {
  RxString fullName = '-'.obs;
  Rx<TransactionHistoryConsultationModel> data = TransactionHistoryConsultationModel().obs;

  init() async {
    fullName.value = await LocalStorage().getFullName();
  }

  Future<TransactionHistoryConsultationModel?> getMyActivity(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await TransactionService().historyConsultation();
      print(data.value.data!.data?.length);
    });
    return data.value;
  }
}
