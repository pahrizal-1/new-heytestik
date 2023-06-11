import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/models/interest_conditions_model.dart';
import 'package:heystetik_mobileapps/service/interest_conditions/interest_conditions_service.dart';

class InterestConditionsController {
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  Rx<InterestConditionsModel> data = InterestConditionsModel(data: []).obs;
  RxList<Data> filterData = List<Data>.empty().obs;

  getInterestConditions(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // await Future.delayed(Duration(seconds: 3));
      data.value = await InterestConditionsService().getInterestConditions();
      filterData.value = data.value.data!;
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = data.value.data!
        .where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
