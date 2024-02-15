import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

class TreatmentDoctorController extends StateClass {
  Rx<TreatmentModel> responseTreatment = TreatmentModel().obs;
  RxList<Data2> dataTreatment = List<Data2>.empty(growable: true).obs;
  var hasMore = true.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;

  Future<List<Data2>> getAllTreatment(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseTreatment.value = await TreatmentService().getAllTreatment(
        page,
        search: search,
        filter: filter,
      );
      print('current ${currentPage.value}');
      print('pages ${currentPage.value}');
      dataTreatment.addAll(responseTreatment.value.data!.data!);
      if (page > totalPage.value || dataTreatment.length < 10) {
        hasMore.value = false;
      }
      currentPage.value++;
      totalPage.value = responseTreatment.value.data!.meta!.pageCount!.toInt();

      notifyListeners();
    });
    isLoading.value = false;
    return dataTreatment;
  }

  Future refresh(BuildContext context) async {
    currentPage.value = 1;
    hasMore.value = true;
    dataTreatment.value = [];
    totalPage.value = 1;

    await getAllTreatment(context, currentPage.value);
    notifyListeners();
  }

  Future loadMore(BuildContext context, ScrollController scrollController) async {
    // scrollController.hasClients;
    print('kesini ga ${currentPage.value}');
    if (scrollController.position.maxScrollExtent == scrollController.position.pixels && hasMore.value) {
      await getAllTreatment(
        context,
        currentPage.value,
      );
    }
  }
}
