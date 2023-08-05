import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart';
import 'package:heystetik_mobileapps/models/medicine.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class SolutionService extends ProviderClass {
  SolutionService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SkincareModel> getSkincare() async {
    var response = await networkingConfig.doGet(
      '/solution/skincare?page=1&search=&take=100&order=asc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return SkincareModel.fromJson(response);
  }

  Future<SkincareModel> getSkincareByCategory(String category) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare?page=1&search=&category[]=$category&take=100&order=asc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return SkincareModel.fromJson(response);
  }

  Future<DetailSkincareSolutionModel> detailSkincare(int id) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return DetailSkincareSolutionModel.fromJson(response);
  }

  Future<LookupModel> getLookup() async {
    var response = await networkingConfig.doGet(
      '/lookup?page=1&take=100&order=asc&category[]=SKINCARE_CATEGORY&search=',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return LookupModel.fromJson(response);
  }

  Future<ConcernModel> getConcern() async {
    var response = await networkingConfig.doGet(
      '/concern?page=1&take=100&order=asc&search=',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return ConcernModel.fromJson(response);
  }

  Future<List<MedicineModel>> getMedicine(int page) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/drug',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List).map((e) => MedicineModel.fromJson(e)).toList();
    } catch(error) {
      print(error);
      return [];
    }
  }
}
