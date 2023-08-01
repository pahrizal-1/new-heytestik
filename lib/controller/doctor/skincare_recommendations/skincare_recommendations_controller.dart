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

  onChangeFilterText(String value) {
    filterData.value = skincare.value.data!.data!
        .where((element) =>
            element.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  getSkincare(BuildContext context) async {
    isLoadingSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SolutionService().getSkincare();

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
}
