import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/networking_config.dart';
import 'package:heystetik_mobileapps/core/provider_class.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/models/customer/news_category_model.dart';
import 'package:heystetik_mobileapps/models/customer/news_tag_model.dart';

class NewsService extends ProviderClass {
  NewsService()
      : super(networkingConfig: NetworkingConfig(baseUrl: Global.BASE_API));

  Future<ArticleModel> getArticle(dynamic data) async {
    var response = await networkingConfig.doPost(
      'https://www.heystetik.com/api/article',
      data: data,
      // headers: {
      //   'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      // },
    );

    return ArticleModel.fromJson(response);
  }

  Future<NewsTagModel> getTag(dynamic data) async {
    var response = await networkingConfig.doPost(
      'https://www.heystetik.com/api/tag',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return NewsTagModel.fromJson(response);
  }

  Future<NewsCategoryModel> getNewsCategory(dynamic data) async {
    var response = await networkingConfig.doPost(
      'https://www.heystetik.com/api/newscategory',
      data: data,
      headers: {
        'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}'
      },
    );

    return NewsCategoryModel.fromJson(response);
  }
}
