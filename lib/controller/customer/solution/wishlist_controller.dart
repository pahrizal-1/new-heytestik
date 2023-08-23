// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/wishlist_service.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class WishlistController extends StateClass {
  TextEditingController searchController = TextEditingController();
  Rx<WishlistModel?> wishlist = WishlistModel.fromJson({}).obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;

  Future<List<Data2>> getWistlist(BuildContext context, int page, {String? search}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      wishlist.value = await WishlistService().getWishlist(page, search: search);
      filterData.value = wishlist.value!.data!.data!;
      print(filterData);
    });
    isLoading.value = false;
    return filterData.value;
  }

  // onChangeFilterText(String value) {
  //   filterData.value = wishlist.value!.data!.data!
  //       .where((element) =>
  //           element.product!.name!.toLowerCase().contains(value.toLowerCase()))
  //       .toList();
  // }

  addWishlist(BuildContext context, int productId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {'product_id': productId};
      print('data $data');
      var res = await WishlistService().addWishlist(data);

      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      SnackbarWidget.getSuccessSnackbar(context, 'Info', 'Produk berhasil ditambahkan ke daftar wishlist');
    });
    isLoading.value = false;
  }

  deleteWistlist(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await WishlistService().deleteWishlist(id);
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
