// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart'
    as DetailSkincare;
import 'package:heystetik_mobileapps/models/customer/lookup_solution_model.dart'
    as Lookup;
import 'package:heystetik_mobileapps/models/customer/skincare_solution_model.dart'
    as Skincare;
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';

class SkincareController extends StateClass {
  List<Lookup.Data2> lookup = [];
  List<Skincare.Data2> skincare = [];
  Rx<DetailSkincare.Data> skincareDetail = DetailSkincare.Data.fromJson({}).obs;

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
