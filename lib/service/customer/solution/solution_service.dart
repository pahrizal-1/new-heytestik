import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_solution_model.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_solution_model.dart';

class SolutionService extends ProviderClass {
  SolutionService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SkincareSolutionModel> getSkincare() async {
    var response = await networkingConfig.doGet(
      '/solution/skincare?page=1&search=&take=100&order=asc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return SkincareSolutionModel.fromJson(response);
  }

  Future<DetailSkincareSolutionModel> detailSkincare(int id) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return DetailSkincareSolutionModel.fromJson(response);
  }

  Future<LookupSolutionModel> getLookup() async {
    var response = await networkingConfig.doGet(
      '/lookup?page=1&take=100&order=asc&category[]=SKINCARE_CATEGORY&search=',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return LookupSolutionModel.fromJson(response);
  }
}
