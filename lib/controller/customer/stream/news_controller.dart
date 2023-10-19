// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/models/customer/news_category_model.dart';
import 'package:heystetik_mobileapps/models/customer/news_tag_model.dart';
import 'package:heystetik_mobileapps/service/customer/stream/news_service.dart';

class NewsController extends StateClass {
  Rx<ArticleModel?> article = ArticleModel().obs;
  Rx<NewsCategoryModel?> category = NewsCategoryModel().obs;
  Rx<NewsTagModel?> tag = NewsTagModel().obs;
  List categoryArticle = [];
  RxInt totalArticel = 0.obs;

  Future<ArticleModel?> getArticle(
      BuildContext context, String categoryId, String tagId) async {
    try {
      // searching lanjut
      categoryArticle.clear();
      Map<String, dynamic> data = {
        'clientid': '4mfgpxctjz',
        'clientsecretid': '7zgtlpqul693u5dyetwgvw72dm5pgp',
        'halaman': 1,
        'search_keyword': '',
        'search_newscategory_id': categoryId,
        'search_tag_id': tagId
      };

      var formData = FormData.fromMap(data);

      article.value = await NewsService().getArticle(formData);

      // GET CATEGORY
      await getCategory(context);

      totalArticel.value = article.value!.record!.length;

      for (int i = 0; i < article.value!.record!.length; i++) {
        article.value!.record![i].newscategoryId;
        var cek = category.value?.record?.firstWhere(
          (element) => element.id == article.value!.record![i].newscategoryId,
        );

        categoryArticle.add(cek);
      }

      return article.value;
    } catch (e) {
      print("KENA CATCH ${e.toString()}");
      return null;
    }
  }

  Future<NewsCategoryModel?> getCategory(BuildContext context) async {
    try {
      Map<String, dynamic> data = {
        'clientid': '4mfgpxctjz',
        'clientsecretid': '7zgtlpqul693u5dyetwgvw72dm5pgp',
        'halaman': 1,
        'search_keyword': 1,
        'search_newscategory_id': 1,
      };

      var formData = FormData.fromMap(data);

      category.value = await NewsService().getNewsCategory(formData);

      return category.value;
    } catch (e) {
      print("KENA CATCH ${e.toString()}");
      return null;
    }
  }

  Future<NewsTagModel?> getTag(BuildContext context) async {
    try {
      Map<String, dynamic> data = {
        'clientid': '4mfgpxctjz',
        'clientsecretid': '7zgtlpqul693u5dyetwgvw72dm5pgp',
        'halaman': 1,
        'search_keyword': 1,
        'search_newscategory_id': 1,
      };

      var formData = FormData.fromMap(data);

      tag.value = await NewsService().getTag(formData);

      return tag.value;
    } catch (e) {
      print("KENA CATCH ${e.toString()}");
      return null;
    }
  }
}
