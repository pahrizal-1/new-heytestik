import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class LoginService extends ProviderClass {
  LoginService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> login(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/auth/login',
      data: data,
    );

    return response;
  }

  Future<dynamic> loginWithGoogle(dynamic data) async {}
}
