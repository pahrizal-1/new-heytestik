import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/intiate_chat_model.dart';

class ConsultationService extends ProviderClass {
  ConsultationService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<InitiateChatModel> initiateChat(String orderId) async {
    var response = await networkingConfig.doPost(
      '/consultation/initiate/$orderId',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return InitiateChatModel.fromJson(response);
  }
}
