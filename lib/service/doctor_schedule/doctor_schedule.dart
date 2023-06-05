import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class DoctorScheduleServices extends ProviderClass {
  DoctorScheduleServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> getDoctorScheule() async {
    var response = await networkingConfig.doGet(
      "/doctor-customer-schedules",
    );

    return response;
  }
}
