// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/treatment_review_model.dart'
    as TreatmentReview;
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

class UlasanTreatmentController extends StateClass {
  RxList<TreatmentReview.Data2> treatmentReview =
      List<TreatmentReview.Data2>.empty().obs;

  Future<Map<String, dynamic>> getTreatmentOverview(
      BuildContext context, int treatmentID) async {
    isLoading.value = true;
    Map<String, dynamic> data = {};
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data = await TreatmentService().getOverview(treatmentID);
    });
    isLoading.value = false;
    return data;
  }

  Future<List<TreatmentReview.Data2>> getTreatmentReview(
    BuildContext context,
    int page,
    int take,
    int id, {
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService()
          .getTreatmentReview(page, take, id, filter: filter);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      treatmentReview.value = res.data!.data!;
    });
    isLoading.value = false;
    return treatmentReview.value;
  }

  void helped(BuildContext context, int reviewId) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().helped(reviewId);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
    });
  }

  void unHelped(BuildContext context, int reviewId) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().unHelped(reviewId);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
    });
  }
}
