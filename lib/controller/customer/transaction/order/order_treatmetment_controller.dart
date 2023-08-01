// ignore_for_file: use_build_context_synchronously

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
  RxInt totalPaymentMethod = 0.obs;
  RxInt idPayment = 0.obs;
  RxString paymentMethod = ''.obs;
  RxString paymentType = ''.obs;
  Rx<PaymentMethod.PaymentMethodModel?> getPaymentMethod =
      PaymentMethod.PaymentMethodModel.fromJson({}).obs;
  RxString orderId = ''.obs;
  RxString bank = ''.obs;
  RxString expireTime = ''.obs;

  initPayment(BuildContext context) async {
    isLoading.value = true;
    getPaymentMethod.value == null;
    await getPaymentmethod(context);
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    isLoading.value = false;
  }

  getPaymentmethod(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      getPaymentMethod.value = await TransactionService().paymentMethod();
      totalPaymentMethod.value = getPaymentMethod.value!.data!.length;
    });
  }

  clearVariabel() {
    arrivalDate.value = '';
    arrivalTimeFirst.value = '';
    arrivalTimeLast.value = '';
    totalPaymentMethod.value = 0;
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    getPaymentMethod.value = null;
    orderId.value = '';
    bank.value = '';
    expireTime.value = '';
  }

  orderTreatment(BuildContext context, int treatmentId, int pax,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // try {
      orderId.value = '';
      bank.value = '';
      expireTime.value = '';
      var reqOrder = {
        "schedule_date": arrivalDate.value,
        "schedule_time": "${arrivalTimeFirst.value}-${arrivalTimeLast.value}",
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
      // return;
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
      doInPost();
      clearVariabel();
      // } catch (e) {
      //   print("heheh $e");
      // }
    });
    isMinorLoading.value = false;
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));

    if (picked != null) {
      arrivalDate.value = picked.toString().split(" ")[0];
    }

    print('arrivalDate ${arrivalDate.value}');
  }

  selectTime(BuildContext context, String cek) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print('hahah ${pickedTime.format(context)}');
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
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
