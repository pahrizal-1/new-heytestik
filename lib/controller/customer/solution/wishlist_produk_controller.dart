// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_produk_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/wishlist_produk_service.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class WishlistProdukController extends StateClass {
  TextEditingController searchController = TextEditingController();
  Rx<WishlistProdukModel?> wishlist = WishlistProdukModel.fromJson({}).obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;

  Future<List<Data2>> getWistlist(BuildContext context, int page,
      {String? search}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      wishlist.value =
          await WishlistProdukService().getWishlist(page, search: search);
      filterData.value = wishlist.value!.data!.data!;
    });
    isLoading.value = false;
    return filterData.value;
  }

  addWishlist(BuildContext context, int productId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {'product_id': productId};
      print('data $data');
      var res = await WishlistProdukService().addWishlist(data);

      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      showDialog(
        context: context,
        builder: (context) => AlertSuccessWishlist(),
      );
    });
    isLoading.value = false;
  }

  deleteWistlist(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await WishlistProdukService().deleteWishlist(id);
      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      SnackbarWidget.getSuccessSnackbar(
        context,
        'Info',
        'Produk berhasil dihapus dari Wishlist',
      );
    });
    isLoading.value = false;
  }
}
