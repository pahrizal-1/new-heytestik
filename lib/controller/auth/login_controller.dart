import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/auth/login_service.dart';

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
      var data = {
        'email': email.text,
        'password': password.text,
      };

      var loginResponse = await LoginService().login(data);
      print(loginResponse);
      print(loginResponse['data']['token']);
      print(loginResponse['data']['data']['fullname']);
      print(loginResponse['data']['data']['roleId']);
      print(loginResponse['data']['data']['id']);
      LocalStorage().setAccessToken(token: loginResponse['data']['token']);
      LocalStorage()
          .setUsername(username: loginResponse['data']['data']['fullname']);
      LocalStorage().setRoleID(roleID: loginResponse['data']['data']['roleId']);
      LocalStorage().setUserID(userID: loginResponse['data']['data']['id']);
      doInPost();
    });
    loadingFalse();
  }
}
