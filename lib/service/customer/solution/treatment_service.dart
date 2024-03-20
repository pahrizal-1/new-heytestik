import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart' as TreatmentModel;
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/models/find_clinic_model.dart';
import 'package:heystetik_mobileapps/models/treatment_review_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import 'package:heystetik_mobileapps/models/customer/overview_treatment_model.dart';
import '../../../models/clinic.dart';
import '../../../models/doctor/treatment_type_model.dart';

class TreatmentService extends ProviderClass {
  TreatmentService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<TreatmentModel.TreatmentModel> getAllTreatment(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
      "search": search,
    };
    if (filter != null) {
      params.addAll(filter);
    }
    print("params getAllTreatment $params");
    var response = await networkingConfig.doGet(
      '/solution/treatment',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('response getAllTreatment $response');
    return TreatmentModel.TreatmentModel.fromJson(response);
  }

  Future<TreatmentTypeModel> getAllTreatmentType(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
    List<String>? methods,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
      "search": search,
      // "treatment_type[]": "",

      // "min_price": "",
      // "max_price": "",
    };
    if (filter != null) {
      params.addAll(filter);
    }

    if (methods != null) {
      params.addAll({
        "treatment_type[]": [
          for (var method in methods) "$method",
        ]
      });
    }

    print("params getAllTreatment $params");
    var response = await networkingConfig.doGet(
      '/solution/treatment/doctor/recomendation',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return TreatmentTypeModel.fromJson(response);
  }

  Future<List<TreatmentRecommendationModel>> getTreatmentRecommendation() async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/recomendation',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('response getTreatmentRecommendation $response');
    return (response['data'] as List).map((e) => TreatmentRecommendationModel.fromJson(e)).toList();
  }

  Future<TreatmentModel.TreatmentModel> getTopTreatment(int page) async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/top',
      params: {
        "page": page,
        "take": 10,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('response getTopTreatment $response');
    return TreatmentModel.TreatmentModel.fromJson(response);
  }

  Future<TreatmentModel.TreatmentModel> getTrendingTreatment(int page, {String? search}) async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/trending',
      params: {"page": page, "take": 10, "search": search},
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print('response getTopTreatment $response');
    return TreatmentModel.TreatmentModel.fromJson(response);
  }

  Future<TreatmentModel.TreatmentModel> getTopRatingTreatment(int page, {String? search}) async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/top-rating',
      params: {"page": page, "take": 10, "search": search},
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getTopRatingTreatment $response");
    return TreatmentModel.TreatmentModel();
  }

  Future<OverviewUlasanTreatmentModel> getOverview(int treatmentID) async {
    var response = await networkingConfig.doGet(
      '/solution/treatment-review/$treatmentID/overview',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getOverview $response");
    return OverviewUlasanTreatmentModel.fromJson(response);
  }

  Future<TreatmentModel.TreatmentModel> getTreatmentFromSameClinic(int page, int clinicID) async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/clinic/$clinicID/treatment',
      params: {
        "page": page,
        "take": 10,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getTreatmentFromSameClinic $response");
    return TreatmentModel.TreatmentModel.fromJson(response);
  }

  Future<TreatmentModel.Data2> getTreatmentDetail(int treatmentID) async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/$treatmentID',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getTreatmentDetail $response");
    return TreatmentModel.Data2.fromJson(response['data']);
  }

  Future<ClinicModel> getClinic(int page, {String? search, Map<String, dynamic>? filter}) async {
    Map<String, dynamic> parameter = {
      "page": page,
      "take": 10,
      "search": search,
    };

    if (filter != null) {
      parameter.addAll(filter);
    }
    print("parameter getClinic $parameter");
    var response = await networkingConfig.doGet(
      '/solution/treatment/clinic',
      params: parameter,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getClinic $response");
    return ClinicModel.fromJson(response);
  }

  Future<FindClinicModel> getClinicDetail(int id) async {
    var response = await networkingConfig.doGet(
      '/solution/treatment/clinic/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getClinicDetail $response");
    return FindClinicModel.fromJson(response);
  }

  Future<TreatmentModel.TreatmentModel> getNearTreatment(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
      "search": search,
    };

    if (filter != null) {
      params.addAll(filter);
    }
    print("params getNearTreatment $params");
    var response = await networkingConfig.doGet(
      '/solution/treatment/near-me',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getNearTreatment $response");
    return TreatmentModel.TreatmentModel.fromJson(response);
  }

  Future<TreatmentReviewModel> getTreatmentReview(
    int page,
    int take,
    int treatmentID, {
    Map<String, dynamic>? filter,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": take,
      "treatment_id": treatmentID,
    };

    if (filter != null) {
      params.addAll(filter);
    }
    print("params getTreatmentReview $params");
    var response = await networkingConfig.doGet(
      '/solution/treatment-review',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("response getTreatmentReview $response");
    return TreatmentReviewModel.fromJson(response);
  }

  Future helped(int reviewId) async {
    var response = await networkingConfig.doPost(
      '/solution/treatment-review/helpful',
      data: {
        "treatment_review_id": reviewId,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print(response);
    return response;
  }

  Future unHelped(int reviewId) async {
    var response = await networkingConfig.doDelete(
      '/solution/treatment-review/helpful',
      data: {
        "treatment_review_id": reviewId,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print(response);
    return response;
  }
}
