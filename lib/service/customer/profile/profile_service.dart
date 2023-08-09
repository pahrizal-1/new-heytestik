import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/local_storage.dart';
import '../../../models/stream_home.dart';
import '../../../models/user_activity.dart';

class ProfileService extends ProviderClass {
  ProfileService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> closedAccount() async {
    var response = await networkingConfig.doUpdateFinish(
      '/profile/close-account',
    );

    return response;
  }

  Future<List<UserActivity>> getUserActivityReview(int page) async {
    try {
      var response = await networkingConfig.doGet(
        '/user-profile/customer/reviews',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print("INI RESPONSE");
      print(response);

      return (response['data']['data'] as List).map((e) => UserActivity.fromJson(e)).toList();
    } catch (error) {
      print(error);
      return [];
    }
  }

  Future<List<StreamHomeModel>> getUserActivityPost(
    int page, {
    String? search,
    String? postType,
  }) async {
    try {
      var response = await networkingConfig.doGet(
        '/user-profile/customer/posts',
        params: {
          "page": page,
          "take": 10,
          "post_type": postType,
          "search": search,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List).map((e) => StreamHomeModel.fromJson(e)).toList();
    } catch (error) {
      print(error);
      return [];
    }
  }
}
