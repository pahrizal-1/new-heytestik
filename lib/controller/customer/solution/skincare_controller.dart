// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart'
    as DetailSkincare;
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';

class SkincareController extends StateClass {
  Rx<Skincare.SkincareModel> responseSkincare = Skincare.SkincareModel().obs;
  Rx<Skincare.SkincareModel> responseSkincareDermatologists =
      Skincare.SkincareModel().obs;
  Rx<Skincare.SkincareModel> responseSkincareRecomendation =
      Skincare.SkincareModel().obs;
  Rx<Skincare.SkincareModel> responseRelatedSkincare =
      Skincare.SkincareModel().obs;
  Rx<DetailSkincare.Data> skincareDetail = DetailSkincare.Data.fromJson({}).obs;
  RxBool isLoadingDetailSkincare = false.obs;

  Future<List<Skincare.Data2>> getAllSkincare(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseSkincare.value = await SolutionService().getAllSkincare(
        page,
        search: search,
        filter: filter,
      );
    });
    isLoading.value = false;
    return responseSkincare.value.data!.data!;
  }

  Future<List<Skincare.Data2>> skincareDermatologists(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().skincareDermatologists(1);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      responseSkincareDermatologists.value = res;
    });

    return responseSkincareDermatologists.value.data!.data!;
  }

  Future<List<Skincare.Data2>> skincareRecomendation(
      BuildContext context, int id) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().skincareRecomendation(id, 1);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      responseSkincareRecomendation.value = res;
    });
    return responseSkincareRecomendation.value.data!.data!;
  }

  Future<List<Skincare.Data2>> relatedProductSkincare(
      BuildContext context, int id) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().relatedProductSkincare(id, 1);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      responseRelatedSkincare.value = res;
    });
    return responseRelatedSkincare.value.data!.data!;
  }

  Future<void> detailSkincare(BuildContext context, int id) async {
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
}
