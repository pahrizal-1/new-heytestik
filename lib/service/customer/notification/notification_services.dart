import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';

class NotificationCustomerServices extends ProviderClass {
  NotificationCustomerServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<NotificationCustomerModel> listNotification(int page,
      {int pageCount = 10}) async {
    try {
      var response = await networkingConfig.doGet(
        '/notification',
        params: {
          "page": page,
          "take": pageCount,
          "order": "asc",
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
        },
      );

      return NotificationCustomerModel.fromJson(response);
    } catch (error) {
      print(error);
      return NotificationCustomerModel();
    }
  }
}
