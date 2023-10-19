// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:intl/intl.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart'
    as PaymentMethod;

class OrderTreatmentController extends StateClass {
  RxString arrivalDate = ''.obs;
  RxString arrivalTimeFirst = ''.obs;
  RxString arrivalTimeLast = ''.obs;
  RxInt idPayment = 0.obs;
  RxString paymentMethod = ''.obs;
  RxString paymentType = ''.obs;
  RxString bankImage = ''.obs;
  RxList<PaymentMethod.Data> getPaymentMethod =
      List<PaymentMethod.Data>.empty().obs;

  RxString orderId = ''.obs;
  RxString bank = ''.obs;
  RxString expireTime = ''.obs;

  initPayment(BuildContext context) async {
    isLoading.value = true;
    getPaymentMethod.value.clear();
    await getPaymentmethod(context);
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    isLoading.value = false;
  }

  getPaymentmethod(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TransactionService().paymentMethod();
      getPaymentMethod.value = res.data!;
    });
  }

  clearVariabel() {
    arrivalDate.value = '';
    arrivalTimeFirst.value = '';
    arrivalTimeLast.value = '';
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    getPaymentMethod.value.clear();
    orderId.value = '';
    bank.value = '';
    expireTime.value = '';
  }

  orderTreatment(BuildContext context, int treatmentId, int pax,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      orderId.value = '';
      bank.value = '';
      expireTime.value = '';
      var reqOrder = {
        "schedule_date": arrivalDate.value,
        "schedule_time":
            "${arrivalTimeFirst.value.substring(0, 5)}-${arrivalTimeLast.value.substring(0, 5)}",
        "treatment_item": [
          {
            "treatment_id": treatmentId,
            "pax": pax,
          }
        ],
        "payment_method": paymentMethod.toString(),
        "payment_type": paymentType.toString()
      };
      print("req order $reqOrder");

      var res = await TransactionService().orderTreatment(reqOrder);
      print("req order ${jsonEncode(res)}");
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      print("req order ${jsonEncode(res)}");
      // JIKA SUKSES SET ORDER ID
      orderId.value = res.data!.transaction!.id.toString();
      // JIKA SUKSES SET bank
      bank.value = bank.value;
      // JIKA SUKSES SET expireTime
      expireTime.value = res.data!.payment!.expiryTime.toString();
      print('orderId ${orderId.value}');
      print('bank ${bank.value}');
      print('expireTime ${expireTime.value}');
      doInPost();
      clearVariabel();
    });
    isMinorLoading.value = false;
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(days: 1)),
        firstDate: DateTime.now().add(Duration(days: 1)),
        lastDate: DateTime(2100));

    if (picked != null) {
      arrivalDate.value = picked.toString().split(" ")[0];
    }

    print('arrivalDate ${arrivalDate.value}');
  }

  selectTime(BuildContext context, String cek) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      orientation: Orientation.portrait,
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
    );

    if (pickedTime != null) {
      print('haha ${pickedTime.format(context)}');
      DateTime parsedTime =
          DateFormat('HH:mm').parse(pickedTime.format(context));
      print('parsedTime $parsedTime');
      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      print('formattedTime $formattedTime');
      if (cek == '1') {
        arrivalTimeFirst.value = formattedTime;
      } else if (cek == '2') {
        arrivalTimeLast.value = formattedTime;
      }
    } else {
      print("Time is not selected");
    }
  }
}
