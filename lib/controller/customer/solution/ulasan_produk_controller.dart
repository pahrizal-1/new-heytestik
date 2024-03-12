// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart'
    as Overview;
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';

class UlasanProdukController extends StateClass {
  Future<Overview.Data?> getOverviewProduct(
      BuildContext context, int id) async {
    Overview.Data? productOverview;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getOverviewProduct(id);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      productOverview = res.data!;
    });
    return productOverview;
  }

  Future<List<ProductReviewModel.Data2>> getReviewProduct(
    BuildContext context,
    int page,
    int take,
    int id, {
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    List<ProductReviewModel.Data2> productReview = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService()
          .getReviewProduct(page, take, id, filter: filter);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      productReview = res.data!.data!;
    });
    isLoading.value = false;
    return productReview;
  }

  void helped(BuildContext context, int reviewId) async {
    try {
      SolutionService().helped(reviewId);
    } catch (e) {
      print("ERROR helped produk $e");
    }
  }

  void unHelped(BuildContext context, int reviewId) async {
    try {
      SolutionService().unHelped(reviewId);
    } catch (e) {
      print("ERROR unHelped produk $e");
    }
  }
}
