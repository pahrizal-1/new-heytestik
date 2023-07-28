import 'dart:convert';

import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';

import '../../../models/doctor/reply_chat_model.dart';

class ReplyChatService extends ProviderClass {
  ReplyChatService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future getReplyChat() async {
    var response = await networkingConfig.doGet(
      '/chat/quick-reply',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );
    var jsonResponse = response['data']['data'];

    print('res ' + jsonResponse.toString());

    return jsonResponse;
  }

  Future postReplyChat(dynamic data) async {
    var response = await networkingConfig.doPostByMap(
      '/chat/quick-reply',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      }
    );

    return response;
  }
}
