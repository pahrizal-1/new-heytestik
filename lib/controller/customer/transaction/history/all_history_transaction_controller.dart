// ignore_for_file: use_build_context_synchronously, library_prefixes

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_consultation_model.dart'
    as Consultation;
import 'package:heystetik_mobileapps/models/customer/transaction_history_treatment_model.dart'
    as Treatment;
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';

class AllHistoryTransactionController extends StateClass {
  // ALL
  RxList activity = [].obs;
  RxList history = [].obs;
  RxList historyNotPending = [].obs;
  RxList historyPending = [].obs;
  RxInt totalPending = 0.obs;

  // Consultation
  Rx<Consultation.TransactionHistoryConsultationModel> consultation =
      Consultation.TransactionHistoryConsultationModel().obs;
  List<Consultation.Data2>? pendingConsultation = [];
  RxInt totalPendingConsultation = 0.obs;

  // Treatment
  Rx<Treatment.TransactionHistoryTreatmentModel> treatment =
      Treatment.TransactionHistoryTreatmentModel().obs;
  List<Treatment.Data2>? pendingTreatment = [];
  RxInt totalPendingTreatment = 0.obs;

  Future getMyActivity(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // CLEAR
      activity.clear();

      // ================
      await getHistoryConsultation(context);
      print('consultation length ${consultation.value.data!.data!.length}');
      for (int i = 0; i < consultation.value.data!.data!.length; i++) {
        if (consultation.value.data!.data?[i].status != 'SELESAI') {
          activity.add(consultation.value.data!.data?[i]);
        }
      }
      print('consultation history ${activity.length}');

      // ================
      await getHistoryTreatment(context);
      print('treatment length ${treatment.value.data!.data!.length}');
      for (int i = 0; i < treatment.value.data!.data!.length; i++) {
        if (treatment.value.data!.data?[i].status != 'SELESAI') {
          activity.add(treatment.value.data!.data?[i]);
        }
      }
      print('treatment history ${activity.length}');

      // ================
      print('history ${activity.length}');

      activity.sort((a, b) {
        return DateTime.parse(b.createdAt)
            .compareTo(DateTime.parse(a.createdAt));
      });
    });

    return activity;
  }

  Future getAllHistory(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // CLEAR
      history.clear();
      historyNotPending.clear();
      totalPending.value = 0;
      pendingConsultation?.clear();
      totalPendingConsultation.value = 0;
      pendingTreatment?.clear();
      totalPendingTreatment.value = 0;

      // ================
      await getHistoryConsultation(context);
      print('consultation length ${consultation.value.data!.data!.length}');
      for (int i = 0; i < consultation.value.data!.data!.length; i++) {
        history.add(consultation.value.data!.data?[i]);
      }
      print('consultation history ${history.length}');

      // ================
      await getHistoryTreatment(context);
      print('treatment length ${treatment.value.data!.data!.length}');
      for (int i = 0; i < treatment.value.data!.data!.length; i++) {
        history.add(treatment.value.data!.data?[i]);
      }
      print('treatment history ${history.length}');

      // ================
      print('history ${history.length}');
      for (int i = 0; i < history.length; i++) {
        if (history[i].status == 'MENUNGGU_PEMBAYARAN') {
          totalPending.value += 1;
        }
        if (history[i].status != 'MENUNGGU_PEMBAYARAN') {
          historyNotPending.add(history[i]);
        }
      }

      print('totalPending ${totalPending.value}');
      print('history $history');
      print('historyNotPending ${historyNotPending.length}');

      historyNotPending.sort((a, b) {
        return DateTime.parse(b.createdAt)
            .compareTo(DateTime.parse(a.createdAt));
      });
    });

    return historyNotPending;
  }

  // Future<Consultation.TransactionHistoryConsultationModel?>
  getHistoryConsultation(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        // totalPendingConsultation.value = 0;
        consultation.value = await TransactionService().historyConsultation();
        // for (int i = 0; i < consultation.value.data!.data!.length; i++) {
        // if (consultation.value.data!.data![i].status ==
        //     'MENUNGGU_PEMBAYARAN') {
        //   totalPendingConsultation.value += 1;
        // }
        // }
      } catch (e) {
        print("consultation error $e");
      }
    });
    // return consultation.value;
  }

  // Future<Treatment.TransactionHistoryTreatmentModel?>
  getHistoryTreatment(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        // totalPendingTreatment.value = 0;
        treatment.value = await TransactionService().historyTreatment();
        // for (int i = 0; i < treatment.value.data!.data!.length; i++) {
        //   if (treatment.value.data!.data![i].status == 'MENUNGGU_PEMBAYARAN') {
        //     totalPendingTreatment.value += 1;
        //   }
        // }
      } catch (e) {
        print("treatment error $e");
      }
    });
    // return treatment.value;
  }

  Future getAllHistoryPending(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // CLEAR
      historyPending.clear();
      totalPendingConsultation.value = 0;
      totalPendingTreatment.value = 0;

      try {
        print('history ${history.length}');
        for (int i = 0; i < history.length; i++) {
          if (history[i].status == 'MENUNGGU_PEMBAYARAN') {
            if (history[i].transactionType == 'CONSULTATION') {
              totalPendingConsultation.value += 1;
            }

            if (history[i].transactionType == 'TREATMENT') {
              totalPendingTreatment.value += 1;
            }

            historyPending.add(history[i]);
          }
        }
        print('historyPending ${historyPending.length}');

        print('totalPending ${totalPending.value}');
        print('totalPendingConsultation ${totalPendingConsultation.value}');
        print('totalPendingTreatment ${totalPendingTreatment.value}');

        historyPending.sort((a, b) {
          return DateTime.parse(b.createdAt)
              .compareTo(DateTime.parse(a.createdAt));
        });
        print('after sort $historyPending');

        await Future.delayed(Duration(seconds: 1));
      } catch (e) {
        print("error hehehe $e");
      }
    });
    isLoading.value = false;
    return historyPending;
  }
}
