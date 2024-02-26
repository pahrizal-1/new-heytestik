import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/snips_tips_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class SnipTipsService extends ProviderClass {
  SnipTipsService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SnipsTipsModel> getSnipsTips() async {
    var response = await networkingConfig.doGet(
      '/snips_tips',
      headers: {
        'User-Agent': await userAgent(),
      },
    );

    return SnipsTipsModel.fromJson(response);
  }
}
