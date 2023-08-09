// ignore_for_file: use_build_context_synchronously, library_prefixes

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';

class HistoryTransactionController extends StateClass {
  RxList historyPending = [].obs;
  RxInt totalPending = 0.obs;
  List transactionStatus = [];
  List transactionType = [];
  RxString startDate = "".obs;
  RxString endDate = "".obs;
  Rx<TransactionHistoryModel> responseHistory = TransactionHistoryModel().obs;
  RxList<Data2> dataHistory = List<Data2>.empty(growable: true).obs;
  RxList<Data2> dataHistoryPending = List<Data2>.empty(growable: true).obs;

  Future<List<Data2>> getAllHistory(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // try {
      totalPending.value = 0;
      dataHistory.value.clear();
      responseHistory.value = await TransactionService().allHistory(
        page,
        transactionStatus,
        transactionType,
        startDate.toString(),
        endDate.toString(),
        search: search,
        filter: filter,
      );

      print("total awal ${responseHistory.value.data!.data!.length}");

      for (int i = 0; i < responseHistory.value.data!.data!.length; i++) {
        if (responseHistory.value.data!.data![i].detail?.status == 'MENUNGGU_PEMBAYARAN') {
          totalPending.value += 1;
        }
        if (responseHistory.value.data!.data![i].detail?.status != 'MENUNGGU_PEMBAYARAN') {
          dataHistory.value.add(responseHistory.value.data!.data![i]);
        }
      }
      print("total Pending ${totalPending.value}");
      print("data History tidak pending ${dataHistory.value.length}");
      // } catch (e) {
      //   print("hahahah $e");
      // }
    });
    isLoading.value = false;

    return dataHistory;
  }

  Future<List<Data2>> getAllHistoryPending(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // try {
      totalPending.value = 0;
      dataHistoryPending.value.clear();
      responseHistory.value = await TransactionService().allHistory(
        page,
        transactionStatus,
        transactionType,
        startDate.toString(),
        endDate.toString(),
      );

      for (int i = 0; i < responseHistory.value.data!.data!.length; i++) {
        if (responseHistory.value.data!.data![i].detail?.status == 'MENUNGGU_PEMBAYARAN') {
          totalPending.value += 1;
          dataHistoryPending.value.add(responseHistory.value.data!.data![i]);
        }
      }
      print("dataHistoryPending ${dataHistoryPending.value.length}");
      // } catch (e) {
      //   print("hahahah sss Pending $e");
      // }
    });
    isLoading.value = false;

    return dataHistoryPending;
  }
}
