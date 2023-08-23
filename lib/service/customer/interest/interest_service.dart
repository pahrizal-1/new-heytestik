import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class InterestService extends ProviderClass {
  InterestService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> infoPersonal(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/registration/step/personal-info',
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
      '/registration/step/interest-face-corrective-skin-goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> bodyCorrective(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/registration/step/interest-body-corrective-skin-goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> augmentation(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/registration/step/interest-augmentation-skin-goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> pastTreatment(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/registration/step/interest-history-treatment-skin-goals',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> budgets(dynamic data) async {
    try {
      var response = await networkingConfig.doPost(
        '/registration/step/interest-budget-skin-goals',
        data: data,
        headers: {
          'User-Agent': await userAgent(),
        },
      );

      return response;
    } catch (error) {
      print(error.toString());
    }
  }
}
