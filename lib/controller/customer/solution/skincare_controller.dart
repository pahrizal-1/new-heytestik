// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart'
    as DetailSkincare;
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';

class SkincareController extends StateClass {
  List<Lookup.Data2> lookup = [];
  List<Skincare.Data2> skincare = [];
  Rx<DetailSkincare.Data> skincareDetail = DetailSkincare.Data.fromJson({}).obs;
  // RxString productName = ''.obs;
  // RxInt price = 0.obs;
  // RxInt priceDiscouts = 0.obs;
  // RxString category = ''.obs;
  // RxInt productStock = 0.obs;
  // RxBool productIsActive = false.obs;
  // RxInt rating = 0.obs;
  // RxString type = ''.obs;
  // RxString display = ''.obs;
  // RxInt minOrded = 0.obs;
  // RxString shiping = ''.obs;
  // RxString productTreshold = ''.obs;
  // RxString productSku = ''.obs;
  // RxString image = ''.obs;
  // //
  // RxString description = ''.obs;
  // RxString brand = ''.obs;
  // RxString specificationTexture = ''.obs;
  // RxString specificationBpom = ''.obs;
  // RxString specificationNetto = ''.obs;
  // RxString specificationNettoType = ''.obs;
  // RxString specificationPackagingTpe = ''.obs;
  // RxString specificationHowToUse = ''.obs;
  // RxString specificationStorageAdvice = ''.obs;
  // RxString specificationExpired = ''.obs;
  // RxString specificationIngredients = ''.obs;

  getSkincare(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getSkincare();
      skincare = res.data!.data!;
    });
    isLoading.value = false;
  }

  detailSkincare(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().detailSkincare(id);
      skincareDetail.value = res.data!;
      // belum semmua data ditampilkan di view
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      // productName.value = res.data?.name ?? '-';
      // price.value = res.data?.price ?? 0;
      // priceDiscouts.value = res.data?.price ?? 0;
      // category.value = res.data?.category ?? '-';
      // productStock.value = res.data?.productStock ?? 0;
      // productIsActive.value = res.data?.productIsActive ?? false;
      // rating.value = res.data?.rating ?? 0;
      // type.value = res.data?.type ?? '-';
      // display.value = res.data?.display ?? '-';
      // minOrded.value = res.data?.minOrder ?? 0;
      // image.value = res.data!.mediaProducts?[0].media?.path ?? '-';
      // description.value = res.data?.skincareDetail?.description ?? '-';
    });
    isLoading.value = false;
  }

  getLookup(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getLookup();
      lookup = res.data!.data!;
    });
    isLoading.value = false;
  }
}
