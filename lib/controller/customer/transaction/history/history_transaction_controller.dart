// ignore_for_file: use_build_context_synchronously, library_prefixes, invalid_use_of_protected_member

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_by_id_model.dart'
    as ByID;

class HistoryTransactionController extends StateClass {
  RxList historyPending = [].obs;
  Rx<TransactionHistoryModel> responseHistory = TransactionHistoryModel().obs;
  RxList<Data2> dataHistory = List<Data2>.empty(growable: true).obs;
  RxList<Data2> dataHistoryPending = List<Data2>.empty(growable: true).obs;
  Rx<ByID.PaymentMethodByIdModel> paymentMethod =
      ByID.PaymentMethodByIdModel.fromJson({}).obs;

  Future<ByID.Data?> getPaymentmethod(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      paymentMethod.value = await TransactionService().paymentMethodById(id);
    });
    isLoading.value = false;
    return paymentMethod.value.data;
  }

  Future<List<Data2>> getAllHistory(BuildContext context, int page,
      {String? search, Map<String, dynamic>? filter}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      dataHistory.value.clear();
      responseHistory.value = await TransactionService().allHistory(
        page,
        search: search,
        filter: filter,
      );
      dataHistory.value.addAll(responseHistory.value.data!.data!);
    });
    isLoading.value = false;

    return dataHistory;
  }

  Future<List<Data2>> getAllHistoryPending(BuildContext context, int page,
      {String? search, Map<String, dynamic>? filter}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      dataHistoryPending.value.clear();
      responseHistory.value = await TransactionService().allHistory(
        page,
        search: search,
        filter: filter,
      );

      for (int i = 0; i < responseHistory.value.data!.data!.length; i++) {
        if (responseHistory.value.data!.data![i].detail?.status ==
            'MENUNGGU_PEMBAYARAN') {
          dataHistoryPending.value.add(responseHistory.value.data!.data![i]);
        }
      }
      print("dataHistoryPending ${dataHistoryPending.value.length}");
    });
    isLoading.value = false;

    return dataHistoryPending;
  }
}
