import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_model.dart';

class WishlistService extends ProviderClass {
  WishlistService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<WishlistModel> getWishlist() async {
    var response = await networkingConfig.doGet(
      '/user-wishlist?page=1&take=100&order=asc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return WishlistModel.fromJson(response);
  }

  Future<dynamic> addWishlist(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-wishlist',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return response;
  }

  Future<dynamic> deleteWishlist(int id) async {
    var response = await networkingConfig.doDelete(
      '/user-wishlist/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return response;
  }
}
