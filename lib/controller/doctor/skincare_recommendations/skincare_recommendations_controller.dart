import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/doctor/skincare_recommendations_model.dart';
import 'package:heystetik_mobileapps/service/doctor/skincare_recommendations/skincare_recommendations_service.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart'
    as Skincare;

import '../../../service/customer/solution/solution_service.dart';

class SkincareRecommendationController extends StateClass {
  TextEditingController searchController = TextEditingController();

  Rx<SkincareRecommendationModel> skincare = SkincareRecommendationModel().obs;
  RxList<Data2> filterData = List<Data2>.empty().obs;
  List<Skincare.Data2> solutionSkincare = [];
  List dataSkincare = [].obs;
  List dataSkincareById = [].obs;
  RxBool isLoadingSkincare = false.obs;
  List<TextEditingController> notesController = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  int itemCount = 0;

  getSkincareRecommendation(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      skincare.value =
          await SkincareRecommendationService().getSkincareRecommendation();
      filterData.value = skincare.value.data!.data!;
    });
    isLoading.value = false;
  }

  getSkincareRecomtById(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SkincareRecommendationService()
          .getSkincareRecommendationById(id);
      print('resss ' + res['title'].toString());
      // treatmentDatasById.value = res;

      titleController.text = res['title'];
      subtitleController.text = res['subtitle'];
      dataSkincareById = [];
      notesController.clear();
      for (var a in res['recipe_recomendation_skincare_items']) {
        notesController.add(TextEditingController(text: a['notes']));
        dataSkincareById.add(a);
      }
      for (var i in dataSkincareById) {
        itemCount = i['qty'];
      }
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = skincare.value.data!.data!
        .where((element) =>
            element.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  getSkincare(BuildContext context) async {
    isLoadingSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getAllSkincare(1);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      solutionSkincare = res.data!.data!;
    });
    isLoadingSkincare.value = false;
  }

  postSkincare(
    BuildContext context,
  ) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "title": titleController.text,
        "subtitle": subtitleController.text,
        "recipe_recomendation_skincare_items": [
          for (var i = 0; i < dataSkincare.length; i++)
            {
              "skincare_id": dataSkincare[i]['id'],
              "notes": notesController[i].text,
              "qty": itemCount
            }
        ]
      };
      var response = await SkincareRecommendationService()
          .postSkincareRecommendation(data);

      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
      Get.back();
      Get.back();
      titleController.clear();
      subtitleController.clear();
      dataSkincare = [];
      notesController = [];
      itemCount = 0;
    });
    isLoading.value = false;
  }

  updateSkincare(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "title": titleController.text,
        "subtitle": subtitleController.text,
        "recipe_recomendation_skincare_items": [
          for (var i = 0; i < dataSkincareById.length; i++)
            {
              "skincare_id": dataSkincareById[i]['skincare']['id'],
              "notes": notesController[i].text,
              "qty": itemCount
            }
        ]
      };
      var response = await SkincareRecommendationService()
          .updateSkincareRecommendation(data, id);

      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
      Navigator.pop(context, 'refresh');
      titleController.clear();
      subtitleController.clear();
      dataSkincareById = [];
      notesController = [];
      itemCount = 0;
    });
    isLoading.value = false;
  }

  deleteTreatment(BuildContext context, int id) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      isLoading.value = true;
      var res = await SkincareRecommendationService()
          .deleteSkincareRecommendation(id);
      print(res);
      getSkincareRecommendation(context);
      isLoading.value = false;
    });
  }
}
