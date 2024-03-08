// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/treatment_review_model.dart'
    as TreatmentReview;
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';
import 'package:heystetik_mobileapps/models/customer/overview_treatment_model.dart'
    as Overview;

class UlasanTreatmentController extends StateClass {
  Future<Overview.Data?> getTreatmentOverview(
      BuildContext context, int treatmentID) async {
    Overview.Data? productOverview;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().getOverview(treatmentID);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      productOverview = res.data;
    });
    return productOverview;
  }

  Future<List<TreatmentReview.Data2>> getTreatmentReview(
    BuildContext context,
    int page,
    int take,
    int id, {
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    List<TreatmentReview.Data2> treatmentReview = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService()
          .getTreatmentReview(page, take, id, filter: filter);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      treatmentReview = res.data!.data!;
    });
    isLoading.value = false;
    return treatmentReview;
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
