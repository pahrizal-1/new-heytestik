import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/service/customer/stream/news_service.dart';

class NewsController extends StateClass {
  Rx<ArticleModel?> article = ArticleModel().obs;

  Future<ArticleModel?> getArticle(BuildContext context) async {
    try {
      Map<String, dynamic> data = {
        'clientid': '4mfgpxctjz',
        'clientsecretid': '7zgtlpqul693u5dyetwgvw72dm5pgp',
        'halaman': 1,
        'search_keyword': 1,
        'search_newscategory_id': 1,
      };

      var formData = FormData.fromMap(data);

      print("SAMPE SINI GA");
      article.value = await NewsService().getArticle(formData);
      print("INI APAAN");
      print(article.value);

      print('berapa yaa ${article.value?.record?.length}');

      return article.value;
    } catch (e) {
      print("KENA CATCH");
      print(e.toString());
      return null;
    }
  }
}
