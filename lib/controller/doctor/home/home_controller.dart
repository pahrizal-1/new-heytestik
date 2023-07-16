// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/doctor/consultation_schedule_model.dart';
import 'package:heystetik_mobileapps/service/doctor/consultation_schedule/consultation_schedule_service.dart';

class DoctorHomeController extends StateClass {
  RxString fullName = ''.obs;
  Rx<ConsultationDoctorScheduleModel?> data =
      ConsultationDoctorScheduleModel.fromJson({}).obs;

  init(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      fullName.value = await LocalStorage().getFullName();
    });
    isLoading.value = false;
  }

  getDoctorSchedule(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value =
          await ConsultationDoctorScheduleServices().getDoctorSchedule();
    });
  }
}
