import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class LoginService extends ProviderClass {
  LoginService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> login(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/auth/login',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> loginWithGoogle(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/auth/google/login-by-token',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }
}
