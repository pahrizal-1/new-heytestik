import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart';
import 'package:heystetik_mobileapps/models/doctor/find_schedule_model.dart';
import 'package:heystetik_mobileapps/models/doctor/current_schedule_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../models/doctor/find_doctor_note_model.dart';

class ConsultationDoctorScheduleServices extends ProviderClass {
  ConsultationDoctorScheduleServices() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<CurrentDoctorScheduleModel> getCurrentDoctorSchedule() async {
    var response = await networkingConfig.doGet(
      '/consultation/current-schedule',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return CurrentDoctorScheduleModel.fromJson(response);
  }

  Future<FindDoctorScheduleModel> getDoctorSchedule(int currentScheduleId, String startTime, String endTime) async {
    var response = await networkingConfig.doGet(
      '/consultation/doctor-schedule/$currentScheduleId',
      params: {
        'start_time': startTime,
        'end_time': endTime,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('hasil get doctor ${response}');

    return FindDoctorScheduleModel.fromJson(response);
  }

  Future<RecentChatModel> recentChat() async {
    var response = await networkingConfig.doGet(
      '/chat/recent',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return RecentChatModel.fromJson(response);
  }

  Future<dynamic> getDetailConstultaion(int id) async {
    var response = await networkingConfig.doGet(
      '/consultation/${id}/detail',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    var jsonResponse = response['data'];

    return jsonResponse;
  }

  Future<FindDoctorNoteModel> getDoctorNote(int id) async {
    var response = await networkingConfig.doGet(
      '/consultation/$id/doctor-note',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    var jsonResponse = response;
    print('json ' + jsonResponse.toString());

    return FindDoctorNoteModel.fromJson(response);
  }

  Future<dynamic> postApprove(int id) async {
    var response = await networkingConfig.doUpdateFinish(
      '/consultation/doctor-schedule/${id}/approve',
    );

    return response;
  }

  Future<dynamic> postFinishReview(int id) async {
    var response = await networkingConfig.doUpdateFinish(
      '/consultation/${id}/finish-review',
    );

    return response;
  }

  Future<dynamic> postFinishConsultation(int id) async {
    var response = await networkingConfig.doUpdateFinish(
      '/consultation/${id}/finish',
    );

    return response;
  }

  Future<dynamic> postDoctorNote(dynamic data, int id) async {
    var response = await networkingConfig.doPost(
      '/consultation/$id/doctor-note',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('res ${response}');

    return response;
  }
}
