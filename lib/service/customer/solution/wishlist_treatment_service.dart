import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_treatment_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class WishlistTreatmentService extends ProviderClass {
  WishlistTreatmentService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<WishlistTreatmentModel> getWishlist(int page, {String? search}) async {
    var response = await networkingConfig.doGet(
      '/user-wishlist-treatment',
      params: {
        "page": page,
        "take": 10,
        "order": "desc",
        "search": search,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return WishlistTreatmentModel.fromJson(response);
  }

  Future<dynamic> addWishlist(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-wishlist-treatment',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> deleteWishlist(int id) async {
    var response = await networkingConfig.doDelete(
      '/user-wishlist-treatment/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }
}
