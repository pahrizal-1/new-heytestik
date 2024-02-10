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
import 'package:heystetik_mobileapps/models/lookup_treatment.dart';
import 'package:heystetik_mobileapps/models/treatment_review_model.dart' as TreatmentReview;
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

class TreatmentController extends StateClass {
  RxList<TreatmentRecommendationModel> treatment = List<TreatmentRecommendationModel>.empty().obs;
  Rx<TreatmentModel> responseTreatment = TreatmentModel().obs;
  RxList<Data2> dataTreatment = List<Data2>.empty(growable: true).obs;
  RxList<Data2> filterTreatment = List<Data2>.empty(growable: true).obs;
  Rx<Data2> treatmentDetail = Data2().obs;
  RxInt index = 0.obs;
  RxInt pax = 0.obs;
  var dataUser;
  RxString fullName = '-'.obs;
  RxString phone = '-'.obs;
  var hasMore = true.obs;

  Rx<Clinic.ClinicModel> responseClinic = Clinic.ClinicModel().obs;
  RxList<Clinic.Data2> dataClinic = List<Clinic.Data2>.empty(growable: true).obs;
  Rx<FindClinicModel> responseClinicDetail = FindClinicModel().obs;

  RxList<TreatmentReview.Data2> treatmentReview = List<TreatmentReview.Data2>.empty().obs;

  getDataUser() async {
    dataUser = await LocalStorage().getDataUser();
    fullName.value = dataUser['fullname'];
    phone.value = dataUser['no_phone'];
  }

  Future<List<Clinic.Data2>> getClinic(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      Clinic.ClinicModel data = await TreatmentService().getClinic(page, search: search, filter: filter);
      responseClinic.value = data;
      dataClinic.value.addAll(responseClinic.value.data?.data ?? []);

      print(responseClinic.value.data?.data?.length);
    });

    isLoading.value = false;

    return responseClinic.value.data?.data ?? [];
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

  void addWishlistTreatment(BuildContext context, int treatmentID) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().addWishlistTreatment(treatmentID);
      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertSuccessWishlist(),
      // );
    });
  }

  void deleteWishlistTreatment(BuildContext context, int treatmentID) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().deleteWishlistTreatment(treatmentID);
      print('res $res');
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertSuccessWishlist(),
      // );
    });
  }

  Future<void> getTreatmentDetail(BuildContext context, int treatmentID) async {
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
      TreatmentModel data = await TreatmentService().getTopRatingTreatment(page, search: search);
      responseTreatment.value = data;
      dataTreatment.value.addAll(responseTreatment.value.data!.data!);
    });
    isLoading.value = false;
    return responseTreatment.value.data!.data!;
  }

  Future<List<Data2>> getTrendingTreatment(BuildContext context, int page, {String? search}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getTrendingTreatment(page, search: search);
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
    dataTreatment.value = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      TreatmentModel data = await TreatmentService().getAllTreatment(
        page,
        search: search,
        filter: filter,
      );
      responseTreatment.value = data;

      dataTreatment.addAll(responseTreatment.value.data!.data!);
    });

    isLoading.value = false;
    return responseTreatment.value.data!.data!;
  }

  Future<List<TreatmentReview.Data2>> getTreatmentReview(
    BuildContext context,
    int page,
    int take,
    int id, {
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().getTreatmentReview(page, take, id, filter: filter);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      treatmentReview.value = res.data!.data!;
    });
    isLoading.value = false;
    return treatmentReview.value;
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

  void helped(BuildContext context, int reviewId) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().helped(reviewId);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
    });
  }

  void unHelped(BuildContext context, int reviewId) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentService().unHelped(reviewId);
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
    });
  }
}
