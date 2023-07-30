import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart' as TreatmentModel;
import 'package:heystetik_mobileapps/models/customer/wishlist_model.dart';
import 'package:heystetik_mobileapps/models/doctor/treatment_recommendation_model.dart';

import '../../../models/clinic.dart';
import '../../../models/treatment_detail.dart';

class TreatmentService extends ProviderClass {
  TreatmentService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<List<TreatmentRecommendationModel>> getTreatmentRecommendation() async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/recomendation',
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );
      return (response['data'] as List).map((e) => TreatmentRecommendationModel.fromJson(e)).toList();
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
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );

      print(response);

      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<TreatmentModel.TreatmentModel> getTrendingTreatment(int page) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/trending',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );

      print(response);

      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<TreatmentModel.TreatmentModel> getTopRatingTreatment(int page) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/top-rating',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
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
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );

      print(response);

      return response;
    } catch (error) {
      print(error);
      return {};
    }
  }

  Future<TreatmentModel.TreatmentModel> getTreatmentFromSameClinic(int page, int clinicID) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/clinic/$clinicID',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );

      print(response);

      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<TreatmentDetailModel> getTreatmentDetail(int treatmentID) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/$treatmentID',
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );

      return TreatmentDetailModel.fromJson(response['data']);
    } catch (error) {
      print(error);
      return TreatmentDetailModel();
    }
  }

  Future<ClinicModel> getClinic(int page, {String? search}) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/clinic',
        params: {
          "page": page,
          "take": 10,
          "search": search ?? "",
        },
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );

      print(response);

      return ClinicModel.fromJson(response);
    } catch (error) {
      print(error);
      return ClinicModel();
    }
  }

  void userWishlistTreatment(int treatmentID, bool wishlist) async {
    try {
      if (wishlist) {
        var response = await networkingConfig.doPost(
          '/user-wishlist-treatment',
          data: {
            "treatment_id": treatmentID,
          },
          headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
        );

        print(response);
      } else {
        var response = await networkingConfig.doDelete(
          '/user-wishlist-treatment/$treatmentID',
          headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
        );

        print(response);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<TreatmentModel.TreatmentModel> getNearTreatment(int page) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment/near-me',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );
      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }

  Future<TreatmentModel.TreatmentModel> getAllTreatment(int page) async {
    try {
      var response = await networkingConfig.doGet(
        '/solution/treatment',
        params: {
          "page": page,
          "take": 10,
        },
        headers: {'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'},
      );
      return TreatmentModel.TreatmentModel.fromJson(response);
    } catch (error) {
      print(error);
      return TreatmentModel.TreatmentModel();
    }
  }
}
