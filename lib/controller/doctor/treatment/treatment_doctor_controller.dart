import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart';
import 'package:heystetik_mobileapps/service/customer/solution/treatment_service.dart';

import '../../../models/doctor/treatment_type_model.dart';

class TreatmentDoctorController extends StateClass {
  Rx<TreatmentModel> responseTreatment = TreatmentModel().obs;
  Rx<TreatmentTypeModel> responseTreatmentType = TreatmentTypeModel().obs;
  RxList<Data2> dataTreatment = List<Data2>.empty(growable: true).obs;
  RxList<DataObject> listOfTreatment = List<DataObject>.empty(growable: true).obs;
  RxList<TreatmentTypeModel> listOfTreatmentModel = List<TreatmentTypeModel>.empty(growable: true).obs;
  var hasMore = true.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;
  List<String> filterMethods = [];
  List toggleMethods = [];

  Future<List<DataObject>> getAllTreatmentType(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
    List<String>? methods,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseTreatmentType.value = await TreatmentService().getAllTreatmentType(
        page,
        search: search,
        filter: filter,
        methods: methods ?? [],
      );
      print('current ${currentPage.value}');
      print('pages ${totalPage.value}');
      print('check method ${methods}');

      // listOfTreatment.value = [];
      print('counting ${listOfTreatment.length}');
      // if (methods != null) {
      //   hasMore.value = false;
      //   listOfTreatment.value = responseTreatmentType.value.data!.data!;
      //   currentPage.value++;
      // } else {
      // }
      listOfTreatment.addAll(responseTreatmentType.value.data!.data!);
      currentPage.value++;
      if (page > totalPage.value) {
        hasMore.value = false;
      }
      totalPage.value = responseTreatmentType.value.data!.meta!.pageCount!.toInt();
      print('disiin ${totalPage.value}');

      notifyListeners();
    });
    isLoading.value = false;
    return listOfTreatment;
  }

  // Future<List<Data2>> getAllTreatment(
  //   BuildContext context,
  //   int page, {
  //   String? search,
  //   Map<String, dynamic>? filter,
  // }) async {
  //   isLoading.value = true;
  //   await ErrorConfig.doAndSolveCatchInContext(context, () async {
  //     responseTreatment.value = await TreatmentService().getAllTreatment(
  //       page,
  //       search: search,
  //       filter: filter,
  //     );
  //     print('current ${currentPage.value}');
  //     print('pages ${currentPage.value}');
  //     dataTreatment.addAll(responseTreatment.value.data!.data!);
  //     if (page > totalPage.value || dataTreatment.length < 10) {
  //       hasMore.value = false;
  //     }
  //     currentPage.value++;
  //     totalPage.value = responseTreatment.value.data!.meta!.pageCount!.toInt();

  //     notifyListeners();
  //   });
  //   isLoading.value = false;
  //   return dataTreatment;
  // }

  Future refresh(
    BuildContext context, {
    List<String>? methods,
    String? search,
  }) async {
    currentPage.value = 1;
    hasMore.value = true;
    dataTreatment.value = [];
    listOfTreatment.value = [];
    totalPage.value = 1;

    await getAllTreatmentType(
      context,
      currentPage.value,
      search: search,
      methods: methods,
    );
    // await getAllTreatment(context, currentPage.value);
    notifyListeners();
  }

  Future loadMore(BuildContext context, ScrollController scrollController) async {
    // scrollController.hasClients;
    print('kesini ga ${currentPage.value}');
    if (currentPage.value <= totalPage.value) {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels && hasMore.value) {
        await getAllTreatmentType(
          context,
          currentPage.value,
        );
        //  await getAllTreatment(
        //   context,
        //   currentPage.value,
        // );
      }
    } else {
      null;
    }
  }
}
