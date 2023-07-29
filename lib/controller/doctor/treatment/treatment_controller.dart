import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';
import '../../../service/customer/notification/notification_services.dart';

class TreatmentController extends StateClass {
  RxList<TreatmentRecommendationModel> treatment = List<TreatmentRecommendationModel>.empty().obs;

  void getTreatment(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<TreatmentRecommendationModel> data = await TreatmentService().getTreatmentRecommendation();
      treatment.value = data;
    });
    isLoading.value = false;
  }

  void getTopTreatment(BuildContext context) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<TreatmentRecommendationModel> data = await TreatmentService().getTopTreatment();
      treatment.value = data;
    });

    isLoading.value = false;
  }
}
