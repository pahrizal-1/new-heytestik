import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class ProfileService extends ProviderClass {
  ProfileService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> closedAccount() async {
    var response = await networkingConfig.doUpdateFinish(
      '/profile/close-account',
    );

    return response;
  }
}
