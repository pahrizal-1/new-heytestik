import 'package:dio/dio.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/completion_model.dart';
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart';
import 'package:heystetik_mobileapps/models/customer/interest_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/local_storage.dart';
import '../../../models/customer/customer_profile_model.dart';
import '../../../models/stream_home.dart';

class ProfileService extends ProviderClass {
  ProfileService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<dynamic> closedAccount() async {
    var response = await networkingConfig.doUpdateFinish(
      '/profile/close-account',
    );

    return response;
  }

  Future<dynamic> accountVerification(dynamic data) async {
    FormData formData = FormData.fromMap({
      "id_card_photo": await MultipartFile.fromFile(data['idCardPhoto']),
      "face_photo": await MultipartFile.fromFile(data['facePhoto']),
    });

    var response = await networkingConfig.doPost(
      '/account-verification',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'Content-type': 'multipart/form-data',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }

  Future<CustomerProfileModel> getProfileCust() async {
    var response = await networkingConfig.doGet(
      '/profile/user',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    var jsonResponse = CustomerProfileModel.fromJson(response);
    return jsonResponse;
  }

  Future<dynamic> changeProfile(dynamic data) async {
    var response = await networkingConfig.doUpdate(
      '/profile/user',
      data,
    );

    return response;
  }

  Future<InterestModel> getInterest() async {
    var response = await networkingConfig.doGet(
      '/profile/user/interest',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return InterestModel.fromJson(response);
  }

  Future<CompletionModel> getCompletion() async {
    var response = await networkingConfig.doGet(
      '/profile/user/completion',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return CompletionModel.fromJson(response);
  }

  Future verifSend(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/verification/send',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'Accept': '*/*',
        'Connection': 'keep-alive',
        'User-Agent': await userAgent(),
      },
    );

    return response;
  }

  Future<FinishedReviewModel> getUserActivityReview(int page) async {
    String username = await LocalStorage().getUsername();
    var response = await networkingConfig.doGet(
      '/user-profile/$username/reviews',
      params: {
        "page": page,
        "take": 10,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return FinishedReviewModel.fromJson(response);
  }

  Future<Map<String, dynamic>> getUserOverview() async {
    try {
      String username = await LocalStorage().getUsername();
      var response = await networkingConfig.doGet(
        '/user-profile/$username/overview',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(username);
      print("ini response overview");
      print(response['data']);
      return response['data'];
    } catch (error) {
      print(error);
      return {};
    }
  }

  Future<List<StreamHomeModel>> getUserActivityPost(
    int page, {
    String? search,
    String? postType,
  }) async {
    try {
      var response = await networkingConfig.doGet(
        '/user-profile/customer/posts',
        params: {
          "page": page,
          "take": 10,
          "post_type": postType,
          "search": search,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return (response['data']['data'] as List)
          .map((e) => StreamHomeModel.fromJson(e))
          .toList();
    } catch (error) {
      print(error);
      return [];
    }
  }
}
