// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/waiting_review_model.dart';
import 'package:heystetik_mobileapps/service/customer/review/review_service.dart';

class ReviewController extends StateClass {
  Rx<WaitingReviewModel> responseReview = WaitingReviewModel().obs;
  RxList<Data2> dataReview = List<Data2>.empty(growable: true).obs;

  RxInt starRating = 0.obs;
  RxString ratingTitle = "".obs;
  TextEditingController review = TextEditingController();

  Future<List<Data2>> waitingReview(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseReview.value = await ReviewService().waitingReview(page);
      dataReview.value = responseReview.value.data!.data!;
      print("dataReview ${dataReview.value.length}");
    });
    isLoading.value = false;

    return dataReview;
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
      review.clear();
    });
    isLoading.value = false;
  }
}
