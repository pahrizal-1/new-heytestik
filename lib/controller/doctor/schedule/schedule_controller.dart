import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/doctor/doctor_schedule/doctor_schedule.dart';

class DoctorScheduleController extends StateClass {
  getDoctorSchedule(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var doctorScheduleResponse =
          await DoctorScheduleServices().getDoctorScheule();

      return doctorScheduleResponse;
    });
  }
}
