import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/interest_conditions_by_id_model.dart';
import 'package:heystetik_mobileapps/models/customer/interest_conditions_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class InterestConditionsService extends ProviderClass {
  InterestConditionsService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<InterestConditionsModel> getInterestConditions() async {
    var response = await networkingConfig.doGet(
      '/interest_conditions',
      headers: {
        'User-Agent': await userAgent(),
      },
    );
    return InterestConditionsModel.fromJson(response);
  }

  Future<dynamic> getInterestConditionById(int id) async {
    var response = await networkingConfig.doGet(
      '/interest_conditions/$id',
      headers: {
        'User-Agent': await userAgent(),
      },
    );
    return InterestConditionByIdModel.fromJson(response);
  }

  Future<dynamic> saveInterestConditionCustomer(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/interest_condition_customer',
      data: data,
      headers: {
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }
}
