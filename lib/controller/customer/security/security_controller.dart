// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page_new.dart';
import 'package:heystetik_mobileapps/service/customer/profile/profile_service.dart';
import 'package:intl/intl.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/global.dart';
import '../../../models/customer/customer_profile_model.dart';
import '../../../models/stream_home.dart';
import '../../../pages/profile_costumer/edit_profil_customer_page.dart';
import 'package:dio/dio.dart' as dio;

class SecurityController extends StateClass {
  RxString fullName = '-'.obs;
  RxString name = ''.obs;
  RxString username = ''.obs;
  RxString bio = ''.obs;
  String bioUser = '';
  RxString idUser = ''.obs;
  RxString email = ''.obs;
  RxString noHp = ''.obs;
  RxString dob = ''.obs;
  RxString otp = ''.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailBaruController = TextEditingController();
  TextEditingController nomorHpController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Rx<CustomerProfileModel> profileData = CustomerProfileModel().obs;
  RxInt resendTime = 120.obs;
  Timer? timer;

  List<String> items = [
    'Laki-laki',
    'Perempuan',
  ];
  RxString gender = ''.obs;

  Map dataUser = {};
  File? image;
  String? fileImg64;
  RxBool isSave = false.obs;
  RxString imgNetwork = ''.obs;

  File? idCardPhoto;
  File? facePhoto;
  RxBool isLoadingCam = false.obs;

  startVerifyCountTime() {
    // await timeCondition();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      resendTime.value = resendTime.value - 1;
      if (resendTime.value <= 0) {
        timer.cancel();
      }
    });
  }

  // timeCondition() {
  //   timer!.cancel();
  // }

  init() async {
    fullName.value = await LocalStorage().getFullName();
    dataUser = await LocalStorage().getDataUser();

    print('fullname ${fullName.value}');
    print('dataUser $dataUser');
    print('dataUser ${dataUser['fullname']}');
  }

  verifyCodeEmail(
    BuildContext context,
    String text,
  ) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "method": "EMAIL",
        "type": "CHANGE_EMAIL",
        "user_id": int.parse(idUser.value),
        "email": text,
      };
      print('email ${text}');
      var response = await ProfileService().verifSend(data);
      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
    });
    isLoading.value = false;
  }

  verifyCodeWA(
    BuildContext context,
    String text,
  ) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "method": "WHATSAPP",
        "type": "CHANGE_PHONE_NUMBER",
        "user_id": int.parse(idUser.value),
        "no_phone": text
      };

      var response = await ProfileService().verifSend(data);
      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
    });
    isLoading.value = false;
  }
}
