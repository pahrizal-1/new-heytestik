import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/slideshow/slideshow_service.dart';
import 'package:heystetik_mobileapps/service/customer/sniptips/sniptips_service.dart';

class HomeController extends StateClass {
  RxString username = '-'.obs;

  init() async {
    username.value = await LocalStorage().getFullName();
  }

  getSlideShow(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      return await SlideShowService().getSlideShow();
    });
  }

  getSnipTips(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      return await SnipTipsService().getSnipTips();
    });
  }
}
