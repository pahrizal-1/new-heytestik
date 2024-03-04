// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_treatment_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/wishlist_treatment_service.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class WishlistTreatmentController extends StateClass {
  TextEditingController searchController = TextEditingController();
  Rx<WishlistTreatmentModel?> wishlist =
      WishlistTreatmentModel.fromJson({}).obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;

  Future<List<Data2>> getWistlist(BuildContext context, int page,
      {String? search}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      wishlist.value =
          await WishlistTreatmentService().getWishlist(page, search: search);
      filterData.value = wishlist.value!.data!.data!;
    });
    isLoading.value = false;
    return filterData.value;
  }

  addWishlist(BuildContext context, int treatmentId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {'treatment_id': treatmentId};
      print('data $data');
      var res = await WishlistTreatmentService().addWishlist(data);

      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      showDialog(
        context: context,
        builder: (context) => AlertSuccessWishlist(isTreatment: true),
      );
    });
    isLoading.value = false;
  }

  deleteWistlist(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await WishlistTreatmentService().deleteWishlist(id);
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
        'Treatment berhasil dihapus dari Wishlist',
      );
    });
    isLoading.value = false;
  }
}
