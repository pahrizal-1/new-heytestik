import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/doctor/consultation_schedule_model.dart';

class ConsultationDoctorScheduleServices extends ProviderClass {
  ConsultationDoctorScheduleServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<ConsultationDoctorScheduleModel> getDoctorSchedule() async {
    var response = await networkingConfig.doGet(
      '/consultation/doctor-schedule',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return ConsultationDoctorScheduleModel.fromJson(response);
  }
}
