import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/wishlist_model.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';

class TreatmentService extends ProviderClass {
  TreatmentService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<List<TreatmentRecommendationModel>> getTreatment() async {
    var response = await networkingConfig.doGet(
      '/solution/treatment?page=1&take=100',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return (response.data['data'] as List).map((e) => TreatmentRecommendationModel.fromJson(e)).toList();
  }
}
