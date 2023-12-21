// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/list_address_model.dart'
    as Address;
import 'package:heystetik_mobileapps/models/customer/shipping_method_model.dart'
    as Shipping;
import 'package:heystetik_mobileapps/service/customer/address/address_service.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart'
    as PaymentMethod;

class OrderProductController extends StateClass {
  final CartController cart = Get.put(CartController());

  RxList<PaymentMethod.Data> getPaymentMethod =
      List<PaymentMethod.Data>.empty().obs;
  RxInt idPayment = 0.obs;
  RxString paymentMethod = ''.obs;
  RxString paymentType = ''.obs;
  RxString bankImage = ''.obs;
  RxString bankName = ''.obs;

  RxList<Shipping.Data> getShippingMethod = List<Shipping.Data>.empty().obs;
  RxInt shippingId = 0.obs;
  RxString shippingName = ''.obs;
  RxString shippingDesc = ''.obs;
  RxInt shippingPrice = 0.obs;

  RxList<Address.Data> getAddress = List<Address.Data>.empty().obs;
  RxInt addressId = 0.obs;
  RxString recipientName = ''.obs;
  RxString recipientPhone = ''.obs;
  RxString address = ''.obs;
  RxString noteForCourier = ''.obs;

  RxString orderId = ''.obs;
  RxString expireTime = ''.obs;

  List listProductItem = [];
  RxInt totalAmountProduct = 0.obs;
  RxInt totalAmount = 0.obs;

  RxBool isLoadingShipping = false.obs;

  Future<void> initPayment(BuildContext context, List pesan) async {
    isLoading.value = true;

    //
    listProductItem.clear();
    totalAmountProduct.value = 0;
    totalAmount.value = 0;

    //
    addressId.value = 0;
    recipientName.value = '';
    recipientPhone.value = '';
    address.value = '';
    noteForCourier.value = '';

    //
    shippingId.value = 0;
    shippingName.value = '';
    shippingDesc.value = '';
    shippingPrice.value = 0;

    //
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    bankImage.value = '';
    bankName.value = '';

    print("PESAN ${pesan.length}");
    listProductItem.addAll(pesan);
    print("LIST ${listProductItem.length}");

    int sum = 0;
    for (var i = 0; i < listProductItem.length; i++) {
      sum += int.parse(listProductItem[i]['totalPrice'].toString());
    }
    totalAmountProduct.value = sum;
    isLoading.value = false;
  }

