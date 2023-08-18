import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/cart_model.dart';
import 'package:heystetik_mobileapps/models/customer/recently_product_viewed_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class CartService extends ProviderClass {
  CartService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<CartModel> getCart(int page, {String? search}) async {
    var response = await networkingConfig.doGet(
      '/user-cart',
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

    return CartModel.fromJson(response);
  }

  Future<RecentlyProductViewedModel> recentlyProductViewed(int page) async {
    var response = await networkingConfig.doGet(
      '/solution/recently-viewed',
      params: {
        "page": page,
        "take": 10,
        "order": "desc",
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return RecentlyProductViewedModel.fromJson(response);
  }

  Future<dynamic> addCart(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/user-cart',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> deleteCart(int id) async {
    var response = await networkingConfig.doDelete(
      '/user-cart/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> deleteManyCart(dynamic data) async {
    var response = await networkingConfig.doDelete(
      '/user-cart',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }
}
