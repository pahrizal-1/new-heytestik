// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/current_time.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/doctor/find_schedule_model.dart';
import 'package:heystetik_mobileapps/models/doctor/current_schedule_model.dart';
import 'package:heystetik_mobileapps/service/doctor/consultation_schedule/consultation_schedule_service.dart';

class DoctorHomeController extends StateClass {
  RxString fullName = ''.obs;

  Rx<CurrentDoctorScheduleModel?> currentSchedule =
      CurrentDoctorScheduleModel.fromJson({}).obs;
  RxString today = ''.obs;
  RxInt currentScheduleId = 0.obs;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxString startTime1 = ''.obs;
  RxString startTime2 = ''.obs;
  RxString endTime1 = ''.obs;
  RxString endTime2 = ''.obs;
  RxBool isFirstSchedule = false.obs;
  RxBool isSecondSchedule = false.obs;

  Rx<FindDoctorScheduleModel?> findSchedul =
      FindDoctorScheduleModel.fromJson({}).obs;

  init(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      fullName.value = await LocalStorage().getFullName();
    });
    isLoading.value = false;
  }

  Future<CurrentDoctorScheduleModel?> getCurrentDoctorSchedule(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      currentSchedule.value =
          await ConsultationDoctorScheduleServices().getCurrentDoctorSchedule();
      if (currentSchedule.value!.success!) {
        today.value = currentSchedule.value!.data!.date ?? '-';
        currentScheduleId.value = currentSchedule.value!.data!.id ?? 0;
        startTime.value = currentSchedule.value!.data!.firstSchedule ?? '-';
        endTime.value = currentSchedule.value!.data!.lastSchdule ?? '-';

        DateTime now = DateTime.now();
        print('now $now');

        String dateStr = now.toString().substring(0, 10);
        print('tanggal $dateStr');

        DateTime first1 = now;
        DateTime first2 = now;
        DateTime second1 = now;
        DateTime second2 = now;

        // CEK APAKAH JADWAL PERTAMA ADA ATAU TIDAK
        if (startTime.value.isNotEmpty ||
            startTime.value != '-' ||
            startTime.value != '') {
          startTime1.value = CurrenctTime.getFirstTime(
            currentSchedule.value!.data!.firstSchedule.toString(),
          );
          print('startTime1 ${startTime1.value}');

          startTime2.value = CurrenctTime.getLastTime(
            currentSchedule.value!.data!.firstSchedule.toString(),
          );
          print('startTime2 ${startTime2.value}');

          first1 = DateTime.parse('$dateStr ${startTime1.value}');
          first2 = DateTime.parse('$dateStr ${startTime2.value}');
        }

        // CEK APAKAH JADWAL KEDUA ADA ATAU TIDAK
        if (endTime.value.isNotEmpty ||
            endTime.value != '-' ||
            endTime.value != '') {
          endTime1.value = CurrenctTime.getFirstTime(
            currentSchedule.value!.data!.lastSchdule.toString(),
          );
          print('endTime1 ${startTime2.value}');

          endTime2.value = CurrenctTime.getLastTime(
            currentSchedule.value!.data!.lastSchdule.toString(),
          );
          print('endTime2 ${startTime2.value}');

          second1 = DateTime.parse('$dateStr ${endTime1.value}');
          second2 = DateTime.parse('$dateStr ${endTime2.value}');
        }

        print('first1 $first1');
        print('first2 $first2');
        print('second1 $second1');
        print('second2 $second2');

        if (now.isAfter(first1) && now.isBefore(first2)) {
          print('jadwal pertama');
          isFirstSchedule.value = true;
          isSecondSchedule.value = false;
        } else if (now.isAfter(second1) && now.isBefore(second2)) {
          print('jadwal kedua');
          isFirstSchedule.value = false;
          isSecondSchedule.value = true;
        } else {
          print('salah');
          isFirstSchedule.value = false;
          isSecondSchedule.value = false;
        }
      }
    });

    return currentSchedule.value;
  }

  Future<FindDoctorScheduleModel?> getDoctorSchedule(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      findSchedul.value = await ConsultationDoctorScheduleServices()
          .getDoctorSchedule(currentScheduleId.toInt(), startTime.toString(),
              endTime.toString());
    });

    return findSchedul.value;
  }
}
