// ignore_for_file: use_build_context_synchronously

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page.dart';
import 'package:heystetik_mobileapps/service/customer/profile/profile_service.dart';

import '../../../models/stream_home.dart';
import '../../../models/user_activity.dart';

class ProfileController extends StateClass {
  RxString fullName = '-'.obs;
  Map dataUser = {};

  init() async {
    fullName.value = await LocalStorage().getFullName();
    dataUser = await LocalStorage().getDataUser();

    print('fullname ${fullName.value}');
    print('dataUser $dataUser');
    print('dataUser ${dataUser['fullname']}');
  }

  closeAccount(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await ProfileService().closedAccount();
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      doInPost();
    });
    isLoading.value = false;
  }

  logout(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      await LocalStorage().removeAccessToken();
      int userID = await LocalStorage().getUserID() ?? 0;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await FirebaseMessaging.instance.unsubscribeFromTopic('all');
        await FirebaseMessaging.instance.unsubscribeFromTopic(userID.toString());
      });

      Get.offAll(() => const LoginPage());
      print('logout customer');
    });
  }

  Future<List<UserActivity>> getUserActivityReview(BuildContext context, int page) async {
    try {
      isLoading.value = true;
      List<UserActivity> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await ProfileService().getUserActivityReview(page);
        isLoading.value = false;
      });

      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<List<StreamHomeModel>> getUserActivityPost(
    BuildContext context,
    int page, {
    String? search,
    String? postType,
  }) async {
    try {
      isLoading.value = true;
      List<StreamHomeModel> data = [];
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        data = await ProfileService().getUserActivityPost(page, search: search, postType: postType);
        isLoading.value = false;
      });

      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
