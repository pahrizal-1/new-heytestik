// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart'
    as Lookup;

class EtalaseController extends StateClass {
  TextEditingController searchController = TextEditingController();
  Rx<ConcernModel?> concern = ConcernModel.fromJson({}).obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;

  Future<List<Data2>> getConcern(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      concern.value = await SolutionService().getConcern();
      filterData.value = concern.value!.data!.data!;
    });
    isLoading.value = false;
    return filterData;
  }

  onChangeFilterText(String value) {
    if (value == "") {
      filterData.value = concern.value!.data!.data!;
    } else {
      filterData.value = concern.value!.data!.data!
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }

  Future<List<Lookup.Data2>> getLookup(
      BuildContext context, String category) async {
    List<Lookup.Data2> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getLookup(category);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      data.addAll(res.data!.data!);
    });
    return data;
  }
}
