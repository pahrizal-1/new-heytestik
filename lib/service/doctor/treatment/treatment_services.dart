import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';

class TreatmentServices extends ProviderClass {
  TreatmentServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<TreatmentRecommendationModel> getTreatmentRecommendation() async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/recomendation',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    var jsonResponse = TreatmentRecommendationModel.fromJson(response);
    return jsonResponse;
  }
}