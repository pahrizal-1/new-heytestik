import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';

import '../../../models/doctor/treatment_recommendation_doctor/clinics_model.dart';
import '../../../models/doctor/treatment_recommendation_doctor/treatment_recommendation_model.dart';
import '../../../models/doctor/treatment_type_model.dart';
import '../../../service/customer/solution/treatment_service.dart';
import '../../../service/doctor/treatment/treatment_services.dart';
import '../consultation/consultation_controller.dart';

class TreatmentRecommendationController extends StateClass {
  TextEditingController searchController = TextEditingController();
  final DoctorConsultationController stateDoctor = Get.put(DoctorConsultationController());

  Rx<TreatmentReccommendationModel> treatment = TreatmentReccommendationModel().obs;
  Rx<Data2> treatmentById = Data2().obs;
  List dataTreatment = [].obs;
  RxBool isLoadingSkincare = false.obs;
  List<TextEditingController> notesController = [];
  Rx<ClinicForDoctorModel> responseClinic = ClinicForDoctorModel().obs;
  RxList<DataClinic> clinics = List<DataClinic>.empty().obs;

  RxList<Data2> treatmentDatas = List<Data2>.empty(growable: true).obs;
  List treatmentDatasById = [].obs;
  List dataTreatmentItems = [].obs;
  int data1 = 0;

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController recoveryTimeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  List dataTreatmentItemsById = [].obs;
  int itemCount = 0;
  var hasMore = true.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;

  RxList<DataObject> listOfTreatment = List<DataObject>.empty(growable: true).obs;
  Rx<TreatmentTypeModel> responseTreatmentType = TreatmentTypeModel().obs;
  List<String> methodsTreatment = [];

  Future<List<DataObject>> getAllTreatmentType(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
    // List<String>? methods,
    List<String>? treatmentType,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseTreatmentType.value = await TreatmentService().getAllTreatmentType(
        page,
        search: search,
        filter: filter,
        // methods: methods,
        treatmentType: treatmentType,
      );
      listOfTreatment.addAll(responseTreatmentType.value.data!.data!);
      currentPage.value++;
      if (page > totalPage.value) {
        hasMore.value = false;
      }
      totalPage.value = responseTreatmentType.value.data!.meta!.pageCount!.toInt();
      for (var i in responseTreatmentType.value.data!.data!) print('datlper ${i.treatmentType}');

      notifyListeners();
    });
    isLoading.value = false;
    return listOfTreatment;
  }

  Future refreshTreatmentType(
    BuildContext context, {
    List<String>? treatmentType,
    String? search,
  }) async {
    currentPage.value = 1;
    hasMore.value = true;
    listOfTreatment.value = [];
    totalPage.value = 1;

    if (treatmentType == null) {
      null;
    } else {
      await getAllTreatmentType(
        context,
        currentPage.value,
        search: search,
        treatmentType: treatmentType,
      );
    }
    // await getAllTreatment(context, currentPage.value);
    notifyListeners();
  }

  Future loadMoreTreatmentType(BuildContext context, ScrollController scrollController) async {
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

  Future<List<Data2>> getRecipeTreatement(
    BuildContext context,
    int page,
  ) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      treatment.value = await TreatmentServices().getRecipeTreatment(
        page,
      );
      treatmentDatas.addAll(treatment.value.data!.data!);
      if (page > totalPage.value || treatmentDatas.length < 10) {
        hasMore.value = false;
      }
      currentPage.value++;
      totalPage.value = treatment.value.data!.meta!.pageCount!.toInt();
      notifyListeners();
    });
    isLoading.value = false;
    return treatmentDatas;
  }

  Future refresh(BuildContext context) async {
    currentPage.value = 1;
    hasMore.value = true;
    treatmentDatas.value = [];
    totalPage.value = 1;

    await getRecipeTreatement(
      context,
      currentPage.value,
    );
    notifyListeners();
  }

  Future loadMore(BuildContext context, ScrollController scrollController) async {
    // scrollController.hasClients;
    print('kesini ga ${currentPage.value}');
    if (scrollController.position.maxScrollExtent == scrollController.position.pixels && hasMore.value) {
      await getRecipeTreatement(
        context,
        currentPage.value,
      );
    }
  }

  getRecipeTreatementById(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await TreatmentServices().getRecipeTreatmentById(id);
      print('resss ' + res['title'].toString());
      // treatmentDatasById.value = res;

      titleController.text = res['title'];
      subtitleController.text = res['subtitle'];
      dataTreatmentItemsById = [];
      for (var a in res['recipe_recomendation_treatment_items']) {
        dataTreatmentItemsById.add(a);
      }
    });
    isLoading.value = false;
  }

  postTreatment(
    BuildContext context,
  ) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "title": titleController.text,
        "subtitle": subtitleController.text,
        "treatment_types": [for (var i in methodsTreatment) i]
        // for (var i in listOfTreatment)
        //   "recipe_recomendation_treatment_items": [
        //     {
        //       "name": i.treatmentType,
        //       "cost": i.cost,
        //       "recovery_time": i.recoveryTime,
        //       "type": i.method,
        //       "clinics": [
        //         {
        //           "clinic_id": i.clinics,
        //         },
        //       ]
        //     }
        //   ]
        // for (var i in dataTreatmentItems) "recipe_recomendation_treatment_items": [i]
      };
      var response = await TreatmentServices().postTreatmentRecommendation(data);

      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }

      for (var i in dataTreatmentItems) {
        stateDoctor.listTreatmentNote.add(i);
      }
      Navigator.pop(
        Get.context!,
      );
      titleController.clear();
      subtitleController.clear();
      methodsTreatment = [];
    });
    isLoading.value = false;
  }

  updateTreatment(
    BuildContext context,
    int id,
  ) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      print('f');
      var data = {
        "title": titleController.text,
        "subtitle": subtitleController.text,
        "recipe_recomendation_treatment_items": [
          for (var i in dataTreatmentItemsById)
            {
              'name': i['name'],
              'cost': i['cost'],
              'recovery_time': i['recovery_time'],
              'type': i['type'],
              'clinics': [
                for (var clinic in i['clinics'])
                  {
                    'clinic_id': clinic['clinic']['id'],
                  },
              ],
            }
        ]
      };
      log('data' + data.toString());
      var response = await TreatmentServices().updateTreatmentRecommendation(data, id);

      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
      Navigator.pop(context, 'refresh');
      titleController.clear();
      subtitleController.clear();
      dataTreatmentItemsById = [];
    });
    isLoading.value = false;
  }

  deleteTreatment(BuildContext context, int id) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      isLoading.value = true;
      var res = await TreatmentServices().deleteTreatmentRecommendation(id);
      log(res);
      getRecipeTreatement(
        context,
        currentPage.value,
      );
      isLoading.value = false;
    });
  }

  getClinick(BuildContext context) async {
    isLoadingSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseClinic.value = await TreatmentServices().getClinic();
      clinics.value = responseClinic.value.data!.data!;
      print('clinics ${clinics}');
    });
    isLoadingSkincare.value = false;
  }
}
