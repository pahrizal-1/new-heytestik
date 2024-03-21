// ignore_for_file: invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/clinic.dart' as Clinic;
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/models/find_clinic_model.dart';

import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

class TreatmentController extends StateClass {
  RxList<TreatmentRecommendationModel> treatment =
      List<TreatmentRecommendationModel>.empty().obs;
  Rx<Data2> treatmentDetail = Data2().obs;
  Rx<FindClinicModel> responseClinicDetail = FindClinicModel().obs;
  RxBool isLoadingDetailTreatment = false.obs;
  RxInt index = 0.obs;
  RxInt pax = 0.obs;
  var dataUser;
  RxString fullName = '-'.obs;
  RxString phone = '-'.obs;
  var hasMore = true.obs;

  getDataUser() async {
    dataUser = await LocalStorage().getDataUser();
    fullName.value = dataUser['fullname'];
    phone.value = dataUser['no_phone'];
  }

  Future<List<Data2>> getAllTreatment(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    List<Data2> dataTreatment = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().getAllTreatment(
        page,
        search: search,
        filter: filter,
      );
      dataTreatment.addAll(res.data?.data ?? []);
    });
    isLoading.value = false;
    return dataTreatment;
  }

  Future<List<Clinic.Data2>> getClinic(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    List<Clinic.Data2> dataClinic = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService()
          .getClinic(page, search: search, filter: filter);
      dataClinic.addAll(res.data?.data ?? []);
    });
    isLoading.value = false;
    return dataClinic;
  }

  Future<FindClinicModel> getClinicDetail(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseClinicDetail.value = await TreatmentService().getClinicDetail(id);
    });
    isLoading.value = false;
    return responseClinicDetail.value;
  }

  Future<void> getTreatmentDetail(BuildContext context, int treatmentID) async {
    isLoadingDetailTreatment.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      treatmentDetail.value =
          await TreatmentService().getTreatmentDetail(treatmentID);
    });
    isLoadingDetailTreatment.value = false;
  }

  Future<List<Data2>> getTreatmentFromSameClinic(
      BuildContext context, int page, int clinicID) async {
    isLoading.value = true;
    List<Data2> dataTreatment = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res =
          await TreatmentService().getTreatmentFromSameClinic(page, clinicID);
      dataTreatment.addAll(res.data?.data ?? []);
    });
    isLoading.value = false;
    return dataTreatment;
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
    List<Data2> dataTreatment = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().getTopTreatment(page);
      dataTreatment.addAll(res.data?.data ?? []);
    });
    isLoading.value = false;
    return dataTreatment;
  }

  Future<List<Data2>> getTopRatingTreatment(BuildContext context, int page,
      {String? search}) async {
    isLoading.value = true;
    List<Data2> dataTreatment = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res =
          await TreatmentService().getTopRatingTreatment(page, search: search);
      dataTreatment.addAll(res.data?.data ?? []);
    });
    isLoading.value = false;
    return dataTreatment;
  }

  Future<List<Data2>> getTrendingTreatment(BuildContext context, int page,
      {String? search}) async {
    isLoading.value = true;
    List<Data2> dataTreatment = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res =
          await TreatmentService().getTrendingTreatment(page, search: search);
      dataTreatment.addAll(res.data?.data ?? []);
    });
    isLoading.value = false;
    return dataTreatment;
  }

  Future<List<Data2>> getNearTreatment(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    List<Data2> dataTreatment = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().getNearTreatment(
        page,
        search: search,
        filter: filter,
      );
      dataTreatment.addAll(res.data?.data ?? []);
    });
    isLoading.value = false;
    return dataTreatment;
  }
}
