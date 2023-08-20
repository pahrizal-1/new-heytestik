import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart';
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart';
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart';
import 'package:heystetik_mobileapps/models/customer/related_product_skincare_model.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart';
import 'package:heystetik_mobileapps/models/medicine.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class SolutionService extends ProviderClass {
  SolutionService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SkincareModel> getSkincare() async {
    var response = await networkingConfig.doGet(
      '/solution/skincare?page=1&search=&take=100&order=desc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return SkincareModel.fromJson(response);
  }

  Future<SkincareModel> getSkincareByCategory(String category) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare?page=1&search=&category[]=$category&take=100&order=desc',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return SkincareModel.fromJson(response);
  }

  Future<SkincareModel> getSkincareByDisplay(List display) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare',
      params: {
        "page": 1,
        "take": 100,
        "order": "desc",
        "display[]": display,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return SkincareModel.fromJson(response);
  }

  Future<DetailSkincareSolutionModel> detailSkincare(int id) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return DetailSkincareSolutionModel.fromJson(response);
  }

  Future<RelatedProductSkincareModel> relatedProductSkincare(
      int id, int page) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare/$id/related',
      params: {
        "page": page,
        "take": 10,
        "order": "desc",
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return RelatedProductSkincareModel.fromJson(response);
  }

  Future<LookupModel> getLookup(String category) async {
    var response = await networkingConfig.doGet(
      '/lookup?page=1&take=100&order=desc&category[]=$category&search=',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return LookupModel.fromJson(response);
  }

  Future<OverviewProductModel> getOverviewProduct(int id) async {
    print("id $id");
    var response = await networkingConfig.doGet(
      '/solution/product-review/$id/overview',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return OverviewProductModel.fromJson(response);
  }

  Future<ProductReviewModel> getReviewProduct(int page, int take, int productId,
      {Map<String, dynamic>? filter}) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": take,
      "product_id": productId,
    };

    if (filter != null) {
      params.addAll(filter);
    }
    print("params $params");
    var response = await networkingConfig.doGet(
      '/solution/product-review',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return ProductReviewModel.fromJson(response);
  }

  Future<ConcernModel> getConcern() async {
    var response = await networkingConfig.doGet(
      '/concern?page=1&take=100&order=desc&search=',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return ConcernModel.fromJson(response);
  }

  Future<MedicineModel> getMedicine(int page) async {
    var response = await networkingConfig.doGet(
      '/solution/drug',
      params: {
        "page": page,
        "take": 10,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return MedicineModel.fromJson(response);
  }

  Future<MedicineModel> getMedicineByConcern(int page, List concern) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare',
      params: {
        "page": page,
        "take": 100,
        "order": "desc",
        "concern_ids[]": concern,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return MedicineModel.fromJson(response);
  }

  Future<DrugRecipeModel> getDrugRecipe(int page) async {
    var response = await networkingConfig.doGet(
      '/solution/drug-recipe',
      params: {
        "page": page,
        "take": 10,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    return DrugRecipeModel.fromJson(response);
  }

  void addMedicineToCart(int productID) async {
    var response = await networkingConfig.doPost(
      '/user-cart',
      data: {
        "product_id": productID,
        "qty": 1,
        "notes": null,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );

    print(response);
  }

  Future helped(int reviewId) async {
    var response = await networkingConfig.doPost(
      '/solution/product-review/helpful',
      data: {
        "product_review_id": reviewId,
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
      '/solution/product-review/helpful',
      data: {
        "product_review_id": reviewId,
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
