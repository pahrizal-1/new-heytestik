import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/doctor/skincare_recommendations_model.dart';

class SkincareRecommendationService extends ProviderClass {
  SkincareRecommendationService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SkincareRecommendationModel> getSkincareRecommendation() async {
    var response = await networkingConfig.doGet(
      '/recipe/recomendation/skincare',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    return SkincareRecommendationModel.fromJson(response);
  }
}
