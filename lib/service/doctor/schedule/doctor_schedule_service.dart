import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/global.dart';
import '../../../core/local_storage.dart';
import '../../../core/networking_config.dart';
import '../../../models/doctor/doctor_schedule_model.dart';
import '../../../models/doctor/doctor_week_schedule_model.dart';

class DoctorScheduleService extends ProviderClass {
  DoctorScheduleService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<ChangeScheduleDoctorModel> getChangeScheduleDoctor() async {
    var response = await networkingConfig.doGet(
      '/profile/doctor/schedule/status',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = ChangeScheduleDoctorModel.fromJson(response);
    return jsonResponse;
  }

  Future<DoctorWeekSchedulerModel> getListSchedule() async {
    var response = await networkingConfig.doGet(
      '/profile/doctor/schedule',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = DoctorWeekSchedulerModel.fromJson(response);
    return jsonResponse;
  }

  Future<dynamic> postStatusScheduleDoctor(dynamic data) async {
    var response = await networkingConfig.doUpdate(
      '/profile/doctor/schedule/status',
      data,
    );

    return response;
  }

  Future<dynamic> postStatusWeekScheduleDoctor(dynamic data) async {
    var response = await networkingConfig.doUpdate(
      '/profile/doctor/schedule',
      data,
    );

    return response;
  }
}
