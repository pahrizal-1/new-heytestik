// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/my_journey_model.dart';
import 'package:heystetik_mobileapps/service/customer/my_journey/my_journey_service.dart';

class MyJourneyController extends StateClass {
  RxString fullName = '-'.obs;
  Rx<MyJourneyModel> response = MyJourneyModel().obs;
  RxList<Data2> dataJourney = List<Data2>.empty(growable: true).obs;

  File? initialConditionFrontFace;
  File? initialConditionRightSide;
  File? initialConditionLeftSide;
  File? initialConditionProblemPart;

  Future<List<Data2>> getJourney(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      response.value = await MyJourneysService().getJourney(page);
      dataJourney.value = response.value.data!.data!;
      print(dataJourney.length);
    });
    isLoading.value = false;
    return dataJourney;
  }

  Future saveJourney(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "concern_id": 1,
        "initial_condition_front_face": initialConditionFrontFace?.path,
        "initial_condition_right_side": initialConditionRightSide?.path,
        "initial_condition_left_side": initialConditionLeftSide?.path,
        "initial_condition_problem_part": initialConditionProblemPart?.path
      };
      var res = await MyJourneysService().saveJourney(data);
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      doInPost();
    });
    isLoading.value = false;
  }
}
