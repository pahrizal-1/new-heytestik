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
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart'
    as Available;

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
  RxString expireTime = ''.obs;

  RxInt voucherId = 0.obs;
  RxString voucherName = "".obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt discountPercentage = 0.obs;
  RxDouble totalDiscount = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble transactionFee = 0.0.obs;
  RxDouble totalPaid = 0.0.obs;
  RxDouble totalPaidSet = 0.0.obs;

  initPayment(BuildContext context) async {
    isLoading.value = true;
    getPaymentMethod.value.clear();
    await getPaymentmethod(context);
    clearPaymentMethod();
    defaultVoucher();
    isLoading.value = false;
  }

  void defaultVoucher() {
    voucherId.value = 0;
    voucherName.value = '';
    discountPercentage.value = 0;
    tax.value = 0;
    totalPaidSet.value = totalPrice.value;
    totalPaid.value = totalPrice.value;
    transactionFee.value = 0;
    totalDiscount.value = 0;
  }

  void clearPaymentMethod() {
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    bankImage.value = '';
  }

  void freeVoucher() {}

  void voucher(Available.Data2 voucher) {
    voucherName.value = voucher.name ?? "";
    voucherId.value = voucher.id!;
    if (voucher.promotionType == "Discount") {
      if (voucher.discountType == "Fix Amount") {
        print("Fix Amount ${voucher.discountFixAmount!}");
        discountPercentage.value = 0;
        // TOTAL DISKON = discountFixAmount
        totalDiscount.value = voucher.discountFixAmount!.toDouble();
        // LANGSUNG DIKURANG SAJA
        totalPaid.value = totalPrice.value - totalDiscount.value;
      } else if (voucher.discountType == "Percentage") {
        print("Percentage ${voucher.discountPercentage!}");
        // PERSENTASE DISKON
        discountPercentage.value = voucher.discountPercentage!;
        // BERAPA TOTAL DISKONNYA
        totalDiscount.value =
            totalPrice.value * (voucher.discountPercentage! / 100);
        // KALO discount_percentage_maximum_amount TIDAK NULL
        if (voucher.discountPercentageMaximumAmount != null) {
          // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
          if (totalDiscount.value >
              (voucher.discountPercentageMaximumAmount ?? 0.0)) {
            // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
            totalDiscount.value =
                (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
            // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
            discountPercentage.value =
                ((totalDiscount.value / totalPrice.value) * 100).toInt();
          }
        }
        // TOTAL FEE DIKURANG TOTAL DISKON
        totalPaid.value = totalPrice.value - totalDiscount.value;
      } else {
        if (voucher.discountFixAmount != null) {
          print("Else Fix Amount ${voucher.discountFixAmount!}");
          discountPercentage.value = 0;
          // TOTAL DISKON = discountFixAmount
          totalDiscount.value = voucher.discountFixAmount!.toDouble();
          // LANGSUNG DIKURANG SAJA
          totalPaid.value = totalPrice.value - totalDiscount.value;
        } else if (voucher.discountPercentage != null) {
          print("Else Percentage ${voucher.discountPercentage!}");
          // PERSENTASE DISKON
          discountPercentage.value = voucher.discountPercentage!;
          // BERAPA TOTAL DISKONNYA
          totalDiscount.value =
              totalPrice.value * (voucher.discountPercentage! / 100);
          // KALO discount_percentage_maximum_amount TIDAK NULL
          if (voucher.discountPercentageMaximumAmount != null) {
            // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
            if (totalDiscount.value >
                (voucher.discountPercentageMaximumAmount ?? 0)) {
              // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
              totalDiscount.value =
                  (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
              // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
              discountPercentage.value =
                  ((totalDiscount.value / totalPrice.value) * 100).toInt();
            }
          }
          // TOTAL FEE DIKURANG TOTAL DISKON
          totalPaid.value = totalPrice.value - totalDiscount.value;
        } else {}
      }
      // UNTUK NYIMPAN totalPaidSet HASIL KALKULASI TANPA transactionFee
      totalPaidSet.value = totalPaid.value;
      // SET NOL LAGI idPayment
      clearPaymentMethod();
      orderId.value = '';
      transactionFee.value = 0;
    }
  }

  void transactionFeeFunct(PaymentMethod.Data fee) {
    double paid = totalPaidSet.value;
    double transactionFeeFixAmount = 0.0;
    double transactionFeePercentage = 0.0;
    if (paid <= 0) {
      print("NOLLLLLL");
      // KALO TOTAL PAIDNYA KURANG DARI 0.0, MAKA transactionFee juga 0
      transactionFee.value = 0;
      paid = 0;
    } else {
      if (fee.transactionFeeType == "PERCENTAGE_FIX_AMOUNT") {
        transactionFeePercentage = paid * (fee.transactionFeePercentage! / 100);
        print("PERCENTAGE_FIX_AMOUNT $transactionFeePercentage");
        transactionFeeFixAmount = fee.transactionFeeFixAmount!.toDouble();
        print("PERCENTAGE_FIX_AMOUNT $transactionFeeFixAmount");
        transactionFee.value =
            transactionFeePercentage + transactionFeeFixAmount;
        print("PERCENTAGE_FIX_AMOUNT $transactionFee");
        paid = paid + transactionFee.value;
        print("PERCENTAGE_FIX_AMOUNT $paid");
      } else if (fee.transactionFeeType == "FIX_AMOUNT") {
        print("FIX AMOUNT ${fee.transactionFeeFixAmount!.toDouble()}");
        transactionFeeFixAmount = fee.transactionFeeFixAmount!.toDouble();
        print("FIX_AMOUNT $transactionFeeFixAmount");
        transactionFee.value = transactionFeeFixAmount;
        paid = paid + transactionFee.value;
      } else if (fee.transactionFeeType == "PERCENTAGE") {
        print("PERCENTAGE ${fee.transactionFeePercentage}");
        print("PERCENTAGE ${(fee.transactionFeePercentage! / 100)}");
        transactionFeePercentage = paid * (fee.transactionFeePercentage! / 100);
        print("PERCENTAGE $transactionFeePercentage");
        transactionFee.value = transactionFeePercentage;
        paid = paid + transactionFee.value;
      } else {
        print("ELSE");
      }
    }
    totalPaid.value = paid;
    print("HASIL ${totalPaid.value}");
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
    clearPaymentMethod();
    defaultVoucher();
    getPaymentMethod.value.clear();
    orderId.value = '';
    expireTime.value = '';
  }

  orderTreatment(BuildContext context, int treatmentId, int pax,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      orderId.value = '';
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
        "payment_type": paymentType.toString(),
        "voucher_id": voucherId.value <= 0 ? null : voucherId.value,
        "total_price": totalPrice.value.round(),
        "total_discount": totalDiscount.value.round(),
        "tax": tax.value.round(),
        "transaction_fee": transactionFee.value.round(),
        "total_paid": totalPaid.value.round()
      };
      print("req order $reqOrder");

      var res = await TransactionService().orderTreatment(reqOrder);
      print("res order ${jsonEncode(res)}");
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }

      // JIKA SUKSES SET ORDER ID
      orderId.value = res.data!.transaction!.id.toString();
      if (paymentType.value != "FREE_VOUCHER") {
        // JIKA SUKSES DAN BUKAN FREE_VOUCHER  SET expireTime
        expireTime.value = res.data!.payment!.expiryTime.toString();
      }

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
