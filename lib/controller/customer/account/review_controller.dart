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

  RxInt starRating = 0.obs;
  RxString ratingTitle = "".obs;
  TextEditingController review = TextEditingController();

  RxInt careRating = 0.obs;
  RxInt serviceRating = 0.obs;
  RxInt managementRating = 0.obs;
  List<String> listImage = [];

  List description = [
    "Pretty Good!",
    "Highly Worth to try!",
    "Highly Recommended!",
    "Execellent Product!",
    "Ultimate holy-grail!"
  ];

  clearForm() {
    starRating.value = 0;
    ratingTitle.value = "";
    review.clear();

    careRating.value = 0;
    serviceRating.value = 0;
    managementRating.value = 0;
    listImage.clear();
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
      print(starRating.value < 1);
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

  // ini belum reviewTreatment
  reviewTreatment(BuildContext context, String transactionTreatmentId,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      print(starRating.value < 1);
      if (starRating.value < 1) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Rating minimal satu',
        );
      }
      var data = {
        "transaction_treatment_id": transactionTreatmentId,
        "transaction_treatment_item_id": starRating.value,
        "review": review.text,
        "care_rating": careRating.value,
        "service_rating": serviceRating.value,
        "management_rating": managementRating.value,
        "files": listImage,
      };

      print("data $data");
      // return;
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
}
