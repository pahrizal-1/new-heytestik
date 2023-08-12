// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart'
    as PaymentMethod;

class OrderTreatmentController extends StateClass {
  RxInt totalPaymentMethod = 0.obs;
  RxInt idPayment = 0.obs;
  RxString paymentMethod = ''.obs;
  RxString paymentType = ''.obs;
  Rx<PaymentMethod.PaymentMethodModel?> getPaymentMethod =
      PaymentMethod.PaymentMethodModel.fromJson({}).obs;
  RxString orderId = ''.obs;
  RxString bank = ''.obs;
  RxString expireTime = ''.obs;
  List productItem = [];

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
    totalPaymentMethod.value = 0;
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    getPaymentMethod.value = null;
    orderId.value = '';
    bank.value = '';
    expireTime.value = '';
    productItem.clear();
  }

  orderProduct(BuildContext context, int treatmentId, int pax,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      orderId.value = '';
      bank.value = '';
      expireTime.value = '';

      print("productItem $productItem");
      var reqOrder = {
        "product_item": productItem,
        "payment_method": paymentMethod.toString(),
        "payment_type": paymentType.toString()
      };
      print("req order $reqOrder");
      // return;
      var res = await TransactionService().orderProduct(reqOrder);
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
}