  Future<void> getPaymentmethod(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TransactionService().paymentMethod();
      getPaymentMethod.value = res.data!;
    });
  }

  Future<void> selectAddress(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await AddressService().listAddress();
      getAddress.value = res.data!;

      for (var i = 0; i < getAddress.value.length; i++) {
        if (addressId.value <= 0) {
          if (getAddress.value[i].mainAddress!) {
            debugPrint("ADA ALAMAT YG MAIN");

            addressId.value = getAddress.value[i].id!;
            recipientName.value = getAddress.value[i].recipientName ?? '-';
            recipientPhone.value = getAddress.value[i].recipientPhone ?? '-';
            address.value = getAddress.value[i].pinpointAddress ?? '-';
            noteForCourier.value = getAddress.value[i].noteForCourier ?? '-';
          } else {
            debugPrint("GA ADA ALAMAT YG MAIN");
          }
        } else {
          debugPrint("USER UDAH MILIH ALAMAT");
        }
      }
    });
  }

  Future<void> shippingMethod(
    BuildContext context, {
    required bool isOnTap,
    required int userAddressId,
    String? recipientN,
    String? recipientP,
    String? addr,
    String? noteForC,
  }) async {
    isLoadingShipping.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      Map data = {"user_address_id": userAddressId, "product_item": []};

      debugPrint("listProductItem $listProductItem");

      for (var i = 0; i < listProductItem.length; i++) {
        data['product_item'].add({
          'product_id': listProductItem[i]['productId'],
          'qty': listProductItem[i]['qty'],
        });
      }

      debugPrint("SHIPPING $data");

      var res = await TransactionService().shippingMethod(data);
      print("RES $res");
      if (res.success!) {
        getShippingMethod.value = res.data!;
        if (isOnTap) {
          addressId.value = userAddressId;
          recipientName.value = recipientN.toString();
          recipientPhone.value = recipientP.toString();
          address.value = addr.toString();
          noteForCourier.value = noteForC.toString();
          Get.back();
        }

        // clear value shipping jika ganti alamat
        shippingId.value = 0;
        shippingName.value = '';
        shippingDesc.value = '';
        shippingPrice.value = 0;
      }
    });
    isLoadingShipping.value = false;
  }

  clearVariabel() {
    getPaymentMethod.clear();
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    bankImage.value = '';
    bankName.value = '';

    getShippingMethod.clear();
    shippingId.value = 0;
    shippingName.value = '';
    shippingDesc.value = '';
    shippingPrice.value = 0;

    addressId.value = 0;
    recipientName.value = '';
    recipientPhone.value = '';
    address.value = '';
    noteForCourier.value = '';

    orderId.value = '';
    expireTime.value = '';

    listProductItem.clear();
    totalAmountProduct.value = 0;
    totalAmount.value = 0;
  }

  increment(int index) {
    debugPrint("increment $index");
    listProductItem[index]['qty'] += 1;
    listProductItem[index]['totalPrice'] =
        listProductItem[index]['price'] * listProductItem[index]['qty'];

    int sum = 0;
    for (var i = 0; i < listProductItem.length; i++) {
      sum += int.parse(listProductItem[i]['totalPrice'].toString());
    }
    totalAmountProduct.value = sum;

    totalAmountFunc();
  }

  decrement(int index) {
    debugPrint("decrement $index");
    listProductItem[index]['qty'] -= 1;
    listProductItem[index]['totalPrice'] =
        listProductItem[index]['price'] * listProductItem[index]['qty'];

    int sum = 0;
    for (var i = 0; i < listProductItem.length; i++) {
      sum += int.parse(listProductItem[i]['totalPrice'].toString());
    }
    totalAmountProduct.value = sum;

    totalAmountFunc();
  }

  totalAmountFunc() {
    totalAmount.value =
        totalAmountProduct.value + int.parse(shippingPrice.value.toString());
  }

  Future<void> orderProduct(BuildContext context, bool isCart,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (addressId.value <= 0) {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: 'Harap pilih alamat terlebih dahulu',
        );
      }
      if (shippingId.value <= 0) {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: 'Harap pilih pengiriman terlebih dahulu',
        );
      }
      if (paymentMethod.isEmpty && paymentType.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: 'Harap pilih metode pembayaran terlebih dahulu',
        );
      }

      orderId.value = '';
      expireTime.value = '';
      List productItem = [];
      List listIdProduct = [];

      for (int i = 0; i < listProductItem.length; i++) {
        productItem.add({
          "product_id": listProductItem[i]['productId'],
          "qty": listProductItem[i]['qty'],
        });

        listIdProduct.add(listProductItem[i]['productId']);
      }

      var reqOrder = {
        "product_item": productItem,
        "payment_method": paymentMethod.toString(),
        "payment_type": paymentType.toString(),
        "shipping_method_id": shippingId.value,
        "user_address_id": addressId.value,
        "total_product_price": totalAmountProduct.value,
        "delivery_fee": shippingPrice.value,
        "total_price": totalAmount.value
      };

      debugPrint("req order $reqOrder");
      // return;
      var res = await TransactionService().orderProduct(reqOrder);
      debugPrint("req order ${jsonEncode(res)}");
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      debugPrint("req order ${jsonEncode(res)}");
      // JIKA SUKSES SET ORDER ID
      orderId.value = res.data!.transaction!.id.toString();
      // JIKA SUKSES SET bank
      // bank.value = bank.value;
      // JIKA SUKSES SET expireTime
      expireTime.value = res.data!.payment!.expiryTime.toString();
      debugPrint('orderId ${orderId.value}');
      // debugPrint('bank ${bank.value}');
      debugPrint('expireTime ${expireTime.value}');

      if (isCart) {
        debugPrint('dari keranjang');
        // hapus produk di keranjang, pake id produk
        await cart.deleteManyCart(context, listIdProduct);
      } else {
        debugPrint('bukan dari keranjang');
      }

      doInPost();
      clearVariabel();
    });
    isMinorLoading.value = false;
  }
}
