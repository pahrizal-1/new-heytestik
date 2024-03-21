import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class VoucherService extends ProviderClass {
  VoucherService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<AvailableVoucherModel> getAvailableVoucherModel(
      {Map<String, dynamic>? filter}) async {
    Map<String, dynamic> param = {};
    if (filter != null) {
      param.addAll(filter);
    }
    print("param $param");
    var response = await networkingConfig.doGet(
      '/voucher/available',
      params: param,
      headers: {
        'User-Agent': await userAgent(),
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
      },
    );
    return AvailableVoucherModel.fromJson(response);
  }

  Future<Data2> findVoucherByCodeModel(String code) async {
    print("CODE $code");
    var response = await networkingConfig.doGet(
      '/voucher/$code/code',
      headers: {
        'User-Agent': await userAgent(),
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
      },
    );
    print("response $response");
    return Data2.fromJson(response['data']);
  }
}
