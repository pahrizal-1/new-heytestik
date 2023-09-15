// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart'
    as DetailSkincare;
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart'
    as Overview;
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;
import 'package:heystetik_mobileapps/models/customer/related_product_skincare_model.dart'
    as RelatedProductSkincare;
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;

import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';

class SkincareController extends StateClass {
  Rx<Skincare.SkincareModel> responseSkincare = Skincare.SkincareModel().obs;
  RxList<Skincare.Data2> dataSkincare =
      List<Skincare.Data2>.empty(growable: true).obs;

  Rx<DetailSkincare.Data> skincareDetail = DetailSkincare.Data.fromJson({}).obs;
  List<RelatedProductSkincare.Data2> relatedSkincare = [];
  Rx<Overview.Data> overviewSkincare = Overview.Data.fromJson({}).obs;
  RxList<ProductReviewModel.Data2> productReview =
      List<ProductReviewModel.Data2>.empty().obs;

  RxBool isLoadingDetailSkincare = false.obs;
  RxBool isLoadingRelatedSkincare = false.obs;
  RxBool isLoadingProductReviewSkincare = false.obs;
  RxBool isLoadingLookup = false.obs;

  Future<List<Skincare.Data2>> getAllSkincare(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      Skincare.SkincareModel data = await SolutionService().getAllSkincare(
        page,
        search: search,
        filter: filter,
      );

      responseSkincare.value = data;

      dataSkincare.value.addAll(responseSkincare.value.data!.data!);
    });

    isLoading.value = false;
    return responseSkincare.value.data!.data!;
  }

  detailSkincare(BuildContext context, int id) async {
    isLoadingDetailSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      skincareDetail.value = DetailSkincare.Data.fromJson({});
      var res = await SolutionService().detailSkincare(id);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      skincareDetail.value = res.data!;
    });
    isLoadingDetailSkincare.value = false;
  }

  getOverviewProduct(BuildContext context, int id) async {
    // isLoadingOverviewSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getOverviewProduct(id);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      overviewSkincare.value = res.data!;
    });
    // isLoadingOverviewSkincare.value = false;
  }

  Future<List<ProductReviewModel.Data2>> getReviewProduct(
    BuildContext context,
    int page,
    int take,
    int id, {
    Map<String, dynamic>? filter,
  }) async {
    isLoadingProductReviewSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService()
          .getReviewProduct(page, take, id, filter: filter);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      productReview.value = res.data!.data!;
    });
    isLoadingProductReviewSkincare.value = false;

    return productReview.value;
  }

  relatedProductSkincare(BuildContext context, int id) async {
    isLoadingRelatedSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().relatedProductSkincare(id, 1);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      relatedSkincare = res.data!.data!;
    });
    isLoadingRelatedSkincare.value = false;
  }

  Future<List<Lookup.Data2>> getLookup(
      BuildContext context, String category) async {
    isLoadingLookup.value = true;
    List<Lookup.Data2> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getLookup(category);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      data.addAll(res.data!.data!);
    });
    isLoadingLookup.value = false;
    return data;
  }

  void helped(BuildContext context, int reviewId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().helped(reviewId);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
    });
    isLoading.value = false;
  }

  void unHelped(BuildContext context, int reviewId) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().unHelped(reviewId);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
    });

    isLoading.value = false;
  }
}
