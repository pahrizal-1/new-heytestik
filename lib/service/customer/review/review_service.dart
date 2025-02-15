import 'package:dio/dio.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart';
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

  Future<FinishedReviewModel> finishedReview(int page) async {
    var response = await networkingConfig.doGet(
      '/user-review/finished',
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

  Future<dynamic> reviewTreatment(dynamic data) async {
    FormData formData = FormData.fromMap(data);
    for (var file in data['files']) {
      formData.files.addAll(
        [MapEntry('files', await MultipartFile.fromFile(file))],
      );
    }
    var response = await networkingConfig.doPost(
      '/solution/treatment-review',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'Content-type': 'multipart/form-data',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }

  Future<dynamic> reviewProduct(dynamic data) async {
    FormData formData = FormData.fromMap(data);
    for (var file in data['before_conditions']) {
      formData.files.addAll(
        [MapEntry('before_conditions', await MultipartFile.fromFile(file))],
      );
    }
    for (var file in data['after_conditions']) {
      formData.files.addAll(
        [MapEntry('after_conditions', await MultipartFile.fromFile(file))],
      );
    }

    var response = await networkingConfig.doPost(
      '/solution/product-review',
      data: formData,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'Content-type': 'multipart/form-data',
        'User-Agent': await userAgent(),
      },
    );
    return response;
  }
}
