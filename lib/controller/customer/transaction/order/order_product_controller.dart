// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart'
    as PaymentMethod;

class OrderProductController extends StateClass {
  final CartController cart = Get.put(CartController());
  RxInt totalPaymentMethod = 0.obs;
  RxInt idPayment = 0.obs;
  RxString paymentMethod = ''.obs;
  RxString paymentType = ''.obs;
  RxString bankImage = ''.obs;
  RxList<PaymentMethod.Data> getPaymentMethod =
      List<PaymentMethod.Data>.empty().obs;
  RxString orderId = ''.obs;
  RxString bank = ''.obs;
  RxString expireTime = ''.obs;
  List listProductItem = [];
  RxInt totalAmount = 0.obs;

  initPayment(BuildContext context, List pesan) async {
    isLoading.value = true;
    listProductItem.clear();
    totalAmount.value = 0;

    print('pesan $pesan');
    print(pesan.length);
    listProductItem.addAll(pesan);
    print("===============");
    print('listProductItem $listProductItem');
    print(listProductItem.length);

    int sum = 0;
    for (var i = 0; i < listProductItem.length; i++) {
      sum += int.parse(listProductItem[i]['totalPrice'].toString());
    }
    totalAmount.value = sum;
    isLoading.value = false;
  }

  getPaymentmethod(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TransactionService().paymentMethod();
      getPaymentMethod.value = res.data!;
    });
    isLoading.value = false;
  }

  clearVariabel() {
    totalPaymentMethod.value = 0;
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    orderId.value = '';
    bank.value = '';
    expireTime.value = '';
    listProductItem.clear();
  }

  increment(int index) {
    print("increment $index");
    listProductItem[index]['qty'] += 1;
    listProductItem[index]['totalPrice'] =
        listProductItem[index]['price'] * listProductItem[index]['qty'];

    int sum = 0;
    for (var i = 0; i < listProductItem.length; i++) {
      sum += int.parse(listProductItem[i]['totalPrice'].toString());
    }
    totalAmount.value = sum;
  }

  decrement(int index) {
    print("decrement $index");
    listProductItem[index]['qty'] -= 1;
    listProductItem[index]['totalPrice'] =
        listProductItem[index]['price'] * listProductItem[index]['qty'];

    int sum = 0;
    for (var i = 0; i < listProductItem.length; i++) {
      sum += int.parse(listProductItem[i]['totalPrice'].toString());
    }
    totalAmount.value = sum;
  }

  orderProduct(BuildContext context, bool isCart,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      orderId.value = '';
      bank.value = '';
      expireTime.value = '';
      List productItem = [];
      List listIdProduct = [];
      print('listProductItem ${listProductItem.length}');
      for (int i = 0; i < listProductItem.length; i++) {
        productItem.add({
          "product_id": listProductItem[i]['product_id'],
          "qty": listProductItem[i]['qty'],
        });

        listIdProduct.add(listProductItem[i]['product_id']);
      }
      print('productItem ${productItem.length}');
      print('productItem $productItem');
      var reqOrder = {
        "product_item": productItem,
        "payment_method": paymentMethod.toString(),
        "payment_type": paymentType.toString()
      };
      print("req order $reqOrder");

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

      if (isCart) {
        print('dari keranjang');
        // hapus produk di keranjang, pake id produk
        await cart.deleteManyCart(context, listIdProduct);
      } else {
        print('bukan dari keranjang');
      }

      doInPost();
      clearVariabel();
    });
    isMinorLoading.value = false;
  }
}
