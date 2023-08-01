import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

class RecentChatService extends ProviderClass {
  RecentChatService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future getRecentChat() async {
    var response = await networkingConfig.doGet(
      '/chat/recent',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    var jsonResponse = response['data'];

    return jsonResponse;
  }
}

class QuickReplyChat extends ProviderClass {
  QuickReplyChat()
      : super(
          networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API),
        );

  Future getQuickReply() async {
    var response = await networkingConfig.doGet(
      '/chat/quick-reply',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    var jsonResponse = response['data']['data'];

    return jsonResponse;
  }
}

class ChatOpeningService extends ProviderClass {
  ChatOpeningService()
      : super(
          networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API),
        );

  Future postChatOpening(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/chat/opening',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    var jsonResponse = response;

    return jsonResponse;
  }
}
