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

  Future<List<Data2>> waitingReview(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        responseReview.value = await ReviewService().waitingReview(page);
        dataReview.value = responseReview.value.data!.data!;
        print("dataReview ${dataReview.value.length}");
      } catch (e) {
        print("error wa $e");
      }
    });
    isLoading.value = false;

    return dataReview;
  }
}
