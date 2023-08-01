import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class InterestService extends ProviderClass {
  InterestService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> infoPersonal(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/register/info-personal',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> beautyProfile(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/interest_beauty_profile',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> faceCorrective(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/interest_face_corrective_skin_goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> bodyCorrective(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/interest_body_corrective_skin_goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> pastTreatment(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/interest_history_treatment_skin_goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> budgets(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/interest_budget_skin_goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }
}
