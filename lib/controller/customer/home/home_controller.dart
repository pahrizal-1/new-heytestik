import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/banne_model.dart';
import 'package:heystetik_mobileapps/models/customer/snips_tips_model.dart';
import 'package:heystetik_mobileapps/service/customer/slideshow/slideshow_service.dart';
import 'package:heystetik_mobileapps/service/customer/sniptips/sniptips_service.dart';

class HomeController extends StateClass {
  RxString username = '-'.obs;
  Rx<BannerModel?> banner = BannerModel.fromJson({}).obs;
  Rx<SnipsTipsModel?> snipsTips = SnipsTipsModel.fromJson({}).obs;

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
}
