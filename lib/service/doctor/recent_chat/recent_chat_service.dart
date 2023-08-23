import 'dart:convert';

import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../models/doctor/recent_chat_model.dart';

class RecentChatService extends ProviderClass {
  RecentChatService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future getRecentChat() async {
    var response = await networkingConfig.doGet(
      '/chat/recent',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
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
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = response['data']['data'];

    return jsonResponse;
  }
}

class FetchMessageByRoom extends ProviderClass {
  FetchMessageByRoom()
      : super(
          networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API),
        );

  Future getFetchMessage(String roomCode,int take) async {
    var response = await networkingConfig.doGet(
      '/chat/message/${roomCode}?take=${take}&search&order=asc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = response;
    // var jsonResponse = response['data']['data'];

    return jsonResponse;
  }
}

class LastChatService extends ProviderClass {
  LastChatService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future getLastChat() async {
    var response = await networkingConfig.doGet(
      '/chat/recent',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = response['data'];

    return jsonResponse;
  }
}
