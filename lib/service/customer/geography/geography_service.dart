import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class GeographyService extends ProviderClass {
  GeographyService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> getProvince() async {
    var response = await networkingConfig.doGet(
      '/geography/provinces?order=asc&page=50&take=10',
      headers: {
        'User-Agent': await userAgent(),
      },
    );
    return response['data'];
  }

  Future<dynamic> getCity(int provinceID) async {
    var response = await networkingConfig.doGet(
      '/geography/kota-kabupatens?order=asc&page=1&take=50&provinceId=$provinceID',
      headers: {
        'User-Agent': await userAgent(),
      },
    );
    return response['data'];
  }
}
