import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/medicine.dart';
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';

class MedicineController extends StateClass {
  Rx<DrugRecipeModel?> drugRecipe = DrugRecipeModel.fromJson({}).obs;
  List<Data2> data = [];

  Future<List<MedicineModel>> getMedicine(
      BuildContext context, int page) async {
    isLoading.value = true;
    List<MedicineModel> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data = await SolutionService().getMedicine(page);
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
}
