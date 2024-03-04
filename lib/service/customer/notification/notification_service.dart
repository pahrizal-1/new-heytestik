import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class NotificationService extends ProviderClass {
  NotificationService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<NotificationCustomerModel> listNotification(int page,
      {int pageCount = 10}) async {
    var response = await networkingConfig.doGet(
      '/notification',
      params: {
        "page": page,
        "take": pageCount,
        "order": "desc",
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return NotificationCustomerModel.fromJson(response);
  }

  Future listNotificationDoctor(int page, {int pageCount = 10}) async {
    var response = await networkingConfig.doGet(
      '/notification',
      params: {
        "page": page,
        "take": pageCount,
        "order": "desc",
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response['data']['data'];
  }
}
