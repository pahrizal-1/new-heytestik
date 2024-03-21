// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/solution/cart_controller.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_drug_model.dart' as DetailDrug;
import 'package:heystetik_mobileapps/models/drug_model.dart' as Drug;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart' as DrugRecipe;

import '../../../models/drug_model.dart';

class DrugController extends StateClass {
  Rx<DrugRecipe.DrugRecipeModel?> drugRecipe = DrugRecipe.DrugRecipeModel.fromJson({}).obs;
  Rx<DrugModel> responseDrugModel = DrugModel().obs;
  RxList<Drug.Data2> listOfDrug = List<Drug.Data2>.empty(growable: true).obs;
  var hasMore = true.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;
  List<String> filterGolonganObat = [];
  List toggleGolonganObat = [];
  List<String> filterBentukObat = [];
  List toggleBentukObat = [];
  List<String> filterKemasanObat = [];
  List toggleKemasanObat = [];
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

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

  Future<List<Drug.Data2>> getAllDrug(
    BuildContext context,
    int page, {
    String? search,
    // List<String>? methods,
    List<String>? category,
    List<String>? classification,
    List<String>? form,
    int? minPrice,
    int? maxPrice,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseDrugModel.value = await SolutionService().getDrug(
        page,
        search: search,
        category: category,
        classification: classification,
        form: form,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      print('var data ${category}');
      listOfDrug.addAll(responseDrugModel.value.data!.data!);
      currentPage.value++;
      if (page > totalPage.value) {
        hasMore.value = false;
      }
      totalPage.value = responseDrugModel.value.data!.meta!.pageCount!.toInt();
      for (var i in responseDrugModel.value.data!.data!) print('datlper ${i.name}');

      notifyListeners();
    });
    isLoading.value = false;
    return listOfDrug;
  }

  Future refreshDrug(
    BuildContext context, {
    List<String>? category,
    List<String>? classification,
    List<String>? form,
    int? minPrice,
    int? maxPrice,
    String? search,
  }) async {
    currentPage.value = 1;
    hasMore.value = true;
    listOfDrug.value = [];
    totalPage.value = 1;

    await getAllDrug(
      context,
      currentPage.value,
      search: search,
      category: category,
      classification: classification,
      form: form,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );

    // if (category == null || classification == null || form == null) {
    //   null;
    // } else {
    //   await getAllDrug(
    //     context,
    //     currentPage.value,
    //     search: search,
    //     category: category,
    //     classification: classification,
    //     form: form,
    //   );
    // }
    // await getAllTreatment(context, currentPage.value);
    notifyListeners();
  }

  Future loadMoreDrug(BuildContext context, ScrollController scrollController) async {
    // scrollController.hasClients;
    print('kesini ga ${currentPage.value}');
    if (currentPage.value <= totalPage.value) {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels && hasMore.value) {
        await getAllDrug(
          context,
          currentPage.value,
        );
        //  await getAllTreatment(
        //   context,
        //   currentPage.value,
        // );
      }
    } else {
      null;
    }
  }

  Future<List<DrugRecipe.Data2>> getDrugRecipe(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      drugRecipe.value = await SolutionService().getDrugRecipe(page);
    });
    isLoading.value = false;
    return drugRecipe.value!.data!.data!;
  }

  Future<List<Drug.Data2>> drugRecomendation(BuildContext context, int page, int id) async {
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
