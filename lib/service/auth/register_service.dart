import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class RegisterService extends ProviderClass {
  RegisterService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> register(dynamic data) async {
    var response = await networkingConfig.doPost(
      "/auth/register/info-personal",
      data: data,
      // checkLogin: false,
    );

    return response;
  }

  Future<dynamic> registerPhone(dynamic data) async {
    var response = await networkingConfig.doPost(
      "/auth/register/phone",
      data: data,
      // checkLogin: false,
    );

    return response;
  }

  Future<dynamic> phoneVerify(dynamic data) async {
    var response = await networkingConfig.doPost(
      "/auth/register/verify",
      data: data,
      // checkLogin: false,
    );

    return response;
  }
}
