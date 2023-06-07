import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/auth/login_service.dart';

import '../../core/local_storage.dart';

class LoginController extends StateClass {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  logIn(BuildContext context, {required Function() doInPost}) async {
    loadingTrue();
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (email.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: "Email harus diisi",
        );
      }
      if (emailValid.hasMatch(email.text) == false) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: "Format email salah",
        );
      }
      if (password.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: "Password harus diisi",
        );
      }
      var data = {
        "email": email.text,
        "password": password.text,
      };

      var loginResponse = await LoginService().login(data);
      print(loginResponse);
      LocalStorage().setAccessToken(token: loginResponse['token']);
      LocalStorage().setUsername(username: loginResponse['data']['fullname']);
      // if(loginResponse[''])

      doInPost();
    });
    loadingFalse();
  }
}
