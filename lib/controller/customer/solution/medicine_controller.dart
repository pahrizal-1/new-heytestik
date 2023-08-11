import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/clinic.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/models/medicine.dart';
import 'package:heystetik_mobileapps/models/treatment_detail.dart';
import 'package:heystetik_mobileapps/models/treatment_review.dart';
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

class MedicineController extends StateClass {
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

  void addMedicineToCart(BuildContext context, int productID) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      SolutionService().addMedicineToCart(productID);
    });

    isLoading.value = false;
  }
}
