import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/local_storage.dart';
import '../../../models/user_activity.dart';

class ProfileService extends ProviderClass {
  ProfileService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> closedAccount() async {
    var response = await networkingConfig.doUpdateFinish(
      '/profile/close-account',
    );

    return response;
  }

  Future<List<UserActivity>> getUserActivity(
    int page, {
    String? search,
    String? filter,
  }) async {
    try {
      var response = await networkingConfig.doGet(
        '/stream/followed',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List).map((e) => UserActivity.fromJson(e)).toList();
    } catch (error) {
      print(error);
      return [];
    }
  }
}
