import '../../core/provider_class.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class ChangePasswordService extends ProviderClass {
  ChangePasswordService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> changePassword(dynamic data) async {
    var response = await networkingConfig.doUpdate(
      '/auth/change-password',
      data,
    );

    return response;
  }

  Future<dynamic> verifyOTP(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/verification/verify',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> resetPassword(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/auth/forgot-password',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }
}
