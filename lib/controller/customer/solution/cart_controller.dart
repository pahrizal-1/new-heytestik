// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/cart_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/cart_service.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class CartController extends StateClass {
  Rx<CartModel?> cart = CartModel.fromJson({}).obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;

  getCart(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      cart.value = await CartService().getCart();
      filterData.value = cart.value!.data!.data!;
    });
    isLoading.value = false;
  }

  addCart(BuildContext context, int productId, int qty, String notes) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'product_id': productId,
        'qty': qty,
        'notes': notes,
      };
      print('data $data');
      var res = await CartService().addCart(data);

      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      SnackbarWidget.getSuccessSnackbar(
          context, 'Info', 'Produk ditambahkan ke keranjang');
    });
    isLoading.value = false;
  }

  deleteCart(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await CartService().deleteCart(id);
      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      Get.back();
      Get.back();
      SnackbarWidget.getSuccessSnackbar(
          context, 'Info', 'Produk berhasil dihapus');
    });
    isLoading.value = false;
  }

  deleteManyCart(BuildContext context, List data) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data1 = {'ids': data};
      var res = await CartService().deleteManyCart(data1);
      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      Get.back();
      Get.back();

      SnackbarWidget.getSuccessSnackbar(
          context, 'Info', 'Produk berhasil dihapus');
    });
    isLoading.value = false;
  }
}
