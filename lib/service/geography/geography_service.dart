import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class GeographyService extends ProviderClass {
  GeographyService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> getProvince() async {
    var response = await networkingConfig.doGet(
      "/geography/provinces?order=ASC&page=50&take=10",
    );


    return response;
  }

  Future<dynamic> getCity(int provinceID) async {
    var response = await networkingConfig.doGet(
      "/geography/kota-kabupatens?order=ASC&page=1&take=50&provinceId=$provinceID",
    );

    return response;
  }
}
