import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart';
import 'package:heystetik_mobileapps/models/customer/detail_drug_model.dart';
import 'package:heystetik_mobileapps/models/customer/detail_skincare_solution_model.dart';
import 'package:heystetik_mobileapps/models/customer/drug_recipe_model.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_model.dart';
import 'package:heystetik_mobileapps/models/customer/overview_product_model.dart';
import 'package:heystetik_mobileapps/models/customer/product_review_model.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class SolutionService extends ProviderClass {
  SolutionService() : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SkincareModel> getAllSkincare(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
    List<String>? category,
    List<String>? brand,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 5,
      "search": search,
      "order": "desc",
    };
    if (filter != null) {
      params.addAll(filter);
    }
    if (category != null) {
      params.addAll({
        "category[]": [for (var i in category) "$i"]
      });
    }
    if (brand != null) {
      params.addAll({
        "brand[]": [for (var i in brand) "$i"]
      });
    }
    print("params getAllSkincare $params");
    try {
      var response = await networkingConfig.doGet(
        '/solution/skincare',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      print("payloads ${response}");

      return SkincareModel.fromJson(response);
    } catch (error) {
      print(error);
      return SkincareModel();
    }
  }

  Future<SkincareModel> skincareDermatologists(int page) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare/dermatologists/choice',
      params: {
        "page": page,
        "take": 100,
        "order": "desc",
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return SkincareModel.fromJson(response);
  }

  Future<SkincareModel> skincareRecomendation(int id, int page) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare/$id/recomendation',
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
    return SkincareModel.fromJson(response);
  }

  Future<SkincareModel> relatedProductSkincare(int id, int page) async {
    var response = await networkingConfig.doGet(
      '/solution/skincare/$id/related',
      params: {
        "page": page,
        "take": 100,
        "order": "desc",
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

  Future<LookupModel> getLookup(
    String category, {
    String? search,
  }) async {
    Map<String, dynamic> params = {
      "page": 1,
      "take": 100,
      "search": search,
      "order": "asc",
      "category[]": category,
    };
    print("params $params");
    var response = await networkingConfig.doGet(
      '/lookup',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("getLookup $response");
    return LookupModel.fromJson(response);
  }

  Future<OverviewUlasanProductModel> getOverviewProduct(int id) async {
    var response = await networkingConfig.doGet(
      '/solution/product-review/$id/overview',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return OverviewUlasanProductModel.fromJson(response);
  }

  Future<ProductReviewModel> getReviewProduct(int page, int take, int productId, {Map<String, dynamic>? filter}) async {
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
    print("getReviewProduct $response");
    return ProductReviewModel.fromJson(response);
  }

  Future<ConcernModel> getConcern() async {
    var response = await networkingConfig.doGet(
      '/concern?page=1&take=1000&order=desc&search=',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return ConcernModel.fromJson(response);
  }

  Future<DrugModel> getDrug(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
    List<String>? category,
    List<String>? classification,
    List<String>? form,
    int? minPrice,
    int? maxPrice,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
      "search": search,
      "order": "desc",
      "min_price": minPrice,
      "max_price": maxPrice,
    };

    if (filter != null) {
      params.addAll(filter);
    }
    if (category != null) {
      params.addAll({
        "category[]": [for (var i in category) "$i"]
      });
    }
    if (classification != null) {
      params.addAll({
        "classification[]": [for (var i in classification) "$i"]
      });
    }
    if (form != null) {
      params.addAll({
        "form[]": [for (var i in form) "$i"]
      });
    }

    print("params $params");
    var response = await networkingConfig.doGet(
      '/solution/drug',
      params: params,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    print("getDrug $response");
    return DrugModel.fromJson(response);
  }

  Future<DrugModel> drugRecomendation(int page, int id) async {
    var response = await networkingConfig.doGet(
      '/solution/drug/$id/recomendation',
      params: {
        "page": page,
        "take": 100,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return DrugModel.fromJson(response);
  }

  Future<DrugRecipeModel> getDrugRecipe(int page) async {
    var response = await networkingConfig.doGet(
      '/solution/drug-recipe',
      params: {
        "page": page,
        "take": 100,
      },
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return DrugRecipeModel.fromJson(response);
  }

  Future<DetailDrugModel> detailDrug(int id) async {
    var response = await networkingConfig.doGet(
      '/solution/drug/$id',
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
        'User-Agent': await userAgent(),
      },
    );
    return DetailDrugModel.fromJson(response);
  }

  void helped(int reviewId) async {
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
  }

  void unHelped(int reviewId) async {
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
  }
}
