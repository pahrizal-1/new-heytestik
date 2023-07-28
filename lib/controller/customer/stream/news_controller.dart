import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/service/customer/stream/news_service.dart';

class NewsController extends StateClass {
  Rx<ArticleModel?> article = ArticleModel.fromJson({}).obs;

  Future<ArticleModel?> getArticle(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        var data = {
          'clientid': '4mfgpxctjz',
          'clientsecretid': '7zgtlpqul693u5dyetwgvw72dm5pgp',
          'halaman': 1,
          'search_keyword': 1,
          'search_newscategory_id': 1,
          // 'search_tag_id': 1,
        };
        await Future.delayed(Duration(seconds: 5));
        print(data);
        article.value = await NewsService().getArticle(jsonEncode(data));

        print('berapa yaa ${article.value?.record?.length}');
      } catch (e) {
        print("heheh $e");
      }
    });
    return article.value;
  }
}
