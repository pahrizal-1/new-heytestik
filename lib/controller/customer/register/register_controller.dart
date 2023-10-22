import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/register/register_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/local_storage.dart';
import '../../../widget/snackbar_widget.dart';

class RegisterController extends StateClass {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  String? countryCode;
  String? phoneNumber;
  String gender = 'Laki-laki';
  int province = 0;
  int? city;
  String? code;
  TextEditingController position = TextEditingController();

  void setProvince(int value) {
    province = value;
    notifyListeners();
  }

  void setCity(int? value) {
    city = value;
    notifyListeners();
  }

  final emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  Future<void> openTelegram({
    required String phone,
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    const String url = 'tg://t.me/+xqqoDqGSZm02Zm';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: mode,
      );
    } else {
      throw Exception('openTelegram could not launching url');
    }
  }

  registerPhoneNumber(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (phoneNumber == null || phoneNumber == "" || phoneNumber!.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nomor Ponsel harus diisi',
        );
      }
      var noHp = "$countryCode$phoneNumber";

      var data = {
        "method": "WHATSAPP",
        "type": "REGISTRATION",
        "no_phone": noHp,
      };

      print(data);

      var loginResponse = await RegisterService().registerPhone(data);
      print(loginResponse);
      await openTelegram(phone: noHp);
      doInPost();
    });
    isLoading.value = false;
  }

  registerEmailWithoutVerification(BuildContext context,
      {required Function() doInPost}) async {
    isLoadingMore.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (email.text == "") {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Email harus diisi',
        );
      }

      var data = {
        "user_id": await LocalStorage().getUserID(),
        "email": email.text,
      };

      print(data);

      var loginResponse = await RegisterService().emailVerify(data);
      print(loginResponse);
      doInPost();
    });
    isLoadingMore.value = false;
  }

  registerEmail(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (email.text == "") {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Email harus diisi',
        );
      }

      var data = {
        "method": "EMAIL",
        "type": "REGISTRATION",
        "email": email.text,
      };

      print(data);

      var response = await RegisterService().registerEmail(data);
      print(response);
      doInPost();
    });
    isLoading.value = false;
  }

  verifyEmail(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (code == "" || code == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Code harus diisi',
        );
      }

      var data = {
        "user_id": await LocalStorage().getUserID(),
        "email": email.text,
        "verification_code": code.toString(),
      };

      var loginResponse = await RegisterService().emailVerify(data);
      print("INI STATUS");
      print(loginResponse['success']);
      if (loginResponse['success'] == false) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          SnackbarWidget.getErrorSnackbar(
            context,
            'Info',
            'Invalid verification code',
          );
        });
      } else {
        print(loginResponse);
        doInPost();
      }
    });
    isLoading.value = false;
  }

  resendCodeEmail(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'email': email.text,
        'userId': await LocalStorage().getUserID(),
      };

      print(data);

      var loginResponse = await RegisterService().resendCode(data);
      print(loginResponse);
      doInPost();
    });
    isLoading.value = false;
  }

  resendCodePhone(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'phone_number': phoneNumber,
        'userId': await LocalStorage().getUserID(),
      };

      var loginResponse = await RegisterService().resendCode(data);
      doInPost();
      print(loginResponse);
    });
    isLoading.value = false;
  }

  verifyPhoneNumber(
    BuildContext context, {
    required Function() doInPost,
  }) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (code == "" || code == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Code harus diisi',
        );
      }

      var data = {
        "phone_number": phoneNumber,
        "verification_code": code.toString(),
      };
      print("data $data");
      var loginResponse = await RegisterService().phoneVerify(data);
      print(loginResponse);
      LocalStorage().setUserID(userID: loginResponse['data']['id']);
      doInPost();
    });
    isLoading.value = false;
  }

  register(BuildContext context,
      {File? profileImage, required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (email.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Email harus diisi',
        );
      }
      if (emailValid.hasMatch(email.text) == false) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Format email salah',
        );
      }
      if (password.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Password harus diisi',
        );
      }
      if (fullName.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nama Lengkap harus diisi',
        );
      }
      var data = {
        'user_id': await LocalStorage().getUserID(),
        'gender': gender,
        'fullname': fullName.text,
        'password': password.text,
      };

      if (province != 0) {
        data['province_id'] = province;
      }

      if (city != null && city != 0) {
        data['city_id'] = city;
      }

      if (profileImage != null) {
        data['file'] = await MultipartFile.fromFile(profileImage.path);
      }

      FormData formData = FormData.fromMap(data);
      print('formData $formData');
      // return;
      var res = await RegisterService().register(formData);
      print('res $res');
      doInPost();
    });
    isLoading.value = false;
  }
}
