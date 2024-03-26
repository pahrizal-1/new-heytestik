import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/doctor/doctor_schedule_model.dart';
import 'package:intl/intl.dart';

import '../../../core/error_config.dart';
import '../../../models/doctor/doctor_week_schedule_model.dart';
import '../../../service/doctor/schedule/doctor_schedule_service.dart';

class ScheduleDoctorController extends StateClass {
  var doctorScheduleService = DoctorScheduleService();
  Rx<ChangeScheduleDoctorModel> scheduleModel = ChangeScheduleDoctorModel().obs;
  Rx<DoctorWeekSchedulerModel> scheduleWeekModel = DoctorWeekSchedulerModel().obs;
  List<TextEditingController> scheduleDateController = [];
  RxInt jam = 0.obs;
  RxInt menit = 0.obs;
  RxInt jamStatusDoktor = 0.obs;
  RxInt menitStatusDoktor = 0.obs;
  RxString formatJamResting = ''.obs;
  RxString formatMenitResting = ''.obs;
  RxString formatResting = ''.obs;
  RxString activeSchedule = ''.obs;
  RxString restingStartDate = ''.obs;
  RxString restingEndDate = ''.obs;
  RxString startPeriod = ''.obs;
  RxString endPeriod = ''.obs;
  int countScheduleWeek = 1;
  List<TextEditingController> mulaiScheduleWeek = [
    // TextEditingController(),
  ];
  List<TextEditingController> selesaiScheduleWeek = [
    // TextEditingController(),
  ];
  List changeMulaiJamMinute = [
    // {
    //   'start_time': 0,
    //   'end_time': 0,
    // }
  ];
  List changeSelesaiJamMinute = [
    // {
    //   'start_time': 0,
    //   'end_time': 0,
    // }
  ];

  // Schedule
  RxList startDateSchedule = [].obs;

  void parseAndProcessTimes() {
    String timesString = "[10:00-12:00,14:00-16:00]";
    // Remove the brackets at the beginning and the end.
    String cleanString = timesString.substring(1, timesString.length - 1);
    // Split the string into the time intervals.
    List<String> intervals = cleanString.split(',');
    for (String interval in intervals) {
      // Split each interval into start and end times.
      List<String> times = interval.split('-');
      String startTime = times[0];
      String endTime = times[1];
      // Now you have start and end times individually and can use them as needed.
      print('Start time: $startTime, End time: $endTime');
    }
  }

  Future getStatusChangeSchedule(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await doctorScheduleService.getChangeScheduleDoctor();
      scheduleModel.value = response;

      if (scheduleModel.value.data?.status == 'ACTIVE') {
        List<String> scheduleStrings = [];
        response.data?.todayConsultationSchedule!.doctorScheduleTimes!.forEach((e) {
          String startTimeFormatted = DateFormat('HH:mm').format(
            DateTime.parse('${e.startTime}').toUtc().add(
                  Duration(hours: 7, minutes: 00),
                ),
          );

          String endTimeFormatted = DateFormat('HH:mm').format(
            DateTime.parse('${e.endTime}').toUtc().add(
                  Duration(hours: 7, minutes: 00),
                ),
          );

          // Add the formatted string to the list.
          scheduleStrings.add('$startTimeFormatted - $endTimeFormatted');
        });
        activeSchedule.value = scheduleStrings.join(',');
        print('day ${activeSchedule.value}');
      }

      if (scheduleModel.value.data?.status == 'ONLEAVE') {
        restingStartDate.value = ConvertDate.defaultDate(response.data?.startDate != null ? response.data!.startDate.toString() : '');
        restingEndDate.value = ConvertDate.defaultDate(response.data?.endDate != null ? response.data!.endDate.toString() : '');
      }

      print('GetUserInfoDataDompet : ${scheduleModel.value.data!.toJson()}');
    });
    isLoading.value = false;
    notifyListeners();
  }

  Future getListStatusSchedule(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await doctorScheduleService.getListSchedule();
      scheduleWeekModel.value = response;
      for (var i = 0; i < scheduleWeekModel.value.data!.length; i++) {
        print('GetUserInfoDataDompet : ${scheduleWeekModel.value.data![i].day}');
        startDateSchedule.addAll(scheduleWeekModel.value.data![i].doctorScheduleTimes ?? []);
        print('testingg bro ${startDateSchedule.toJson()}');
        for (var a = 0; a < scheduleWeekModel.value.data![i].doctorScheduleTimes!.length; a++) {
          print('GetUserSchedule : ${scheduleWeekModel.value.data![i].doctorScheduleTimes![a].startTime}');
        }
      }
    });
    isLoading.value = false;
  }

  postStatusScheduleDoctor(
    BuildContext context,
    int? status, {
    String? duration,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (status == 0) {
        var data = {
          "status": "ACTIVE",
        };
        var loginResponse = await doctorScheduleService.postStatusScheduleDoctor(data);
        Get.back();

        if (loginResponse['success'] != true && loginResponse['message'] != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: loginResponse['message'],
          );
        }
      } else if (status == 1) {
        var data = {
          "status": "RESTING",
          "duration": "$duration" // RESTING
        };
        var loginResponse = await doctorScheduleService.postStatusScheduleDoctor(data);
        Get.back();

        if (loginResponse['success'] != true && loginResponse['message'] != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: loginResponse['message'],
          );
        }
      } else {
        var data = {
          "status": "ONLEAVE",
          "start_date": startPeriod.value, // ONLEAVE
          "end_date": endPeriod.value, // ONLEAVE
        };
        var loginResponse = await doctorScheduleService.postStatusScheduleDoctor(data);
        Get.back();

        if (loginResponse['success'] != true && loginResponse['message'] != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: loginResponse['message'],
          );
        }
      }
    });
    isLoading.value = false;
  }

  postStatusWeekScheduleDoctor(
    BuildContext context,
    int length,
    int dayNumber,
    bool isActive,
  ) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "schedules": [
          // {
          //   "day_number": 1,
          //   "is_active": false,
          // },
          {
            "day_number": dayNumber,
            "is_active": isActive,
            if (isActive == true)
              "schedule_times": [
                for (var i = 0; i < length; i++)
                  {
                    "start_time": mulaiScheduleWeek[i].text,
                    "end_time": selesaiScheduleWeek[i].text,
                  }
              ]
          },
          // {"day_number": 3, "is_active": false},
          // {"day_number": 4, "is_active": false},
          // {"day_number": 5, "is_active": false},
          // {"day_number": 6, "is_active": false},
          // {"day_number": 0, "is_active": false}
        ]
      };
      print('data ${data}');

      var loginResponse = await doctorScheduleService.postStatusWeekScheduleDoctor(data);
      Get.back();

      if (loginResponse['success'] != true && loginResponse['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: loginResponse['message'],
        );
      }
    });
    isLoading.value = false;
  }
}
