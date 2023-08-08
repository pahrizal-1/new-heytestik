import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/waiting_review_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class ReviewService extends ProviderClass {
  ReviewService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<WaitingReviewModel> waitingReview(int page) async {
    var response = await networkingConfig.doGet(
      '/user-review/waiting',
      params: {
        "page": page,
        "take": 10,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return WaitingReviewModel.fromJson(response);
  }

  Future<dynamic> reviewConsultation(dynamic data) async {
    var response = await networkingConfig.doPost(
      '/consultation-review',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }
}
