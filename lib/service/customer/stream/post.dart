import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

import '../../../core/local_storage.dart';

class PostServices extends ProviderClass {
  PostServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> postPolling(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/stream',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return response;
  }
}