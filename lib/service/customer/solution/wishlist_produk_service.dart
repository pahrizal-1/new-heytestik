import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_produk_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class WishlistProdukService extends ProviderClass {
  WishlistProdukService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<WishlistProdukModel> getWishlist(int page, {String? search}) async {
    var response = await networkingConfig.doGet(
      '/user-wishlist',
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
    return WishlistProdukModel.fromJson(response);
  }

  Future<dynamic> addWishlist(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-wishlist',
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
      '/user-wishlist/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }
}
