import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/snips_tips_model.dart';

class SnipTipsService extends ProviderClass {
  SnipTipsService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SnipsTipsModel> getSnipsTips() async {
    var response = await networkingConfig.doGet(
      '/snips_tips',
    );

    return SnipsTipsModel.fromJson(response);
  }
}
