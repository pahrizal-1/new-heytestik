import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../models/doctor/user_balance_model.dart';

class UserBalanceService extends ProviderClass {
  UserBalanceService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<Data> getUserBalance() async {
    var response = await networkingConfig.doGet(
      '/user-balance',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = Data.fromJson(response['data']);
    return jsonResponse;
  }

  Future getWithDraw() async {
    var response = await networkingConfig.doGet(
      '/user-balance/withdrawal',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = response['data']['data'];
    return jsonResponse;
  }

  Future saveBank(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-balance/withdrawal',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }
}
