import 'package:dio/dio.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/my_journey_by_id_model.dart';
import 'package:heystetik_mobileapps/models/customer/my_journey_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class MyJourneysService extends ProviderClass {
  MyJourneysService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<MyJourneyModel> getJourney(int page) async {
    var response = await networkingConfig.doGet(
      '/my-journey?page=$page&take=1000',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return MyJourneyModel.fromJson(response);
  }

  Future<dynamic> saveJourney(dynamic data) async {
    FormData formData = FormData.fromMap({
      "concern_id": 1,
      "initial_condition_front_face":
          await MultipartFile.fromFile(data['initial_condition_front_face']),
      "initial_condition_right_side":
          await MultipartFile.fromFile(data['initial_condition_right_side']),
      "initial_condition_left_side":
          await MultipartFile.fromFile(data['initial_condition_left_side']),
      "initial_condition_problem_part":
          await MultipartFile.fromFile(data['initial_condition_problem_part']),
    });

    var response = await networkingConfig.doPost(
      '/my-journey',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'Content-type': 'multipart/form-data',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }

  Future<MyJourneyByIdModel> findJourney(int id) async {
    var response = await networkingConfig.doGet(
      'my-journey/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return MyJourneyByIdModel.fromJson(response);
  }

  Future<dynamic> deleteJourney(int id) async {
    var response = await networkingConfig.doDelete(
      'my-journey/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }

  Future<dynamic> afterCondition(int id, dynamic data) async {
    FormData formData = FormData.fromMap({
      "after_condition_front_face":
          await MultipartFile.fromFile(data['after_condition_front_face']),
      "after_condition_right_side":
          await MultipartFile.fromFile(data['after_condition_right_side']),
      "after_condition_left_side":
          await MultipartFile.fromFile(data['after_condition_left_side']),
      "after_condition_problem_part":
          await MultipartFile.fromFile(data['after_condition_problem_part']),
    });

    var response = await networkingConfig.doPost(
      '/my-journey/$id',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'Content-type': 'multipart/form-data',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }
}
