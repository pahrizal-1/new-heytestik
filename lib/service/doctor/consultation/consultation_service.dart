import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart';
import 'package:heystetik_mobileapps/models/doctor/find_schedule_model.dart';
import 'package:heystetik_mobileapps/models/doctor/current_schedule_model.dart';

class ConsultationDoctorScheduleServices extends ProviderClass {
  ConsultationDoctorScheduleServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<CurrentDoctorScheduleModel> getCurrentDoctorSchedule() async {
    var response = await networkingConfig.doGet(
      '/consultation/current-schedule',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return CurrentDoctorScheduleModel.fromJson(response);
  }

  Future<FindDoctorScheduleModel> getDoctorSchedule(
      int currentScheduleId, String startTime, String endTime) async {
    var response = await networkingConfig.doGet(
      '/consultation/doctor-schedule/$currentScheduleId?start_time=$startTime&end_time=$endTime',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return FindDoctorScheduleModel.fromJson(response);
  }

  Future<RecentChatModel> recentChat() async {
    var response = await networkingConfig.doGet(
      '/chat/recent',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return RecentChatModel.fromJson(response);
  }

  Future<dynamic> getDetailConstultaion(int id) async {
    var response = await networkingConfig.doGet(
      '/consultation/${id}/detail',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    var jsonResponse = response['data'];

    return jsonResponse;
  }

  Future<dynamic> postFinishReview(int id) async {
    var response = await networkingConfig.doUpdateFinish(
      '/consultation/${id}/finish-review',
    );

    return response;
  }

  Future<dynamic> postDoctorNote(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/consultation/doctor-note',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return response;
  }
}
