import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_model.dart';

class TreatmentService extends ProviderClass {
  TreatmentService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<WishlistModel> getTreatment() async {
    var response = await networkingConfig.doGet(
      '/solution/treatment?page=1&take=100',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return WishlistModel.fromJson(response);
  }
}
