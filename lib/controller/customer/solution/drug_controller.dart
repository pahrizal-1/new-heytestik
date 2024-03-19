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

class DrugController extends StateClass {
  Rx<DrugRecipeModel?> drugRecipe = DrugRecipeModel.fromJson({}).obs;
  CartController state = CartController();
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
    });
    isLoading.value = false;
    return drugRecipe.value!.data!.data!;
  }

  Future<List<Drug.Data2>> drugRecomendation(
      BuildContext context, int page, int id) async {
    isLoading.value = true;
    List<Drug.Data2> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().drugRecomendation(page, id);
      data = res.data!.data!;
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
}
