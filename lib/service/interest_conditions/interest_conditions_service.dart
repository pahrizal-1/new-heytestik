import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/interest_conditions_by_id_model.dart';
import 'package:heystetik_mobileapps/models/interest_conditions_model.dart';

class InterestConditionsService extends ProviderClass {
  InterestConditionsService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  // Future<dynamic> registerPhone(dynamic data) async {
  //   var response = await networkingConfig.doPost(
  //     '/interest_conditions',
  //     data: data,
  //   );
  //   return response;
  // }

  Future<InterestConditionsModel> getInterestConditions() async {
    var response = await networkingConfig.doGet('/interest_conditions');
    return InterestConditionsModel.fromJson(response);
  }

  Future<dynamic> getInterestConditionById(int id) async {
    var response = await networkingConfig.doGet('/interest_conditions/$id');
    return InterestConditionByIdModel.fromJson(response);
  }
}
