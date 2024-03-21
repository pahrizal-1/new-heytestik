// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'dart:convert';
import 'dart:io';

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
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

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
  RxBool isOngkir = false.obs;

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
    clearAddress();
    clearShipping();
    clearPaymentMethod();
    defaultVoucher();
  }

  void voucher(Available.Data2 voucher) {
    voucherName.value = voucher.name ?? "";
    voucherId.value = voucher.id!;
    // shippingPrice SET LAGI JADI HARGA ASLI
    shippingPrice.value = shippingPriceSet.value;
    // SET FALSE
    isOngkir.value = false;
    // SET 0
    discountPercentage.value = 0;
    if (voucher.promotionType == "Discount") {
      if (voucher.discountType == "Fix Amount") {
        print("Fix Amount ${voucher.discountFixAmount!}");
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
        print("totalDiscount ${totalDiscount.value}");
        // KALO discount_percentage_maximum_amount TIDAK NULL
        if (voucher.discountPercentageMaximumAmount != null) {
          // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
          print("MaximumAmount ${voucher.discountPercentageMaximumAmount}");
          if (totalDiscount.value >
              (voucher.discountPercentageMaximumAmount ?? 0.0)) {
            print("TOTAL DISKON = discount_percentage_maximum_amount");
            // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
            totalDiscount.value =
                (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
            print("TOTAL DISKON ${totalDiscount.value}");
            // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
            discountPercentage.value = ((totalDiscount.value /
                        (totalPrice.value + shippingPrice.value)) *
                    100)
                .toInt();
            print("TOTAL DISKON ${totalDiscount.value}");
          }
        }
        // TOTAL FEE DIKURANG TOTAL DISKON
        totalPaid.value =
            (totalPrice.value + shippingPrice.value) - totalDiscount.value;
      } else {
        if (voucher.discountFixAmount != null) {
          print("Else Fix Amount ${voucher.discountFixAmount!}");
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
          print("totalDiscount ${totalDiscount.value}");
          // KALO discount_percentage_maximum_amount TIDAK NULL
          if (voucher.discountPercentageMaximumAmount != null) {
            // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
            print("MaximumAmount ${voucher.discountPercentageMaximumAmount}");
            if (totalDiscount.value >
                (voucher.discountPercentageMaximumAmount ?? 0.0)) {
              print("TOTAL DISKON = discount_percentage_maximum_amount");
              // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
              totalDiscount.value =
                  (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
              print("TOTAL DISKON ${totalDiscount.value}");
              // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
              discountPercentage.value = ((totalDiscount.value /
                          (totalPrice.value + shippingPrice.value)) *
                      100)
                  .toInt();
              print("TOTAL DISKON ${totalDiscount.value}");
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
          shippingPrice.value = shippingPriceSet.value - totalDiscount.value;

          // RUBAH PERSENTASE DISKON ONGKIR SESUAI freeShippingAmount
          discountPercentage.value =
              ((totalDiscount.value / shippingPriceSet.value) * 100).toInt();

          // RUBAH JADI TRUE
          isOngkir.value = true;

          // TOTAL FEE DIKURANG TOTAL freeShippingAmount
          totalPaid.value = totalPrice.value + shippingPrice.value;
        }
      } else {}
    }
    // UNTUK NYIMPAN totalPaidSet HASIL KALKULASI TANPA transactionFee DAN shippingPrice
    totalPaidSet.value = totalPaid.value;
    // SET NOL LAGI idPayment
    clearPaymentMethod();
    orderId.value = '';
    transactionFee.value = 0;
  }

  void shipping(Shipping.Data kurir) {
    defaultVoucher();
    clearPaymentMethod();
    print("SHIPPING");
    shippingId.value = kurir.id!;
    shippingName.value = kurir.name!;
    shippingDesc.value = kurir.description!;
    shippingPrice.value = kurir.price!.toDouble();
    shippingPriceSet.value = kurir.price!.toDouble();
    totalPaid.value = (totalPaidSet.value + shippingPrice.value);
    // UNTUK NYIMPAN totalPaidSet HASIL KALKULASI TANPA transactionFee
    totalPaidSet.value = totalPaid.value;
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
        shippingPrice.value = 0.0;
      }
    });
    isLoadingShipping.value = false;
  }

  void defaultVoucher() {
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

  void clearPaymentMethod() {
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    bankImage.value = '';
    bankName.value = '';
  }

  void clearShipping() {
    shippingId.value = 0;
    shippingName.value = '';
    shippingDesc.value = '';
    shippingPrice.value = 0.0;
    shippingPriceSet.value = 0.0;
    isOngkir.value = false;
  }

  void clearAddress() {
    addressId.value = 0;
    recipientName.value = '';
    recipientPhone.value = '';
    address.value = '';
    noteForCourier.value = '';
  }

  clearVariabel() {
    getPaymentMethod.clear();
    clearPaymentMethod();

    getShippingMethod.clear();
    clearShipping();

    clearAddress();

    orderId.value = '';
    expireTime.value = '';

    listProductItem.clear();
    totalAmountProduct.value = 0;
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
  }

  Future<void> getInvoice(
      BuildContext context, String transactionID, String invoiceType,
      {required Function() doInPost}) async {
    try {
      isMinorLoading.value = true;
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        try {
          print("INI GIMANA SIH");
          var res =
              await TransactionService().getInvoice(invoiceType, transactionID);
          print("INI SAMPE MANA INI");
          var tempDir = await getTemporaryDirectory();
          final fileName = '/invoice-$transactionID.pdf';
          print("INI SAMPE SINI");
          var file =
              File(tempDir.path + fileName).openSync(mode: FileMode.write);
          print(res.runtimeType);
          file.writeFromSync(res);
          print("INI SAMPE SINI");
          await file.close();
          print(fileName);
          OpenFile.open(tempDir.path + fileName);
        } catch (error) {
          print(error);
        }
      });
      isMinorLoading.value = false;
    } catch (error) {
      print(error);
    }
  }

  Future<void> orderProduct(BuildContext context, bool isCart,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (addressId.value <= 0) {
        showDialog(
          context: context,
          builder: (context) => AlertWidget(
            subtitle: "Harap pilih alamat terlebih dahulu",
          ),
        );
        return;
      }
      if (shippingId.value <= 0) {
        showDialog(
          context: context,
          builder: (context) => AlertWidget(
            subtitle: "Harap pilih pengiriman terlebih dahulu",
          ),
        );
        return;
      }
      if (paymentMethod.isEmpty && paymentType.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertWidget(
            subtitle: 'Harap pilih metode pembayaran terlebih dahulu',
          ),
        );
        return;
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
        "voucher_id": voucherId.value <= 0 ? null : voucherId.value,
        "total_price": totalPrice.value.round(),
        "delivery_fee": shippingPrice.value.round(),
        "total_discount": totalDiscount.value.round(),
        "tax": tax.value.round(),
        "transaction_fee": transactionFee.value.round(),
        "total_paid": totalPaid.value.round(),
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
