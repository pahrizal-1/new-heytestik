import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/clinic.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/models/find_clinic_model.dart';
import 'package:heystetik_mobileapps/models/lookup_treatment.dart';
import 'package:heystetik_mobileapps/models/treatment_detail.dart';
import 'package:heystetik_mobileapps/models/treatment_review.dart';
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

class TreatmentController extends StateClass {
  RxList<TreatmentRecommendationModel> treatment = List<TreatmentRecommendationModel>.empty().obs;
  Rx<TreatmentModel> responseTreatment = TreatmentModel().obs;
  RxList<Data2> dataTreatment = List<Data2>.empty(growable: true).obs;
  RxList<Data2> filterTreatment = List<Data2>.empty(growable: true).obs;
  Rx<TreatmentDetailModel> treatmentDetail = TreatmentDetailModel().obs;
  RxInt index = 0.obs;
  RxInt pax = 0.obs;
  var dataUser;
  RxString fullName = ''.obs;
  RxString phone = ''.obs;

  Rx<ClinicModel> responseClinic = ClinicModel().obs;
  RxList<ClinicDataModel> dataClinic = List<ClinicDataModel>.empty(growable: true).obs;
  Rx<FindClinicModel> responseClinicDetail = FindClinicModel().obs;

  getDataUser() async {
    dataUser = await LocalStorage().getDataUser();

    print('dataUser ${dataUser}');
    print('fullname ${dataUser['fullname']}');
    print('no_phone ${dataUser['no_phone']}');

    fullName.value = dataUser['fullname'];
    phone.value = dataUser['no_phone'];
  }

  Future<List<ClinicDataModel>> getClinic(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      ClinicModel data = await TreatmentService().getClinic(page, search: search, filter: filter);
      responseClinic.value = data;
      dataClinic.value.addAll(responseClinic.value.data!);
    });

    isLoading.value = false;

    return responseClinic.value.data!;
  }

  void getFilterTreatment() async {}

  Future<FindClinicModel> getClinicDetail(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseClinicDetail.value = await TreatmentService().getClinicDetail(id);
    });
    isLoading.value = false;
    return responseClinicDetail.value;
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
      treatmentDetail.value = await TreatmentService().getTreatmentDetail(treatmentID);
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
      List<TreatmentRecommendationModel> data = await TreatmentService().getTreatmentRecommendation();
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

  Future<List<Data2>> getTopRatingTreatment(BuildContext context, int page, {String? search}) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getTopRatingTreatment(page);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }

  Future<List<Data2>> getTrendingTreatment(BuildContext context, int page, {String? search}) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getTrendingTreatment(page);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }

  Future<List<Data2>> getNearTreatment(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getNearTreatment(
        page,
        search: search,
        filter: filter,
      );
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;

    return responseTreatment.value.data!.data!;
  }

  Future<List<Data2>> getAllTreatment(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getAllTreatment(
        page,
        search: search,
        filter: filter,
      );

      responseTreatment.value = data;

      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;
    return responseTreatment.value.data!.data!;
  }

  Future<List<TreatmentReviewModel>> getTreatmentReview(
    BuildContext context,
    int page,
    int treatmentID, {
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    List<TreatmentReviewModel> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data = await TreatmentService().getTreatmentReview(page, treatmentID, filter: filter);
    });
    isLoading.value = false;

    return data;
  }

  Future<List<LookupTreatmentModel>> getLookupTreatment(BuildContext context) async {
    isLoading.value = true;
    List<LookupTreatmentModel> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data = await TreatmentService().getLookupTreatment();
    });
    isLoading.value = false;

    return data;
  }
}
