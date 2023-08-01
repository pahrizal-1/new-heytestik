import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/register/register_service.dart';

import '../../../core/local_storage.dart';

class RegisterController extends StateClass {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController referralCode = TextEditingController();
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

  registerPhoneNumber(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (phoneNumber == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'No Handphone harus diisi',
        );
      }
      var data = {
        'no_phone': phoneNumber,
      };

      var loginResponse = await RegisterService().registerPhone(data);
      print(loginResponse);
      LocalStorage().setUserID(userID: loginResponse['data']['id']);
      doInPost();
    });
    isLoading.value = false;
  }

  registerEmail(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'email': email.text,
        'userId': await LocalStorage().getUserID(),
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
      if (code == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Code harus diisi',
        );
      }
      var data = {
        'userId': await LocalStorage().getUserID(),
        'verify_type': 'email',
        'code': code
      };

      var loginResponse = await RegisterService().emailVerify(data);
      print(loginResponse);
      doInPost();
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

  verifyPhoneNumber(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (code == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Code harus diisi',
        );
      }

      print(code);
      print(await LocalStorage().getUserID());

      var data = {
        'userId': await LocalStorage().getUserID(),
        'verify_type': 'phone',
        'code': code,
      };

      var loginResponse = await RegisterService().phoneVerify(data);
      print(loginResponse);
      doInPost();
    });
    isLoading.value = false;
  }

  register(BuildContext context, {required Function() doInPost}) async {
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
        'userId': await LocalStorage().getUserID(),
        'gender': gender,
        'fullname': fullName.text,
        'email': email.text,
        'password': password.text,
        'referral_code': referralCode.text,
        'provinceId': province,
        'cityId': city,
        'status': true
      };

      print(data);

      var res = await RegisterService().register(data);
      print('data $res');
      doInPost();
    });
    isLoading.value = false;
  }
}
