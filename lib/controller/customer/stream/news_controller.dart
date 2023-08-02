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

  Future<ArticleModel?> getArticle(
      BuildContext context, String categoryId, String tagId) async {
    try {
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

      print("SAMPE SINI GA");
      article.value = await NewsService().getArticle(formData);
      print("INI APAAN");
      print(article.value);

      print('berapa yaa ${article.value?.record?.length}');

      // GET CATEGORY
      await getCategory(context);

      for (int i = 0; i < article.value!.record!.length; i++) {
        article.value!.record![i].newscategoryId;
        var cek = category.value?.record?.firstWhere(
          (element) => element.id == article.value!.record![i].newscategoryId,
        );

        print("cek ke ${i + 1} ${cek?.category}");

        categoryArticle.add(cek);
      }
      print("categoryArticle $categoryArticle");
      return article.value;
    } catch (e) {
      print("KENA CATCH");
      print(e.toString());
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

      print("SAMPE SINI GA");
      category.value = await NewsService().getNewsCategory(formData);
      print("INI APAAN");
      print(category.value);

      print('berapa yaa ${category.value?.record?.length}');

      return category.value;
    } catch (e) {
      print("KENA CATCH");
      print(e.toString());
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

      print("SAMPE SINI GA");
      tag.value = await NewsService().getTag(formData);
      print("INI APAAN");
      print(tag.value);

      print('berapa yaa ${tag.value?.record?.length}');

      return tag.value;
    } catch (e) {
      print("KENA CATCH");
      print(e.toString());
      return null;
    }
  }
}
