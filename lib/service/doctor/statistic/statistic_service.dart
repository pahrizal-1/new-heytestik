import 'dart:convert';

import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class StatisticService extends ProviderClass {
  StatisticService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future getStatistic(String startPeriod, String endPeriod) async {
    var response = await networkingConfig.doGet(
      '/profile/doctor/statistic?period_start=$startPeriod&period_end=$endPeriod',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = response['data'];

    return jsonResponse;
  }
}
