import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/models/interest_conditions_by_id_model.dart'
    as ById;
import 'package:heystetik_mobileapps/models/interest_conditions_model.dart';
import 'package:heystetik_mobileapps/service/interest_conditions/interest_conditions_service.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

class InterestConditionsController {
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  Rx<InterestConditionsModel> data = InterestConditionsModel(data: []).obs;
  RxList<Data> filterData = List<Data>.empty().obs;

  ById.InterestConditionByIdModel? detail;
  List<ById.InterestConditionsQuestion> question = [];
  RxMap answer = {
    'interest_conditions_id': 0,
    'userId': 0,
    'lists': [
      {
        'interest_conditions_answer_id': 0,
        'interest_conditions_question_id': 0,
        'answer_description': ''
      },
    ],
  }.obs;

  RxList answerSelect1 = [].obs;
  RxInt index = 0.obs;
  RxInt percent = 1.obs;

  getInterestConditions(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await InterestConditionsService().getInterestConditions();
      filterData.value = data.value.data!;
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = data.value.data!
        .where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  getInterestConditionById(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      index.value = 0;
      answerSelect1.clear();
      detail = await InterestConditionsService().getInterestConditionById(id);
      question = detail!.data!.interestConditionsQuestion!;
      if (question.isEmpty) {
        AlertWidget(
          subtitle: 'Tidak ada pertanyaan',
        );
        Get.back();
      }
      var data =
          jsonDecode(jsonEncode(detail!.data!.interestConditionsQuestion!));

      for (int i = 0; i < data.length; i++) {
        answerSelect1.add({
          'idQuestion': '',
          'question': '',
          'idAnswer': '',
          'answer': '',
          'isIconSelected': false,
        });
      }

      await Future.delayed(const Duration(seconds: 1));
    });
    isLoading.value = false;
  }
}
