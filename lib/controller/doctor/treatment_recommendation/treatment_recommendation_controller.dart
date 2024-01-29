import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';

import '../../../models/doctor/treatment_recommendation_doctor/clinics_model.dart';
import '../../../models/doctor/treatment_recommendation_doctor/treatment_recommendation_model.dart';
import '../../../service/doctor/treatment/treatment_services.dart';
import '../consultation/consultation_controller.dart';

class TreatmentRecommendationController extends StateClass {
  TextEditingController searchController = TextEditingController();
  final DoctorConsultationController stateDoctor =
      Get.put(DoctorConsultationController());

  Rx<TreatmentReccommendationModel> treatment =
      TreatmentReccommendationModel().obs;
  Rx<Data2> treatmentById = Data2().obs;
  List dataTreatment = [].obs;
  RxBool isLoadingSkincare = false.obs;
  List<TextEditingController> notesController = [];
  Rx<ClinicForDoctorModel> responseClinic = ClinicForDoctorModel().obs;
  RxList<DataClinic> clinics = List<DataClinic>.empty().obs;

  RxList<Data2> treatmentDatas = List<Data2>.empty().obs;
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
  int page = 1;

  getRecipeTreatement(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      treatment.value = await TreatmentServices().getRecipeTreatment();
      treatmentDatas.value = treatment.value.data!.data!;
    });
    isLoading.value = false;
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
        for (var i in dataTreatmentItems)
          "recipe_recomendation_treatment_items": [i]
      };
      var response =
          await TreatmentServices().postTreatmentRecommendation(data);

      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }

      for (var i in dataTreatmentItems) {
        stateDoctor.listTreatmentNote.add(i);
      }
      Navigator.pop(context, 'refresh');
      titleController.clear();
      subtitleController.clear();
      dataTreatmentItems = [];
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
      var response =
          await TreatmentServices().updateTreatmentRecommendation(data, id);

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
      getRecipeTreatement(context);
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
