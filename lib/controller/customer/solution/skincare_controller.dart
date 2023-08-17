// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart'
    as DetailSkincare;
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;
import 'package:heystetik_mobileapps/models/customer/related_product_skincare_model.dart'
    as RelatedProductSkincare;
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';

class SkincareController extends StateClass {
  List<Lookup.Data2> lookup = [];
  List<Skincare.Data2> skincare = [];
  RxList<Skincare.Data2> filterData = List<Skincare.Data2>.empty().obs;
  Rx<DetailSkincare.Data> skincareDetail = DetailSkincare.Data.fromJson({}).obs;
  List<RelatedProductSkincare.Data2> relatedSkincare = [];

  RxBool isLoadingSkincare = false.obs;
  RxBool isLoadingDetailSkincare = false.obs;
  RxBool isLoadingRelatedSkincare = false.obs;
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

  relatedProductSkincare(BuildContext context, int id) async {
    isLoadingRelatedSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        var res = await SolutionService().relatedProductSkincare(id, 1);
        print("masuk");
        if (res.success != true && res.message != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: res.message.toString(),
          );
        }
        relatedSkincare = res.data!.data!;
        print("masuk 2");
      } catch (e) {
        print("error $e");
      }
    });
    isLoadingRelatedSkincare.value = false;
  }

  getLookup(BuildContext context) async {
    isLoadingLookup.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getLookup();

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      lookup = res.data!.data!;
    });
    isLoadingLookup.value = false;
  }
}
