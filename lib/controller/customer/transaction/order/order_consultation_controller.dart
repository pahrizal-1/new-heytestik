// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member

import 'dart:io';
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
import 'package:image_picker/image_picker.dart';
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart'
    as Available;

class OrderConsultationController extends StateClass {
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

  RxBool isGallery = false.obs;
  List<File> imageCondition = [];
  File? initialConditionFrontFace;
  File? initialConditionRightSide;
  File? initialConditionLeftSide;
  File? initialConditionProblemPart;
  RxList<PaymentMethod.Data> getPaymentMethod =
      List<PaymentMethod.Data>.empty().obs;

  RxInt totalPaymentMethod = 0.obs;
  RxInt idPayment = 0.obs;
  RxString paymentMethod = ''.obs;
  RxString paymentType = ''.obs;
  RxString bankImage = ''.obs;
  RxString orderId = ''.obs;
  RxString expireTime = ''.obs;

  RxInt voucherId = 0.obs;
  RxInt discountPercentage = 0.obs;
  RxDouble totalPaidSet = 0.0.obs;
  RxDouble totalPaid = 0.0.obs;
  RxDouble transactionFee = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble totalDiscount = 0.0.obs;
  RxDouble totalFee = 45000.0.obs;
  RxString voucherName = "".obs;

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

