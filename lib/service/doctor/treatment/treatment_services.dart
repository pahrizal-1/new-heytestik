import 'dart:convert';

import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../models/doctor/treatment_recommendation_doctor/clinics_model.dart';
import '../../../models/doctor/treatment_recommendation_doctor/treatment_recommendation_model.dart';
import '../../../models/clinic.dart';

class TreatmentServices extends ProviderClass {
  TreatmentServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<TreatmentRecommendationModel> getTreatmentRecommendation() async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/recomendation',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = TreatmentRecommendationModel.fromJson(response);
    return jsonResponse;
  }

  Future<TreatmentReccommendationModel> getRecipeTreatment() async {
    var response = await networkingConfig.doGet(
      '/recipe/recomendation/treatment',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return TreatmentReccommendationModel.fromJson(response);
  }

  Future getRecipeTreatmentById(int id) async {
    var response = await networkingConfig.doGet(
      '/recipe/recomendation/treatment/${id}',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    print('response' + response['data'].toString());
    // var jsonResponse = json.decode(response['data']);
    // print('jsonresponse' + jsonResponse.toString());
    return response['data'];
  }

  Future<dynamic> postTreatmentRecommendation(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/recipe/recomendation/treatment',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return response;
  }

  Future<dynamic> updateTreatmentRecommendation(dynamic data, int id) async {
    var response = await networkingConfig.doPatch(
      '/recipe/recomendation/treatment/${id}',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return response;
  }

  Future<ClinicForDoctorModel> getClinic() async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/clinic',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
        },
      );

      print(response);

      return ClinicForDoctorModel.fromJson(response);
    } catch (error) {
      print('error na ' + error.toString());
      return ClinicForDoctorModel();
    }
  }
}
