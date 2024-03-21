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
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart'
    as Available;

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
  RxDouble shippingPriceSet = 0.0.obs;
  RxDouble shippingPrice = 0.0.obs;

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

  RxInt voucherId = 0.obs;
  RxInt discountPercentage = 0.obs;
  RxDouble totalPaidSet = 0.0.obs;
  RxDouble totalPaid = 0.0.obs;
  RxDouble transactionFee = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble totalDiscount = 0.0.obs;
  RxDouble totalPrice = 45000.0.obs;
  RxString voucherName = "".obs;

  Future<void> initPayment(BuildContext context, List pesan) async {
    isLoading.value = true;

    //
    listProductItem.clear();
    totalAmountProduct.value = 0;
    totalAmount.value = 0;

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

  void initCheckout() {
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
    shippingPrice.value = 0.0;
    shippingPriceSet.value = 0.0;

    //
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    bankImage.value = '';
    bankName.value = '';

    //
    totalPrice.value = totalAmountProduct.value.toDouble();
    voucherId.value = 0;
    voucherName.value = '';
    discountPercentage.value = 0;
    transactionFee.value = 0;
    tax.value = 0;
    totalPaidSet.value = totalPrice.value;
    totalPaid.value = totalPrice.value;
    transactionFee.value = 0;
    totalDiscount.value = 0;
  }

  Future<void> getPaymentmethod(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TransactionService().paymentMethod();
      getPaymentMethod.value = res.data!;
    });
  }

  void voucher(Available.Data2 voucher) {
    voucherName.value = voucher.name ?? "";
    voucherId.value = voucher.id!;
    if (voucher.promotionType == "Discount") {
      // shippingPrice SET LAGI JADI HARGA ASLI
      shippingPrice.value = shippingPriceSet.value;
      if (voucher.discountType == "Fix Amount") {
        print("Fix Amount ${voucher.discountFixAmount!}");
        discountPercentage.value = 0;
        // TOTAL DISKON = discountFixAmount
        totalDiscount.value = voucher.discountFixAmount!.toDouble();
        // LANGSUNG DIKURANG SAJA
        totalPaid.value =
            (totalPrice.value + shippingPrice.value) - totalDiscount.value;
      } else if (voucher.discountType == "Percentage") {
        print("Percentage ${voucher.discountPercentage!}");
        // PERSENTASE DISKON
        discountPercentage.value = voucher.discountPercentage!;
        // BERAPA TOTAL DISKONNYA
        totalDiscount.value = (totalPrice.value + shippingPrice.value) *
            (voucher.discountPercentage! / 100);
        // KALO discount_percentage_maximum_amount TIDAK NULL
        if (voucher.discountPercentageMaximumAmount != null) {
          // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
          if (totalDiscount.value >
              (voucher.discountPercentageMaximumAmount ?? 0.0)) {
            // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
            totalDiscount.value =
                (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
            // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
            discountPercentage.value = ((totalDiscount.value /
                        (totalPrice.value + shippingPrice.value)) *
                    100)
                .toInt();
          }
        }
        // TOTAL FEE DIKURANG TOTAL DISKON
        totalPaid.value =
            (totalPrice.value + shippingPrice.value) - totalDiscount.value;
      } else {
        if (voucher.discountFixAmount != null) {
          print("Else Fix Amount ${voucher.discountFixAmount!}");
          discountPercentage.value = 0;
          // TOTAL DISKON = discountFixAmount
          totalDiscount.value = voucher.discountFixAmount!.toDouble();
          // LANGSUNG DIKURANG SAJA
          totalPaid.value =
              (totalPrice.value + shippingPrice.value) - totalDiscount.value;
        } else if (voucher.discountPercentage != null) {
          print("Else Percentage ${voucher.discountPercentage!}");
          // PERSENTASE DISKON
          discountPercentage.value = voucher.discountPercentage!;
          // BERAPA TOTAL DISKONNYA
          totalDiscount.value = (totalPrice.value + shippingPrice.value) *
              (voucher.discountPercentage! / 100);
          // KALO discount_percentage_maximum_amount TIDAK NULL
          if (voucher.discountPercentageMaximumAmount != null) {
            // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
            if (totalDiscount.value >
                (voucher.discountPercentageMaximumAmount ?? 0.0)) {
              // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
              totalDiscount.value =
                  (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
              // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
              discountPercentage.value = ((totalDiscount.value /
                          (totalPrice.value + shippingPrice.value)) *
                      100)
                  .toInt();
            }
          }
          // TOTAL FEE DIKURANG TOTAL DISKON
          totalPaid.value =
              (totalPrice.value + shippingPrice.value) - totalDiscount.value;
        } else {}
      }
    } else if (voucher.promotionType == "Free Shipping") {
      if (voucher.freeShippingAmount != null) {
        print("Free Shipping ${voucher.freeShippingAmount!}");
        discountPercentage.value = 0;
        // TOTAL DISKON = freeShippingAmount
        totalDiscount.value = voucher.freeShippingAmount!.toDouble();
        // JIKA KURANG MAKA KASIH 0 shippingPrice
        if (shippingPriceSet.value < totalDiscount.value) {
          totalDiscount.value = shippingPriceSet.value;
          shippingPrice.value = 0.0;
        } else {
          // LANGSUNG DIKURANG SAJA
          shippingPrice.value = shippingPrice.value - totalDiscount.value;
          // TOTAL FEE DIKURANG TOTAL freeShippingAmount
          totalPaid.value = totalPrice.value + shippingPrice.value;
        }
      } else {}
    }
    // UNTUK NYIMPAN totalPaidSet HASIL KALKULASI TANPA transactionFee
    totalPaidSet.value = totalPaid.value;
    // SET NOL LAGI idPayment
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    bankImage.value = '';
    bankName.value = '';
    orderId.value = '';
    transactionFee.value = 0;
  }

  // CEK LAGI INI
  void shipping() {
    totalPaid.value = totalPrice.value + shippingPrice.value;
    // UNTUK NYIMPAN totalPaidSet HASIL KALKULASI TANPA transactionFee
    totalPaidSet.value = totalPaid.value;
  }

  void transactionFeeFunct(PaymentMethod.Data fee) {
    double paid = totalPaidSet.value;
    double transactionFeeFixAmount = 0.0;
    double transactionFeePercentage = 0.0;
    if (paid <= 0) {
      // KALO TOTAL PAIDNYA KURANG DARI 0.0, MAKA transactionFee juga 0
      transactionFee.value = 0;
      paid = 0;
      print("NOLLLLLL");
    } else {
      if (fee.transactionFeeType == "PERCENTAGE_FIX_AMOUNT") {
        transactionFeePercentage = paid * (fee.transactionFeePercentage! / 100);
        print("PER $transactionFeePercentage");
        transactionFeeFixAmount = fee.transactionFeeFixAmount!.toDouble();
        print("PER $transactionFeeFixAmount");
        transactionFee.value =
            transactionFeePercentage + transactionFeeFixAmount;
        print("PER $transactionFee");
        paid = paid + transactionFee.value;
        print("paid $paid");
      } else if (fee.transactionFeeType == "FIX_AMOUNT") {
        print("FIX AMOUNT ${fee.transactionFeeFixAmount!.toDouble()}");
        transactionFeeFixAmount = fee.transactionFeeFixAmount!.toDouble();
        print("FIX_AMOUNT $transactionFeeFixAmount");
        transactionFee.value = transactionFeeFixAmount;
        paid = paid + transactionFee.value;
      } else if (fee.transactionFeeType == "PERCENTAGE") {
        print("PERCENT1 ${fee.transactionFeePercentage}");
        print("PERCENT2 ${(fee.transactionFeePercentage! / 100)}");
        transactionFeePercentage = paid * (fee.transactionFeePercentage! / 100);
        print("PERCENTAGE $transactionFeePercentage");
        transactionFee.value = transactionFeePercentage;
        paid = paid + transactionFee.value;
      } else {
        print("ELSE");
      }
    }

    totalPaid.value = paid;
    print("PER ${totalPaid.value}");
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
        shippingPrice.value = 0.0;
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
    shippingPrice.value = 0.0;

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
    totalAmount.value = totalAmountProduct.value + shippingPrice.value.toInt();
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
          "note": listProductItem[i]['notes'],
        });

        // kalo dari keranjang masuk kesini
        if (isCart) {
          listIdProduct.add(listProductItem[i]['cartId']);
        }
      }

      var reqOrder = {
        "product_item": productItem,
        "payment_method": paymentMethod.toString(),
        "payment_type": paymentType.toString(),
        "shipping_method_id": shippingId.value,
        "user_address_id": addressId.value,
        "delivery_fee": shippingPrice.value,
        "total_price": totalPrice.value,
        "voucher_id": voucherId.value <= 0 ? null : voucherId.value,
        "total_discount": totalDiscount.value,
        "tax": tax.value,
        "transaction_fee": transactionFee.value,
        "total_paid": totalPaid.value
      };

      debugPrint("req order $reqOrder");

      var res = await TransactionService().orderProduct(reqOrder);
      debugPrint("res order ${jsonEncode(res)}");
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
      debugPrint('order CONT  ${orderId.value}');
      // debugPrint('bank ${bank.value}');
      debugPrint('expireTime CONT ${expireTime.value}');

      if (isCart) {
        // jika dari keranjang, hapus produk di keranjang, pake id produk
        await cart.deleteManyCart(context, listIdProduct);
      }

      doInPost();
      clearVariabel();
    });
    isMinorLoading.value = false;
  }
}
