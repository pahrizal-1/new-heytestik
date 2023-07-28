// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/interest_conditions_by_id_model.dart'
    as ById;
import 'package:heystetik_mobileapps/models/customer/interest_conditions_model.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart'
    as PaymentMethod;
import 'package:heystetik_mobileapps/service/customer/interest_conditions/interest_conditions_service.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

class OrderController extends StateClass {
  RxString fullName = ''.obs;

  TextEditingController searchController = TextEditingController();
  Rx<InterestConditionsModel> data = InterestConditionsModel(data: []).obs;
  RxList<Data> filterData = List<Data>.empty().obs;

  ById.InterestConditionByIdModel? detail;
  List<ById.InterestConditionsQuestion> listQuestion = [];
  RxString title = 'Pertanyaan Awal'.obs;
  RxString subtitle = 'Data Umum'.obs;
  RxString question = ''.obs;
  RxString typeAnswer = ''.obs;
  RxInt totalQuestion = 0.obs;
  RxList totalAnswer = [].obs;
  RxInt index = 0.obs;
  TextEditingController essayController = TextEditingController();

  List listsAnswer = [];
  List answerSelect = [
    {
      'idQuestion': '',
      'question': '',
      'idAnswer': '',
      'answer': '',
      'typeAnswer': '',
      'isIconSelected': false,
    }
  ];

  List<String> listImageUser = [];

  Rx<PaymentMethod.PaymentMethodModel?> getPaymentMethod =
      PaymentMethod.PaymentMethodModel.fromJson({}).obs;
  RxInt totalPaymentMethod = 0.obs;
  RxInt idPayment = 0.obs;
  RxString paymentMethod = ''.obs;
  RxString paymentType = ''.obs;
  RxString orderId = ''.obs;
  RxString bank = ''.obs;
  RxString expireTime = ''.obs;

  clearVariabel() {
    fullName.value = '';
    searchController.clear();
    data;
    filterData.clear();
    detail = null;
    title.value = 'Pertanyaan Awal';
    subtitle.value = 'Data Umum';
    question.value = '';
    typeAnswer.value = '';
    totalQuestion.value = 0;
    totalAnswer.clear();
    listQuestion.clear();
    index.value = 0;
    essayController.clear();
    listsAnswer.clear();
    answerSelect = [];

    listImageUser.clear();
    getPaymentMethod.value = null;
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    orderId.value = '';
    bank.value = '';
    expireTime.value = '';
  }

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
      listsAnswer.clear();
      essayController.clear();
      title.value = 'Pertanyaan Awal';
      subtitle.value = 'Data Umum';
      question.value = '';
      typeAnswer.value = '';
      totalQuestion.value = 0;
      totalAnswer.clear();

      detail = await InterestConditionsService().getInterestConditionById(id);
      listQuestion = detail!.data!.interestConditionsQuestion!;

      // JIKA TIDAK ADA PERTANYAN KOSONG
      if (detail!.data!.interestConditionsQuestion!.isEmpty) {
        Get.back();
        AlertWidget(
          subtitle: 'Tidak ada pertanyaan',
        );

        return;
      }
      // SET FIRST question
      question.value = listQuestion[index.value].name.toString();
      // SET FIRST typeAnswer
      typeAnswer.value = listQuestion[index.value].typeAnswer.toString();
      // SET TOTAL question
      totalQuestion.value =
          listQuestion[index.value].interestConditionsAnswer!.length;

      for (int i = 0;
          i < detail!.data!.interestConditionsQuestion!.length;
          i++) {
        // SET TOTAL answer
        totalAnswer.add(detail?.data?.interestConditionsQuestion?[i]
            .interestConditionsAnswer?.length);
        answerSelect.add({
          'idQuestion': '',
          'question': '',
          'idAnswer': '',
          'answer': '',
          'typeAnswer': detail!.data!.interestConditionsQuestion![i].typeAnswer
              .toString(),
          'isIconSelected': false,
        });
        listsAnswer.add({
          'typeAnswer': detail!.data!.interestConditionsQuestion![i].typeAnswer
              .toString(),
          'interest_condition_answer_id': 0,
          'interest_condition_question_id': 0,
          'answer_description': '-'
        });
      }
    });
    isLoading.value = false;
  }

  initPayment(BuildContext context) async {
    isLoading.value = true;
    fullName.value = await LocalStorage().getFullName();
    getPaymentMethod.value == null;
    await getPaymentmethod(context);
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    isLoading.value = false;
  }

  getPaymentmethod(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      getPaymentMethod.value = await TransactionService().paymentMethod();
      totalPaymentMethod.value = getPaymentMethod.value!.data!.length;
    });
  }

  order(BuildContext context, int interestConditionsId,
      {required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List paramAnswer = [];
      orderId.value = '';
      bank.value = '';
      expireTime.value = '';

      print('listsAnswer ${listsAnswer.length}');
      for (int i = 0; i < listsAnswer.length; i++) {
        if (listsAnswer[i]['interest_condition_answer_id'] != 0 &&
            listsAnswer[i]['interest_condition_question_id'] != 0) {
          paramAnswer.add({
            'interest_condition_answer_id': listsAnswer[i]
                ['interest_condition_answer_id'],
            'interest_condition_question_id': listsAnswer[i]
                ['interest_condition_question_id'],
            'answer_description': listsAnswer[i]['answer_description']
          });
        }
      }
      print('paramAnswer ${paramAnswer.length}');
      print('paramAnswer $paramAnswer');
      var reqOrder = {
        'interest_condition_id': interestConditionsId.toString(),
        'medical_history_item': paramAnswer,
        'files': listImageUser,
        'payment_method': paymentMethod.toString(),
        'payment_type': paymentType.toString()
      };
      print('listImageUser $listImageUser');
      print('reqOrder $reqOrder');
      print('paymentType $paymentType');
      print('paymentMethod $paymentMethod');
      print('listsAnswer $listsAnswer');

      var res = await TransactionService().order(reqOrder);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      // JIKA SUKSES SET ORDER ID
      orderId.value = res.data!.transaction!.id.toString();
      // JIKA SUKSES SET bank
      bank.value = res.data!.payment!.vaNumbers![0].bank.toString();
      // JIKA SUKSES SET expireTime
      expireTime.value = res.data!.payment!.expiryTime.toString();
      doInPost();
      clearVariabel();
    });
    isMinorLoading.value = false;
  }
}
