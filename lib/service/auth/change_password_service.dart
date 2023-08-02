import '../../core/provider_class.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';

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
}
