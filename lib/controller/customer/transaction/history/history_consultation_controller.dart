// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';

class HistoryConsultationController extends StateClass {
  Rx<TransactionHistoryConsultationModel> data =
      TransactionHistoryConsultationModel().obs;
  RxInt totalPendingPayment = 0.obs;

  Future<TransactionHistoryConsultationModel?> getHistoryConsultation(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      totalPendingPayment.value = 0;
      data.value = await TransactionService().historyConsultation();
      print(data.value.data!.data?.length);
      for (int i = 0; i < data.value.data!.data!.length; i++) {
        if (data.value.data!.data![i].status == 'MENUNGGU_PEMBAYARAN') {
          totalPendingPayment.value += 1;
        }
      }
      print('total ${totalPendingPayment.value}');
    });
    return data.value;
  }
}
