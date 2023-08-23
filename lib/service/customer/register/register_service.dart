import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class RegisterService extends ProviderClass {
  RegisterService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> register(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/auth/register/info-personal',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> registerPhone(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/verification/send',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> phoneVerify(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/registration/step/phone-number',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> emailVerify(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/auth/register/verify',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> resendCode(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/auth/register/resend-code',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> registerEmail(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/verification/send',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }
}
