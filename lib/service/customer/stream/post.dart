import 'package:dio/dio.dart';
// import 'package:get/get.dart' hide FormData;
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/stream_post.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/local_storage.dart';
import '../../../models/stream_home.dart';

class PostServices extends ProviderClass {
  PostServices()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> postPolling(StreamPostModel data) async {
    FormData formData = FormData.fromMap({
      "content": data.content,
      "type": data.type,
      "hashtags[]": data.hashtags,
      "stream_poll[end_time]": data.endTime,
      "stream_poll[options][]": data.options,
      "visibility": "PUBLIC"
    });

    var response = await networkingConfig.doPost(
      '/stream',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<dynamic> postGeneral(StreamPostModel data) async {
    FormData formData = FormData.fromMap({
      "content": data.content,
      "type": data.type,
      "hashtags[]": data.hashtags,
      "visibility": "PUBLIC"
    });

    var response = await networkingConfig.doPost(
      '/stream',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<List<StreamHomeModel>> getStreamHome(int page) async {
    var response = await networkingConfig.doGet(
      '/stream/home',
      params: {
        "page": page,
        "take": 10, 
      },
      headers: {
         'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return (response['data']['data'] as List).map((e) => StreamHomeModel.fromJson(e)).toList();
  }
}
