import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/auth/login_service.dart';
import 'package:heystetik_mobileapps/service/auth/register_service.dart';
import 'package:heystetik_mobileapps/service/doctor_schedule/doctor_schedule.dart';
import 'package:heystetik_mobileapps/service/slideshow/slideshow_service.dart';

import '../../core/local_storage.dart';

class DoctorScheduleController extends StateClass {
  getDoctorSchedule(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var doctorScheduleResponse = await DoctorScheduleServices().getDoctorScheule();

      return doctorScheduleResponse;
    });
  }
}