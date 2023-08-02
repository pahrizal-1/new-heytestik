import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/onboarding/onboarding1_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_doctor.dart';

class SplashScreenController extends StateClass {
  init(BuildContext context) async {
    Timer(const Duration(milliseconds: 5500), () async {
      String? token = await LocalStorage().getAccessToken();
      int? roleId = await LocalStorage().getRoleID();

      if (token == null || token == '-') {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Get.off(() => const OnBoarding1Page());
        });
      } else {
        if (roleId == 2) {
          print('masuk ke doctor');
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Get.off(() => const TabBarDoctor());
          });
        } else if (roleId == 3) {
          print('masuk ke customer');
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Get.off(() => const TabBarCustomer());
          });
        }
      }
    });
  }
}
