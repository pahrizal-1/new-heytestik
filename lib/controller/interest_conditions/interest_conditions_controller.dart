import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/models/customer/interest_conditions_by_id_model.dart'
    as ById;
import 'package:heystetik_mobileapps/models/customer/interest_conditions_model.dart';
import 'package:heystetik_mobileapps/service/interest_conditions/interest_conditions_service.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

class InterestConditionsController {
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  Rx<InterestConditionsModel> data = InterestConditionsModel(data: []).obs;
  RxList<Data> filterData = List<Data>.empty().obs;

  ById.InterestConditionByIdModel? detail;
  List<ById.InterestConditionsQuestion> question = [];

  RxInt index = 0.obs;
  TextEditingController essayController = TextEditingController();
  var answerData = {'interest_conditions_id': 0, 'userId': 0, 'lists': []};
  RxList lists = [].obs;
  RxList answerSelect = [
    {
      'idQuestion': '',
      'question': '',
      'idAnswer': '',
      'answer': '',
      'typeAnswer': '',
      'isIconSelected': false,
    }
  ].obs;

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
      answerSelect.clear();
      answerData.clear();
      essayController.clear();
      detail = await InterestConditionsService().getInterestConditionById(id);
      question = detail!.data!.interestConditionsQuestion!;
      if (question.isEmpty) {
        AlertWidget(
          subtitle: 'Tidak ada pertanyaan',
        );
        Get.back();
      }

      for (int i = 0;
          i < detail!.data!.interestConditionsQuestion!.length;
          i++) {
        answerSelect.add({
          'idQuestion': '',
          'question': '',
          'idAnswer': '',
          'answer': '',
          'typeAnswer': detail!.data!.interestConditionsQuestion![i].typeAnswer
              .toString(),
          'isIconSelected': false,
        });
        lists.add({
          'interest_conditions_answer_id': 0,
          'interest_conditions_question_id': 0,
          'answer_description': '-'
        });
      }
    });
    isLoading.value = false;
  }

  saveInterestConditionCustomer(BuildContext context, int interestConditionsId,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var userId = await LocalStorage().getUserID();
      answerData['interest_conditions_id'] = interestConditionsId;
      answerData['userId'] = userId!.toInt();
      answerData['lists'] = lists;

      print('answerData $answerData');

      var res = await InterestConditionsService()
          .saveInterestConditionCustomer(answerData);
      print('res $res');

      doInPost();
      answerData.clear();
      essayController.clear();
    });
    isLoading.value = false;
  }
}
