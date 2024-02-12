import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/doctor/skincare_recommendations_model.dart';
import 'package:heystetik_mobileapps/service/doctor/skincare_recommendations/skincare_recommendations_service.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart' as Skincare;

import '../../../service/customer/solution/solution_service.dart';

class SkincareRecommendationController extends StateClass {
  TextEditingController searchController = TextEditingController();

  Rx<SkincareRecommendationModel> skincare = SkincareRecommendationModel().obs;
  RxList<Data2> filterData = List<Data2>.empty(growable: true).obs;
  RxList<Skincare.Data2> solutionSkincare = List<Skincare.Data2>.empty(growable: true).obs;
  List dataSkincare = [].obs;
  List dataSkincareById = [].obs;
  RxBool isLoadingSkincare = false.obs;
  List<TextEditingController> notesController = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  List<int>? itemCount = [1];
  RxInt currentPage = 1.obs;
  RxInt totalPage = 1.obs;
  bool getFirstPagination = false;
  bool getLastPagination = false;
  var hasMore = true.obs;

  Future<List<Data2>> getSkincareRecommendation(
    BuildContext context,
    int pages, {
    String? search,
  }) async {
    try {
      isLoading.value = true;
      var res = await SkincareRecommendationService().getSkincareRecommendation(
        pages,
        search,
        10,
      );
      filterData.addAll(res.data!.data!);
      if (pages > totalPage.value || filterData.length < 10) {
        hasMore.value = false;
      }
      currentPage.value++;
      totalPage.value = res.data!.meta!.pageCount!.toInt();
      notifyListeners();
      print('datas ${res.data!.meta!.pageCount}');
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
    isLoading.value = false;
    return filterData;
  }

  getSkincareRecomtById(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await SkincareRecommendationService().getSkincareRecommendationById(id);
      print('resss ' + res['title'].toString());
      // treatmentDatasById.value = res;

      titleController.text = res['title'];
      subtitleController.text = res['subtitle'];
      dataSkincareById = [];
      notesController.clear();
      itemCount = [];
      for (var a in res['recipe_recomendation_skincare_items']) {
        notesController.add(TextEditingController(text: a['notes']));
        dataSkincareById.add(a);
        itemCount?.add(a['qty']);
      }
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.addAll(
      skincare.value.data!.data!.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList(),
    );
  }

  getSkincare(
    BuildContext context,
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    isLoadingSkincare.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      Skincare.SkincareModel res = await SolutionService().getAllSkincare(
        page,
        search: search,
        filter: filter,
      );

      if (page > totalPage.value) {
        hasMore.value = false;
      }
      solutionSkincare.addAll(res.data!.data!);
      print('skin sol ${solutionSkincare}');
      currentPage.value++;
      totalPage.value = res.data!.meta!.pageCount!.toInt();
      notifyListeners();
    });
    isLoadingSkincare.value = false;
  }

  Future refresh(BuildContext context) async {
    currentPage.value = 1;
    hasMore.value = true;
    solutionSkincare.value = [];
    totalPage.value = 1;

    await getSkincare(context, currentPage.value);
    notifyListeners();
  }

  Future refreshRecommendation(BuildContext context) async {
    currentPage.value = 1;
    hasMore.value = true;
    filterData.value = [];
    totalPage.value = 1;

    await getSkincareRecommendation(
      context,
      currentPage.value,
    );
    notifyListeners();
  }

  Future loadMore(BuildContext context, ScrollController scrollController) async {
    // scrollController.hasClients;
    if (scrollController.position.maxScrollExtent == scrollController.position.pixels && hasMore.value) {
      await getSkincare(
        context,
        currentPage.value,
      );
    }
  }

  Future loadMoreRecommendation(BuildContext context, ScrollController scrollController) async {
    // scrollController.hasClients;
    if (scrollController.position.maxScrollExtent == scrollController.position.pixels && hasMore.value) {
      await getSkincareRecommendation(
        context,
        currentPage.value,
      );
    }
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
              "qty": itemCount![i],
            }
        ]
      };
      // print('payload ${data}');
      var response = await SkincareRecommendationService().postSkincareRecommendation(data);

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
      itemCount = [];
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
          for (var i = 0; i < dataSkincareById.length; i++) {"skincare_id": dataSkincareById[i]['skincare']['id'], "notes": notesController[i].text, "qty": itemCount}
        ]
      };
      var response = await SkincareRecommendationService().updateSkincareRecommendation(data, id);

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
      itemCount = [];
    });
    isLoading.value = false;
  }

  deleteTreatment(BuildContext context, int id) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      isLoading.value = true;
      var res = await SkincareRecommendationService().deleteSkincareRecommendation(id);
      print(res);
      getSkincareRecommendation(
        context,
        1,
      );
      isLoading.value = false;
    });
  }
}
