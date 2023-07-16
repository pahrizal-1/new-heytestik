import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/doctor/skincare_recommendations_model.dart';
import 'package:heystetik_mobileapps/service/customer/skincare_recommendations/skincare_recommendations_service.dart';

class SkincareRecommendationController extends StateClass {
  TextEditingController searchController = TextEditingController();

  Rx<SkincareRecommendationModel> skincare = SkincareRecommendationModel().obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;

  getSkincareRecommendation(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      skincare.value =
          await SkincareRecommendationService().getSkincareRecommendation();
      filterData.value = skincare.value.data!.data!;
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = skincare.value.data!.data!
        .where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
