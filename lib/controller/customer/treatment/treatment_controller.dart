import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/clinic.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/models/treatment_detail.dart';
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

class TreatmentController extends StateClass {
  RxList<TreatmentRecommendationModel> treatment =
      List<TreatmentRecommendationModel>.empty().obs;
  Rx<TreatmentModel> responseTreatment = TreatmentModel().obs;
  RxList<Data2> dataTreatment = List<Data2>.empty(growable: true).obs;
  Rx<TreatmentDetailModel> treatmentDetail = TreatmentDetailModel().obs;
  RxInt index = 0.obs;

  Rx<ClinicModel> responseClinic = ClinicModel().obs;
  RxList<ClinicDataModel> dataClinic =
      List<ClinicDataModel>.empty(growable: true).obs;

  Future<List<ClinicDataModel>> getClinic(
      BuildContext context, int page) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      ClinicModel data = await TreatmentService().getClinic(page);
      responseClinic.value = data;
      dataClinic.value.addAll(responseClinic.value.data!);
    });

    isLoading.value = false;

    return responseClinic.value.data!;
  }

  void userWishlistTreatment(BuildContext context, int treatmentID, bool wishlist) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentService().userWishlistTreatment(treatmentID, wishlist);
    });
    isLoading.value = false;
  }

  void getTreatmentDetail(BuildContext context, int treatmentID) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      treatmentDetail.value =
          await TreatmentService().getTreatmentDetail(treatmentID);
    });

    isLoading.value = false;
  }


  Future<List<Data2>> getTreatmentFromSameClinic(BuildContext context, int page, int clinicID) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getTreatmentFromSameClinic(page, clinicID);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }

  Future<Map<String, dynamic>> getTreatmentOverview(BuildContext context, int treatmentID) async {
    isLoading.value = true;
    Map<String, dynamic> data = {};
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
       data = await TreatmentService().getOverview(treatmentID);
    });

    isLoading.value = false;
    return data;
  }

  void getTreatment(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<TreatmentRecommendationModel> data =
          await TreatmentService().getTreatmentRecommendation();
      treatment.value = data;
    });
    isLoading.value = false;
  }

  Future<List<Data2>> getTopTreatment(BuildContext context, int page) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getTopTreatment(page);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }

  Future<List<Data2>> getTopRatingTreatment(
      BuildContext context, int page) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data =
          await TreatmentService().getTopRatingTreatment(page);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }

  Future<List<Data2>> getTrendingTreatment(
      BuildContext context, int page) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getTrendingTreatment(page);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }

  Future<List<Data2>> getNearTreatment(BuildContext context, int page) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getNearTreatment(page);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
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
