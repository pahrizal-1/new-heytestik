import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/doctor/skincare_recommendations_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class SkincareRecommendationService extends ProviderClass {
  SkincareRecommendationService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SkincareRecommendationModel> getSkincareRecommendation(int? page, String? search, int? limit) async {
    try {
      var response = await networkingConfig.doGet(
        '/recipe/recomendation/skincare',
        params: {
          'page': page,
          'take': limit,
          'order': 'asc',
          'search': search,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      print('res ${response}');
      return SkincareRecommendationModel.fromJson(response);
    } catch (e) {
      print('err ${e}');
      return SkincareRecommendationModel();
    }
  }

  Future getSkincareRecommendationById(int id) async {
    var response = await networkingConfig.doGet(
      '/recipe/recomendation/skincare/${id}',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response['data'];
  }

  Future<dynamic> postSkincareRecommendation(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/recipe/recomendation/skincare',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }

  Future<dynamic> updateSkincareRecommendation(dynamic data, int id) async {
    var response = await networkingConfig.doPatch(
      '/recipe/recomendation/skincare/${id}',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }

  Future<dynamic> deleteSkincareRecommendation(int id) async {
    var response = await networkingConfig.doDelete(
      '/recipe/recomendation/skincare/${id}',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }
}
