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
import 'package:heystetik_mobileapps/models/customer/related_product_skincare_model.dart';
import 'package:heystetik_mobileapps/models/customer/skincare_model.dart';
import 'package:heystetik_mobileapps/models/drug_model.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

class SolutionService extends ProviderClass {
  SolutionService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<SkincareModel> getAllSkincare(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
      "search": search,
      "order": "desc"
    };

    if (filter != null) {
      params.addAll(filter);
    }
    print("params $params");
    try {
      var response = await networkingConfig.doGet(
        '/solution/skincare',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      print('kesini g ${response}');
      return SkincareModel.fromJson(response);
    } catch (error) {
      print(error);
      return SkincareModel();
    }
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

  Future<LookupModel> getLookup(
    String category, {
    String? search,
  }) async {
    Map<String, dynamic> params = {
      "page": 1,
      "take": 100,
      "search": search,
      "order": "asc",
      "category[]": category
    };

    print("params $params");

    try {
      var response = await networkingConfig.doGet(
        '/lookup',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );
      return LookupModel.fromJson(response);
    } catch (error) {
      print(error);
      return LookupModel();
    }
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

  Future<DrugModel> getDrug(
    int page, {
    String? search,
    Map<String, dynamic>? filter,
  }) async {
    Map<String, dynamic> params = {
      "page": page,
      "take": 10,
      "search": search,
      "order": "desc"
    };

    if (filter != null) {
      params.addAll(filter);
    }
    print("params $params");
    try {
      var response = await networkingConfig.doGet(
        '/solution/drug',
        params: params,
        headers: {
          'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
          'User-Agent': await userAgent(),
        },
      );

      return DrugModel.fromJson(response);
    } catch (error) {
      print(error);
      return DrugModel();
    }
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

  void addDrugToCart(int productID) async {
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
