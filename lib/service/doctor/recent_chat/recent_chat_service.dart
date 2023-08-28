import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/detail_consultation_model.dart';
import 'package:heystetik_mobileapps/models/customer/gallery_file_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

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

  Future getFetchMessage(String roomCode, int take) async {
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

class DetailConsultationService extends ProviderClass {
  DetailConsultationService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<DetailConsultationModel> detailConsultation(int id) async {
    var response = await networkingConfig.doGet(
      '/consultation/$id/detail',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return DetailConsultationModel.fromJson(response);
  }

  Future<GalleryFileModel> galleryFile(int id) async {
    var response = await networkingConfig.doGet(
      '/consultation/$id/galery/files',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return GalleryFileModel.fromJson(response);
  }

  Future invoiceDownload(int id) async {
    var response = await networkingConfig.doGet(
      '/invoice/consultation/$id/download',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }
}
