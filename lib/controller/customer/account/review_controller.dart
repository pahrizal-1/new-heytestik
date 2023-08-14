// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/waiting_review_model.dart'
    as Waiting;
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart'
    as Finished;
import 'package:heystetik_mobileapps/service/customer/review/review_service.dart';

class ReviewController extends StateClass {
  Rx<Waiting.WaitingReviewModel> responseWaiting =
      Waiting.WaitingReviewModel().obs;
  RxList<Waiting.Data2> dataWaiting =
      List<Waiting.Data2>.empty(growable: true).obs;

  Rx<Finished.FinishedReviewModel> responseFinished =
      Finished.FinishedReviewModel().obs;
  RxList<Finished.Data2> dataFinished =
      List<Finished.Data2>.empty(growable: true).obs;

  // Consul
  RxInt starRating = 0.obs;
  RxString ratingTitle = "".obs;
  TextEditingController review = TextEditingController();

  // Treatment
  RxInt careRating = 0.obs;
  RxInt serviceRating = 0.obs;
  RxInt managementRating = 0.obs;
  RxDouble average = 0.0.obs;
  List listImage = [];

  // Prod
  RxInt effectivenessRating = 0.obs;
  RxInt textureRating = 0.obs;
  RxInt packagingRating = 0.obs;
  RxString usageDuration = "".obs;
  RxString wouldRecommend = "".obs;
  RxString wouldRepurchase = "".obs;
  List beforeConditions = [];
  List afterConditions = [];

  List description = [
    "Pretty Good!",
    "Highly Worth to try!",
    "Highly Recommended!",
    "Execellent Product!",
    "Ultimate holy-grail!"
  ];

  clearForm() {
    // Consul
    starRating.value = 0;
    ratingTitle.value = "";
    review.clear();

    // Treatment
    careRating.value = 0;
    serviceRating.value = 0;
    managementRating.value = 0;
    average.value = 0.0;
    listImage.clear();

    // Prod
    effectivenessRating.value = 0;
    textureRating.value = 0;
    packagingRating.value = 0;
    usageDuration.value = "";
    wouldRecommend.value = "";
    wouldRepurchase.value = "";
    beforeConditions.clear();
    afterConditions.clear();
  }

  Future<List<Waiting.Data2>> waitingReview(
      BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseWaiting.value = await ReviewService().waitingReview(page);
      dataWaiting.value = responseWaiting.value.data!.data!;
      print("dataWaiting ${dataWaiting.value.length}");
    });
    isLoading.value = false;

    return dataWaiting;
  }

  Future<List<Finished.Data2>> finishedReview(
      BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseFinished.value = await ReviewService().finishedReview(page);
      dataFinished.value = responseFinished.value.data!.data!;
      print("dataFinished ${dataFinished.value.length}");
    });
    isLoading.value = false;

    return dataFinished;
  }

  reviewConsultation(BuildContext context, String transactionConsultationId,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (review.text.length >= 150) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Ulasan maksimal 150 karakter',
        );
      }
      if (starRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      var data = {
        "transaction_consultation_id": transactionConsultationId,
        "rating": starRating.value,
        "review": review.text
      };

      print("data $data");
      // return;
      var res = await ReviewService().reviewConsultation(data);
      print("res $res");
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      doInPost();
      clearForm();
    });
    isLoading.value = false;
  }

  ratingAvaregeTreatment(int index, String title) {
    if (title == 'care') {
      careRating.value = index + 1;
    }
    if (title == 'service') {
      serviceRating.value = index + 1;
    }
    if (title == 'management') {
      managementRating.value = index + 1;
    }
    print("careRating ${careRating.value}");
    print("serviceRating ${serviceRating.value}");
    print("managementRating ${managementRating.value}");
    double result =
        (careRating.value + serviceRating.value + managementRating.value) / 3;

    print("result $result");
    average.value = result;
    print("average ${average.value}");
  }

  reviewTreatment(BuildContext context, String transactionTreatmentId,
      String transactionTreatmentItemIid,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (review.text.length >= 150) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Ulasan maksimal 150 karakter',
        );
      }
      if (careRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      if (serviceRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      if (managementRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      var data = {
        "transaction_treatment_id": transactionTreatmentId,
        "transaction_treatment_item_id": transactionTreatmentItemIid,
        "review": review.text,
        "care_rating": careRating.value,
        "service_rating": serviceRating.value,
        "management_rating": managementRating.value,
        "files": listImage,
      };

      print("data $data");

      var res = await ReviewService().reviewTreatment(data);
      print("res $res");
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      doInPost();
      clearForm();
    });
    isLoading.value = false;
  }

  ratingAvaregeProduct(int index, String title) {
    if (title == 'effectiveness') {
      effectivenessRating.value = index + 1;
    }
    if (title == 'texture') {
      textureRating.value = index + 1;
    }
    if (title == 'packaging') {
      packagingRating.value = index + 1;
    }
    print("effectivenessRating ${effectivenessRating.value}");
    print("textureRating ${textureRating.value}");
    print("packagingRating ${packagingRating.value}");
    double result = (effectivenessRating.value +
            textureRating.value +
            packagingRating.value) /
        3;

    print("result $result");
    average.value = result;
    print("average ${average.value.toString()}");
  }

  reviewProduct(BuildContext context, String transactionProductId,
      String transactionProductItemId,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (review.text.length >= 150) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Ulasan maksimal 150 karakter',
        );
      }
      if (effectivenessRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      if (textureRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      if (packagingRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      var data = {
        "transaction_product_id": transactionProductId,
        "transaction_product_item_id": transactionProductItemId,
        "review": review.text,
        "effectiveness_rating": effectivenessRating.value,
        "texture_rating": textureRating.value,
        "packaging_rating": packagingRating.value,
        "usage_duration": usageDuration.value,
        "would_recommend": wouldRecommend.value,
        "would_repurchase": wouldRepurchase.value,
        "before_conditions": beforeConditions,
        "after_conditions": afterConditions
      };

      print("data $data");
      // return;
      var res = await ReviewService().reviewProduct(data);
      print("res $res");
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      doInPost();
      clearForm();
    });
    isLoading.value = false;
  }
}
