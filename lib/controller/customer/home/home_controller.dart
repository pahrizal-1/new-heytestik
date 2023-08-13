import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/models/customer/banne_model.dart';
import 'package:heystetik_mobileapps/models/customer/snips_tips_model.dart';
import 'package:heystetik_mobileapps/service/customer/slideshow/slideshow_service.dart';
import 'package:heystetik_mobileapps/service/customer/sniptips/sniptips_service.dart';
import 'package:heystetik_mobileapps/service/customer/stream/news_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;

class HomeController extends StateClass {
  RxString username = '-'.obs;
  Rx<BannerModel?> banner = BannerModel.fromJson({}).obs;
  Rx<SnipsTipsModel?> snipsTips = SnipsTipsModel.fromJson({}).obs;
  Rx<ArticleModel?> article = ArticleModel().obs;

  init() async {
    username.value = await LocalStorage().getFullName();
  }

  Future<BannerModel?> getSlideShow(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      banner.value = await SlideShowService().getSlideShow();
    });
    return banner.value;
  }

  Future<SnipsTipsModel?> getSnipsTips(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      snipsTips.value = await SnipTipsService().getSnipsTips();
    });
    return snipsTips.value;
  }

  Future<ArticleModel?> getArticle(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        Map<String, dynamic> data = {
          'clientid': '4mfgpxctjz',
          'clientsecretid': '7zgtlpqul693u5dyetwgvw72dm5pgp',
          'halaman': 1,
          // 'search_keyword': '',
          // 'search_newscategory_id': categoryId,
          // 'search_tag_id': tagId
        };

        var formData = FormData.fromMap(data);

        article.value = await NewsService().getArticle(formData);
      } catch (e) {
        print("heheh $e");
      }
    });
    return article.value;
  }
}
