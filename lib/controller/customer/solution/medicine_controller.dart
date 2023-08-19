import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/medicine.dart' as Medicine;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart'
    as Overview;
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart'
    as ProductReviewModel;

class MedicineController extends StateClass {
  Rx<DrugRecipeModel?> drugRecipe = DrugRecipeModel.fromJson({}).obs;
  List<Data2> data = [];

  Rx<Overview.Data> overviewMedicine = Overview.Data.fromJson({}).obs;
  RxList<ProductReviewModel.Data2> productReview =
      List<ProductReviewModel.Data2>.empty().obs;

  // RxBool isLoadingOverviewMedicine = false.obs;
  RxBool isLoadingProductReviewMedicine = false.obs;

  Future<List<Medicine.Data2>> getMedicine(
      BuildContext context, int page) async {
    isLoading.value = true;
    List<Medicine.Data2> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getMedicine(page);
      data = res.data!.data!;
    });
    isLoading.value = false;
    return data;
  }

  Future<List<Medicine.Data2>> getMedicineByConcern(
      BuildContext context, int page, List concern) async {
    isLoading.value = true;
    List<Medicine.Data2> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getMedicineByConcern(page, concern);
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

  void addMedicineToCart(BuildContext context, int productID) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      SolutionService().addMedicineToCart(productID);
    });

    isLoading.value = false;
  }

  getOverviewProduct(BuildContext context, int id) async {
    // isLoadingOverviewMedicine.value = true;
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
    // isLoadingOverviewMedicine.value = false;
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
}
