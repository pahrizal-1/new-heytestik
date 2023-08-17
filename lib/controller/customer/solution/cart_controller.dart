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
  List checkedList = [];
  List checklist = [];
  RxInt totalAmountSelected = 0.obs;
  RxInt totalAmount = 0.obs;
  RxBool isAllSelected = false.obs;

  Future<List<Data2>> getCart(BuildContext context, int page,
      {String? search}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // clear
      isAllSelected.value = false;
      totalAmountSelected.value = 0;
      totalAmount.value = 0;
      checklist.clear();
      checkedList.clear();

      cart.value = await CartService().getCart(
        page,
        search: search,
      );
      filterData.value = cart.value!.data!.data!;
      print("filter ${filterData.length}");
      for (int i = 0; i < filterData.length; i++) {
        checklist.add({
          "product_id": filterData[i].id,
          "productName": filterData[i].product?.name ?? '-',
          "img": filterData[i].product!.mediaProducts?[0].media?.path,
          "qty": filterData[i].qty,
          "notes": filterData[i].notes ?? '-',
          "isSelected": false,
          "price": filterData[i].product!.price,
          "totalPrice": filterData[i].product!.price! * filterData[i].qty!,
        });
      }

      print("checklist ${checklist.length}");
    });
    isLoading.value = false;
    return filterData;
  }

  onChecklist(int number, bool isAll) async {
    print("number $number");
    if (isAll) {
      print("semua");
      isAllSelected.value = !isAllSelected.value;
      if (isAllSelected.value) {
        checkedList.clear();
        for (var i = 0; i < number; i++) {
          checklist[i]['isSelected'] = true;
          checkedList.add(checklist[i]);
        }
      } else {
        for (var i = 0; i < number; i++) {
          checklist[i]['isSelected'] = false;
          checkedList.clear();
        }
      }
    } else {
      print("salah satu");
      if (checklist[number]['isSelected']) {
        checklist[number]['isSelected'] = false;
        checkedList.removeWhere(
            (item) => item?['product_id'] == checklist[number]['product_id']);
      } else {
        checklist[number]['isSelected'] = true;
        checkedList.add(checklist[number]);
      }
    }

    print("checkedList total ${checkedList.length}");
    int sum = 0;
    int sumD = 0;
    for (var i = 0; i < checklist.length; i++) {
      sum += int.parse(checklist[i]['totalPrice'].toString());
      if (checklist[i]['isSelected']) {
        sumD += int.parse(checklist[i]['totalPrice'].toString());
      }
    }

    totalAmountSelected.value = sumD;
    totalAmount.value = sum;

    if (totalAmountSelected.value < totalAmount.value) {
      isAllSelected.value = false;
    }

    if (totalAmountSelected.value == totalAmount.value) {
      isAllSelected.value = true;
    }
  }

  increment(int index) {
    checklist[index]['qty'] += 1;
    checklist[index]['totalPrice'] =
        checklist[index]['price'] * checklist[index]['qty'];
    int sum = 0;
    for (var i = 0; i < checklist.length; i++) {
      if (checklist[i]['isSelected']) {
        sum += int.parse(checklist[i]['totalPrice'].toString());
      }
    }

    totalAmountSelected.value = sum;
  }

  decrement(int index) {
    checklist[index]['qty'] -= 1;
    checklist[index]['totalPrice'] =
        checklist[index]['price'] * checklist[index]['qty'];
    int sum = 0;
    for (var i = 0; i < checklist.length; i++) {
      if (checklist[i]['isSelected']) {
        sum += int.parse(checklist[i]['totalPrice'].toString());
      }
    }

    totalAmountSelected.value = sum;
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
      Get.back();
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
    });
    isLoading.value = false;
  }
}
