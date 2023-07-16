import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class SnipTipsService extends ProviderClass {
  SnipTipsService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> getSnipTips() async {
    var response = await networkingConfig.doGet(
      '/snips_tips',
    );

    return response;
  }
}
