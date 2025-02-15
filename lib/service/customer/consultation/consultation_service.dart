import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/intiate_chat_model.dart';
import 'package:heystetik_mobileapps/models/chat/recent_chat_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class ConsultationService extends ProviderClass {
  ConsultationService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<InitiateChatModel> initiateChat(String orderId) async {
    var response = await networkingConfig.doPost(
      '/consultation/initiate/$orderId',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return InitiateChatModel.fromJson(response);
  }

  Future<RecentChatModel> recentChat({String? search}) async {
    var response = await networkingConfig.doGet(
      '/chat/recent',
      params: {
        "search": search,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return RecentChatModel.fromJson(response);
  }
}
