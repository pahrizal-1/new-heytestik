// ignore_for_file: use_build_context_synchronously

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
  List<Lookup.Data2> lookupDisplay = [];
  List<Lookup.Data2> lookupCategory = [];
  List<Skincare.Data2> skincare = [];
  RxList<Skincare.Data2> filterData = List<Skincare.Data2>.empty().obs;
  Rx<DetailSkincare.Data> skincareDetail = DetailSkincare.Data.fromJson({}).obs;
  List<RelatedProductSkincare.Data2> relatedSkincare = [];
  Rx<Overview.Data> overviewSkincare = Overview.Data.fromJson({}).obs;
  RxList<ProductReviewModel.Data2> productReview =
      List<ProductReviewModel.Data2>.empty().obs;

  RxBool isLoadingSkincare = false.obs;
  RxBool isLoadingDetailSkincare = false.obs;
  RxBool isLoadingRelatedSkincare = false.obs;
  // RxBool isLoadingOverviewSkincare = false.obs;
  RxBool isLoadingProductReviewSkincare = false.obs;
  RxBool isLoadingLookup = false.obs;

  getSkincare(BuildContext context) async {
    isLoadingSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getSkincare();

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      skincare = res.data!.data!;
    });
    isLoadingSkincare.value = false;
  }

  getSkincareByCategory(BuildContext context, String category) async {
    isLoadingSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getSkincareByCategory(category);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      filterData.value = res.data!.data!;
    });
    isLoadingSkincare.value = false;
  }

  getSkincareByDisplay(BuildContext context, List display) async {
    isLoadingSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        skincare.clear();
        var res = await SolutionService().getSkincareByDisplay(display);

        if (res.success != true && res.message != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: res.message.toString(),
          );
        }
        skincare = res.data!.data!;
      } catch (e) {
        print("haeheh $e");
      }
    });
    isLoadingSkincare.value = false;
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
      BuildContext context, int page, int take, int id) async {
    isLoadingProductReviewSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getReviewProduct(page, take, id);

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

  getLookup(BuildContext context, String category) async {
    isLoadingLookup.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (category == 'SKINCARE_DISPLAY') {
        var res = await SolutionService().getLookup(category);

        if (res.success != true && res.message != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: res.message.toString(),
          );
        }
        lookupDisplay = res.data!.data!;
      }

      if (category == 'SKINCARE_CATEGORY') {
        var res = await SolutionService().getLookup(category);

        if (res.success != true && res.message != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: res.message.toString(),
          );
        }
        lookupCategory = res.data!.data!;
      }
    });
    isLoadingLookup.value = false;
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
