// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_status_model.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/expired_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/success_page.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_bank.dart';

class HistoryConsultationController extends StateClass {
  Rx<TransactionHistoryConsultationModel> data =
      TransactionHistoryConsultationModel().obs;
  List<Data2>? paymentPending = [];
  RxInt totalPendingPayment = 0.obs;

  Rx<TransactionStatusModel> transactionStatus =
      TransactionStatusModel.fromJson({}).obs;

  Future<TransactionHistoryConsultationModel?> getHistoryConsultation(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      totalPendingPayment.value = 0;
      data.value = await TransactionService().historyConsultation();
      for (int i = 0; i < data.value.data!.data!.length; i++) {
        if (data.value.data!.data![i].status == 'MENUNGGU_PEMBAYARAN') {
          totalPendingPayment.value += 1;
        }
      }
    });
    return data.value;
  }

  getHistoryConsultationPaymentpending(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      totalPendingPayment.value = 0;
      paymentPending?.clear();
      data.value = await TransactionService().historyConsultation();
      for (int i = 0; i < data.value.data!.data!.length; i++) {
        if (data.value.data!.data![i].status == 'MENUNGGU_PEMBAYARAN') {
          totalPendingPayment.value += 1;
          paymentPending?.add(data.value.data!.data![i]);
        }
      }
    });
    isLoading.value = false;
  }

  RxString bank = '-'.obs;
  RxString virtualAccount = '-'.obs;
  RxString expirytime = '-'.obs;
  RxString grossAmount = '-'.obs;
  RxString statusTransaction = '-'.obs;

  getTransactionStatus(BuildContext context, String orderId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      transactionStatus.value =
          await TransactionService().transactionStatus(orderId);

      if (transactionStatus.value.success! &&
          transactionStatus.value.message == 'Success') {
        bank.value = transactionStatus.value.data?.vaNumbers?[0].bank ?? '-';
        virtualAccount.value =
            transactionStatus.value.data?.vaNumbers?[0].vaNumber ?? '-';
        expirytime.value = transactionStatus.value.data?.expiryTime ?? '-';
        grossAmount.value = transactionStatus.value.data?.grossAmount ?? '-';
        statusTransaction.value =
            transactionStatus.value.data?.transactionStatus ?? '-';

        if (statusTransaction.value == 'pending') {
          showDialog(
            context: context,
            builder: (context) => AlertWidget(
                subtitle:
                    'Silahkan bayar terlebih dahulu sebelum waktu pembayaran habis :)'),
          );
          return;
        }
        if (statusTransaction.value == 'expire') {
          Get.offAll(ExpiredPage(
            message: '',
          ));
          return;
        }
        if (statusTransaction.value == 'settlement') {
          Get.offAll(SuccessPage(
            orderId: orderId,
          ));
          showDialog(
            context: context,
            builder: (context) => BankMoreDialog(),
          );
          return;
        }
      } else if (transactionStatus.value.message == 'Transaction is expire') {
        Get.back();
        Get.offAll(ExpiredPage(
          message: transactionStatus.value.message.toString(),
        ));
        return;
      } else {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: transactionStatus.value.message.toString(),
        );
      }
    });
    isLoading.value = false;
  }
}
