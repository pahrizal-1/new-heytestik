import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/cart_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class CartService extends ProviderClass {
  CartService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<CartModel> getCart() async {
    var response = await networkingConfig.doGet(
      '/user-cart?page=1&take=100&order=asc&search=',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return CartModel.fromJson(response);
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
