// ignore_for_file: prefer_if_null_operators
import 'package:dio/dio.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/completion_model.dart';
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart';
import 'package:heystetik_mobileapps/models/customer/interest_model.dart'
    as Interest;
import 'package:heystetik_mobileapps/models/customer/user_profile_overview_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import '../../../core/local_storage.dart';
import '../../../models/customer/customer_profile_model.dart';
import '../../../models/stream_home.dart';

class ProfileService extends ProviderClass {
  ProfileService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  // Future<dynamic> timeout() async {
  //   var response = await networkingConfig.doGet(
  //     '/test-timeout?process_time=60000&timeout=5000',
  //     headers: {
  //       'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
  //       'User-Agent': await userAgent(),
  //     },
  //   );
  //   return response;
  // }

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

  Future<Interest.InterestModel> getInterest() async {
    var response = await networkingConfig.doGet(
      '/profile/user/interest',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("RES $response");
    return Interest.InterestModel.fromJson(response);
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

  Future<UserProfileOverviewModel> getUserOverview(String username) async {
    print("username getUserOverview $username");
    var response = await networkingConfig.doGet(
      '/user-profile/$username/overview',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return UserProfileOverviewModel.fromJson(response);
  }

  Future<FinishedReviewModel> getUserActivityReview(
      int page, String username) async {
    print("username getUserActivityReview $username");
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

  Future<List<StreamHomeModel>> getUserActivityPost(
    int page, {
    required String username,
    String? search,
    String? postType,
  }) async {
    print("username getUserActivityPost $username");
    Map<String, dynamic> data = {
      "page": page,
      "take": 10,
      "post_type": postType,
      "search": search,
    };
    print("param getUserActivityPost $data");
    var response = await networkingConfig.doGet(
      '/user-profile/$username/posts',
      params: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return (response['data']['data'] as List)
        .map((e) => StreamHomeModel.fromJson(e))
        .toList();
  }

  Future<Interest.InterestModel> getInterestUserProfile(String username) async {
    print("username getInterestUserProfile $username");
    var response = await networkingConfig.doGet(
      '/user-profile/$username/interest',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    response['data']['skin_goals_budget'] =
        (response['data']['skin_goals_budget'].runtimeType == List<dynamic>)
            ? null
            : response['data']['skin_goals_budget'];
    print("RES $response");
    return Interest.InterestModel.fromJson(response);
  }
}
