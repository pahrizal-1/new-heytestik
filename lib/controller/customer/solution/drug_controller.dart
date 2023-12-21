// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_drug_model.dart'
    as DetailDrug;
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart'
    as Overview;
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;

class DrugController extends StateClass {
  Rx<DrugRecipeModel?> drugRecipe = DrugRecipeModel.fromJson({}).obs;
  CartController state = CartController();

  List<Data2> data = [];

  Rx<Overview.Data> overviewMedicine = Overview.Data.fromJson({}).obs;
  RxList<ProductReviewModel.Data2> productReview =
      List<ProductReviewModel.Data2>.empty().obs;

  // RxBool isLoadingOverviewDrug = false.obs;
  RxBool isLoadingProductReviewMedicine = false.obs;
  RxBool isLoadingDetailDrug = false.obs;

  Rx<DetailDrug.Data> drugDetail = DetailDrug.Data.fromJson({}).obs;

  Future<List<Drug.Data2>> getDrug(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    List<Drug.Data2> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getDrug(
        page,
        search: search,
        filter: filter,
      );
      data = res.data!.data!;
    });
    isLoading.value = false;
    return data;
  }

  Future<List<Data2>> getDrugRecipe(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      drugRecipe.value = await SolutionService().getDrugRecipe(page);
      data = drugRecipe.value!.data!.data!;
    });
    isLoading.value = false;
    return data;
  }

  detailDrug(BuildContext context, int id) async {
    isLoadingDetailDrug.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      drugDetail.value = DetailDrug.Data.fromJson({});
      var res = await SolutionService().detailDrug(id);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      drugDetail.value = res.data!;
    });
    isLoadingDetailDrug.value = false;
  }

  void addDrugToCart(BuildContext context, int productID) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      SolutionService().addDrugToCart(productID);
    });
    await state.totalCartFunc();
    isLoading.value = false;
  }

  getOverviewProduct(BuildContext context, int id) async {
    // isLoadingOverviewDrug.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getOverviewProduct(id);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      overviewMedicine.value = res.data!;
    });
    // isLoadingOverviewDrug.value = false;
  }

  Future<List<ProductReviewModel.Data2>> getReviewProduct(
      BuildContext context, int page, int take, int id) async {
    isLoadingProductReviewMedicine.value = true;
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
    isLoadingProductReviewMedicine.value = false;

    return productReview.value;
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