    listsAnswer.clear();
    answerSelect = [];
    imageCondition.clear();
    initialConditionFrontFace == null;
    initialConditionRightSide == null;
    initialConditionLeftSide == null;
    initialConditionProblemPart == null;
    getPaymentMethod.value.clear();
    clearPaymentMethod();
    defaultVoucher();
    orderId.value = '';
    expireTime.value = '';
  }

  void voucher(Available.Data2 voucher) {
    voucherName.value = voucher.name ?? "";
    voucherId.value = voucher.id!;
    if (voucher.promotionType == "Discount") {
      if (voucher.discountType == "Fix Amount") {
        print("Fix Amount ${voucher.discountFixAmount!}");
        discountPercentage.value = 0;
        // TOTAL DISKON = discountFixAmount
        totalDiscount.value = voucher.discountFixAmount!.toDouble();
        // LANGSUNG DIKURANG SAJA
        totalPaid.value = totalFee.value - totalDiscount.value;
      } else if (voucher.discountType == "Percentage") {
        print("Percentage ${voucher.discountPercentage!}");
        // PERSENTASE DISKON
        discountPercentage.value = voucher.discountPercentage!;
        // BERAPA TOTAL DISKONNYA
        totalDiscount.value =
            totalFee.value * (voucher.discountPercentage! / 100);
        // KALO discount_percentage_maximum_amount TIDAK NULL
        if (voucher.discountPercentageMaximumAmount != null) {
          // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
          if (totalDiscount.value >
              (voucher.discountPercentageMaximumAmount ?? 0.0)) {
            // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
            totalDiscount.value =
                (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
            // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
            discountPercentage.value =
                ((totalDiscount.value / totalFee.value) * 100).toInt();
          }
        }
        // TOTAL FEE DIKURANG TOTAL DISKON
        totalPaid.value = totalFee.value - totalDiscount.value;
      } else {
        if (voucher.discountFixAmount != null) {
          print("Else Fix Amount ${voucher.discountFixAmount!}");
          discountPercentage.value = 0;
          // TOTAL DISKON = discountFixAmount
          totalDiscount.value = voucher.discountFixAmount!.toDouble();
          // LANGSUNG DIKURANG SAJA
          totalPaid.value = totalFee.value - totalDiscount.value;
        } else if (voucher.discountPercentage != null) {
          print("Else Percentage ${voucher.discountPercentage!}");
          // PERSENTASE DISKON
          discountPercentage.value = voucher.discountPercentage!;
          // BERAPA TOTAL DISKONNYA
          totalDiscount.value =
              totalFee.value * (voucher.discountPercentage! / 100);
          // KALO discount_percentage_maximum_amount TIDAK NULL
          if (voucher.discountPercentageMaximumAmount != null) {
            // CEK TOTAL DISKON APA LEBIH DARI discount_percentage_maximum_amount
            if (totalDiscount.value >
                (voucher.discountPercentageMaximumAmount ?? 0)) {
              // JIKA IYA, MAKA TOTAL DISKON = discount_percentage_maximum_amount
              totalDiscount.value =
                  (voucher.discountPercentageMaximumAmount ?? 0.0).toDouble();
              // RUBAH PERSENTASE DISKON SESUAI discount_percentage_maximum_amount
              discountPercentage.value =
                  ((totalDiscount.value / totalFee.value) * 100).toInt();
            }
          }
          // TOTAL FEE DIKURANG TOTAL DISKON
          totalPaid.value = totalFee.value - totalDiscount.value;
        } else {}
      }
      // UNTUK NYIMPAN totalPaidSet HASIL KALKULASI TANPA transactionFee
      totalPaidSet.value = totalPaid.value;
      // SET NOL LAGI idPayment
      clearPaymentMethod();
      orderId.value = '';
      transactionFee.value = 0;
    }

    if (totalPaid.value <= 0) {
      freeVoucher();
    }
  }

  void defaultVoucher() {
    voucherId.value = 0;
    voucherName.value = '';
    discountPercentage.value = 0;
    transactionFee.value = 0;
    tax.value = 0;
    totalPaidSet.value = totalFee.value;
    totalPaid.value = totalFee.value;
    transactionFee.value = 0;
    totalDiscount.value = 0;
  }

  void clearPaymentMethod() {
    idPayment.value = 0;
    paymentMethod.value = '';
    paymentType.value = '';
    bankImage.value = '';
  }

  void freeVoucher() {
    print("DAPET FREE VOUCHER");
    idPayment.value = 7;
    paymentMethod.value = 'FREE';
    paymentType.value = 'FREE_VOUCHER';
    bankImage.value =
        'payment-method/payment-method-1710954414770-05ccwbos35.png';
  }

  void transactionFeeFunct(PaymentMethod.Data fee) {
    double paid = totalPaidSet.value;
    double transactionFeeFixAmount = 0.0;
    double transactionFeePercentage = 0.0;
    if (paid <= 0) {
      print("NOLLLLLL");
      // KALO TOTAL PAIDNYA KURANG DARI 0.0, MAKA transactionFee juga 0
      transactionFee.value = 0;
      paid = 0;
      freeVoucher();
    } else {
      if (fee.transactionFeeType == "PERCENTAGE_FIX_AMOUNT") {
        transactionFeePercentage = paid * (fee.transactionFeePercentage! / 100);
        print("PERCENTAGE_FIX_AMOUNT $transactionFeePercentage");
        transactionFeeFixAmount = fee.transactionFeeFixAmount!.toDouble();
        print("PERCENTAGE_FIX_AMOUNT $transactionFeeFixAmount");
        transactionFee.value =
            transactionFeePercentage + transactionFeeFixAmount;
        print("PERCENTAGE_FIX_AMOUNT $transactionFee");
        paid = paid + transactionFee.value;
        print("PERCENTAGE_FIX_AMOUNT $paid");
      } else if (fee.transactionFeeType == "FIX_AMOUNT") {
        print("FIX AMOUNT ${fee.transactionFeeFixAmount!.toDouble()}");
        transactionFeeFixAmount = fee.transactionFeeFixAmount!.toDouble();
        print("FIX_AMOUNT $transactionFeeFixAmount");
        transactionFee.value = transactionFeeFixAmount;
        paid = paid + transactionFee.value;
      } else if (fee.transactionFeeType == "PERCENTAGE") {
        print("PERCENTAGE ${fee.transactionFeePercentage}");
        print("PERCENTAGE ${(fee.transactionFeePercentage! / 100)}");
        transactionFeePercentage = paid * (fee.transactionFeePercentage! / 100);
        print("PERCENTAGE $transactionFeePercentage");
        transactionFee.value = transactionFeePercentage;
        paid = paid + transactionFee.value;
      } else {
        print("ELSE");
      }
    }
    totalPaid.value = paid;
    print("HASIL ${totalPaid.value}");
    if (totalPaid.value <= 0) {
      freeVoucher();
    }
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
            element.concern!.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  getInterestConditionById(
      BuildContext context, int id, String condition) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      index.value = 0;
      answerSelect.clear();
      listsAnswer.clear();

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
        showDialog(
          context: context,
          builder: (context) => AlertWidget(
            subtitle: 'Belum ada Pre Assessment pada kondisi $condition',
          ),
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
          'answer_description': TextEditingController(text: '')
        });
      }
    });
    isLoading.value = false;
  }

  Future pickImageFromGalery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) {
      return null;
    }

    print(File(returnedImage.path));
    return File(returnedImage.path);
  }

  initPayment(BuildContext context) async {
    isLoading.value = true;
    var dataUser = await LocalStorage().getDataUser();
    fullName.value = dataUser['fullname'];
    getPaymentMethod.value.clear();
    await getPaymentmethod(context);
    clearPaymentMethod();
    defaultVoucher();
    isLoading.value = false;
  }

  getPaymentmethod(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      Map<String, dynamic> filter = {"method[]": "EWALLET"};
      var res = await TransactionService().paymentMethod(filter: filter);
      getPaymentMethod.value = res.data!;
    });
  }

  order(BuildContext context, int interestConditionsId,
      {required bool isWajah, required Function() doInPost}) async {
    isMinorLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List paramAnswer = [];
      orderId.value = '';
      expireTime.value = '';

      for (int i = 0; i < listsAnswer.length; i++) {
        if (listsAnswer[i]['typeAnswer'] == 'description') {
          if (listsAnswer[i]['interest_condition_question_id'] != 0) {
            paramAnswer.add({
              'interest_condition_answer_id': null,
              'interest_condition_question_id': listsAnswer[i]
                  ['interest_condition_question_id'],
              'answer_description':
                  listsAnswer[i]['answer_description'].text == ''
                      ? '-'
                      : listsAnswer[i]['answer_description'].text
            });
          }
        } else {
          if (listsAnswer[i]['interest_condition_answer_id'] != 0 &&
              listsAnswer[i]['interest_condition_question_id'] != 0) {
            paramAnswer.add({
              'interest_condition_answer_id': listsAnswer[i]
                  ['interest_condition_answer_id'],
              'interest_condition_question_id': listsAnswer[i]
                  ['interest_condition_question_id'],
              'answer_description':
                  listsAnswer[i]['answer_description'].text == ''
                      ? '-'
                      : listsAnswer[i]['answer_description'].text
            });
          }
        }
      }
      List files = [];
      if (isWajah) {
        files = [
          initialConditionFrontFace?.path,
          initialConditionRightSide?.path,
          initialConditionLeftSide?.path,
          initialConditionProblemPart?.path
        ];
      } else {
        for (int i = 0; i < imageCondition.length; i++) {
          files.add(imageCondition[i].path);
        }
      }
      var reqOrder = {
        'interest_condition_id': interestConditionsId.toString(),
        'medical_history_item': paramAnswer,
        'files': files,
        'payment_method': paymentMethod.toString(),
        'payment_type': paymentType.toString(),
        'voucher_id': voucherId.value <= 0 ? null : voucherId.value,
        'total_fee': totalFee.value.round(),
        'total_discount': totalDiscount.value.round(),
        'tax': tax.value.round(),
        'transaction_fee': transactionFee.value.round(),
        'total_paid': totalPaid.value.round(),
      };

      print('req order $reqOrder');

      var res = await TransactionService().orderConsultation(reqOrder);
      print('res order $res');
      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
      // JIKA SUKSES SET ORDER ID
      orderId.value = res.data!.transaction!.id.toString();
      if (paymentType.value != "FREE_VOUCHER") {
        // JIKA SUKSES DAN BUKAN FREE_VOUCHER  SET expireTime
        expireTime.value = res.data!.payment!.expiryTime.toString();
      }
      doInPost();
      clearVariabel();
    });
    isMinorLoading.value = false;
  }
}
