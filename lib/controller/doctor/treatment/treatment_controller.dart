import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';
import '../../../service/customer/notification/notification_services.dart';

class TreatmentController extends StateClass {
  RxList<TreatmentRecommendationModel> treatment = List<TreatmentRecommendationModel>.empty().obs;
  Rx<TreatmentModel> responseTreatment = TreatmentModel().obs;
  RxList<Data2> dataTreatment = List<Data2>.empty(growable: true).obs;
  RxInt index = 0.obs;

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

  Future<List<Data2>> getAllTreatment(BuildContext context, int page) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getAllTreatment(page);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }
}
