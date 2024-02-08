import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart'
    as TreatmentModel;
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';
import 'package:heystetik_mobileapps/models/find_clinic_model.dart';
import 'package:heystetik_mobileapps/models/treatment_review_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../models/clinic.dart';
import '../../../models/lookup_treatment.dart';

class TreatmentService extends ProviderClass {
  TreatmentService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<List<TreatmentRecommendationModel>>
      getTreatmentRecommendation() async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/recomendation',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      return (response['data'] as List)
          .map((e) => TreatmentRecommendationModel.fromJson(e))
          .toList();
    } catch (error) {
      print(error);
      return [];
    }
  }

  Future<TreatmentModel.TreatmentModel> getTopTreatment(int page) async {
    try {
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

      print(response);

      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<TreatmentModel.TreatmentModel> getTrendingTreatment(int page,
      {String? search}) async {
    print(search);
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/trending',
        params: {"page": page, "take": 10, "search": search},
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);

      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<TreatmentModel.TreatmentModel> getTopRatingTreatment(int page,
      {String? search}) async {
    print(search);
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/top-rating',
        params: {"page": page, "take": 10, "search": search},
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);

      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<Map<String, dynamic>> getOverview(int treatmentID) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment-review/$treatmentID/overview',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);

      return response;
    } catch (error) {
      print(error);
      return {};
    }
  }

  Future<TreatmentModel.TreatmentModel> getTreatmentFromSameClinic(
      int page, int clinicID) async {
    try {
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

      print(response);

      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<TreatmentModel.Data2> getTreatmentDetail(int treatmentID) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/$treatmentID',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return TreatmentModel.Data2.fromJson(response['data']);
    } catch (error) {
      print(error);
      return TreatmentModel.Data2();
    }
  }

  Future<ClinicModel> getClinic(int page,
      {String? search, Map<String, dynamic>? filter}) async {
    try {
      Map<String, dynamic> parameter = {
        "page": page,
        "take": 10,
        "search": search,
      };

      if (filter != null) {
        parameter.addAll(filter);
      }
      print("parameter $parameter");
      var response = await networkingConfig.doGet(
        '/solution/treatment/clinic',
        params: parameter,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return ClinicModel.fromJson(response);
    } catch (error) {
      print(error);
      return ClinicModel();
    }
  }

  Future<FindClinicModel> getClinicDetail(int id) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/clinic/$id',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return FindClinicModel.fromJson(response);
    } catch (error) {
      print(error);
      return FindClinicModel();
    }
  }

  Future addWishlistTreatment(int treatmentID) async {
    try {
      var response = await networkingConfig.doPost(
        '/user-wishlist-treatment',
        data: {
          "treatment_id": treatmentID,
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
      return response;
    } catch (error) {
      print(error);
    }
  }

  Future deleteWishlistTreatment(int treatmentID) async {
    try {
      var response = await networkingConfig.doDelete(
        '/user-wishlist-treatment/$treatmentID',
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      print(response);
      return response;
    } catch (error) {
      print(error);
    }
  }

  Future<TreatmentModel.TreatmentModel> getNearTreatment(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    try {
      Map<String, dynamic> params = {
        "page": page,
        "take": 10,
        "search": search,
      };

      if (filter != null) {
        params.addAll(filter);
      }
      print("params $params");
      var response = await networkingConfig.doGet(
        '/solution/treatment/near-me',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
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

    var response = await networkingConfig.doGet(
      '/solution/treatment-review',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

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
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<List<LookupTreatmentModel>> getLookupTreatment() async {
    try {
      var response = await networkingConfig.doGet(
        '/lookup',
        params: {
          "page": 1,
          "take": 100,
          "order": "asc",
          "category[]": "TREATMENT_TYPE",
        },
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      return (response['data']['data'] as List)
          .map((e) => LookupTreatmentModel.fromJson(e))
          .toList();
    } catch (error) {
      print(error);
      return [];
    }
  }
}
