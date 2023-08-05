// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';

class EtalaseController extends StateClass {
  TextEditingController searchController = TextEditingController();
  Rx<ConcernModel?> concern = ConcernModel.fromJson({}).obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;

  getConcern(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      concern.value = await SolutionService().getConcern();
      filterData.value = concern.value!.data!.data!;
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = concern.value!.data!.data!.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
  }
}
