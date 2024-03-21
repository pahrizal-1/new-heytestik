// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_status_model.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/expired_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/failed_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/success_page.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_bank.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryConsultationController extends StateClass {
  Rx<TransactionHistoryConsultationModel> data =
      TransactionHistoryConsultationModel().obs;
  List<Data2>? paymentPending = [];
  RxInt totalPendingPayment = 0.obs;

  Rx<TransactionStatusModel> transactionStatus =
      TransactionStatusModel.fromJson({}).obs;
  RxString expirytime = ''.obs;

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

  launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception('Could not launch $urlParse');
    }
  }

  Future<void> getTransactionStatus(
      BuildContext context, String orderId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      transactionStatus.value =
          await TransactionService().transactionStatusConsultation(orderId);
      switch (transactionStatus.value.data?.paymentStatus) {
        case 'SUCCEEDED':
          print("SUCCEEDED");
          expirytime.value = '';
          Get.offAll(() => SuccessPage(
                orderId: orderId,
                isWillPop: true,
              ));
          showDialog(
            context: context,
            builder: (context) => BankMoreDialog(),
          );
          break;
        case 'PENDING':
          print("PENDING");
          expirytime.value = transactionStatus.value.data?.expiryTime ?? '';
          if (transactionStatus.value.data!.paymentMethod == 'EWALLET') {
            // await _launchURL(
            //   transactionStatus.value.data!.actions![0].url.toString(),
            // );
          } else if (transactionStatus.value.data!.paymentMethod ==
              'VIRTUAL_ACCOUNT') {
          } else if (transactionStatus.value.data!.paymentMethod ==
              'BANK_TRANSFER_MANUAL_VERIFICATION') {
          } else if (transactionStatus.value.data!.paymentMethod == 'QR_CODE') {
          } else if (transactionStatus.value.data!.paymentMethod == 'FREE') {}
          break;
        case 'FAILED':
          print("FAILED");
          Get.offAll(() => FailedPage(
                message: "FAILED",
              ));
          break;
        case 'EXPIRED':
          print("EXPIRED");
          Get.offAll(() => ExpiredPage(
                message: "EXPIRED",
              ));
          break;
        case 'UNKNOWN':
          print("UNKNOWN");
          Get.offAll(() => FailedPage(
                message: "UNKNOWN",
              ));
          break;
        default:
          print("DEFAULT");
          Get.offAll(() => FailedPage(
                message: "ERROR TIDAK DIKETAHUI",
              ));
          break;
      }
    });
    isLoading.value = false;
  }
}
