import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_doctor.dart';
import 'package:heystetik_mobileapps/service/auth/login_service.dart';

import '../../core/global.dart';

class LoginController extends StateClass {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  logInWithGoogle(BuildContext context, String token, {required Function() doInPost}) async {
    try {
      isLoading.value = true;
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        var data = {
          'token': token,
        };

        var loginResponse = await LoginService().loginWithGoogle(data);

        if (loginResponse['success'] != true && loginResponse['message'] != 'Success') {
          throw ErrorConfig(
            cause: ErrorConfig.anotherUnknow,
            message: loginResponse['message'],
          );
        }
        print(loginResponse);
        print(loginResponse['data']['token']);
        print(loginResponse['data']['user']['fullname']);
        print(loginResponse['data']['user']['roleId']);
        print(loginResponse['data']['user']['id']);
        print(loginResponse['data']['user']['username']);
        print(loginResponse['data']['user']['id'].toString());

        // SAVE DATA USER
        await LocalStorage().setDataUser(dataUser: loginResponse['data']['user']);
        await LocalStorage().setUsername(username: loginResponse['data']['user']['username'] ?? '');
        await LocalStorage().setAccessToken(token: loginResponse['data']['token']);
        await LocalStorage().setFullName(fullName: loginResponse['data']['user']['fullname'] ?? '');
        await LocalStorage().setRoleID(roleID: loginResponse['data']['user']['roleId']);
        await LocalStorage().setUserID(userID: loginResponse['data']['user']['id']);
        await FirebaseMessaging.instance.subscribeToTopic(loginResponse['data']['user']['id'].toString());
        doInPost();
        clear();
      });
      isLoading.value = false;
    } catch (error) {
      print(error.toString());
    }
  }

  logIn(BuildContext context, {required Function() doInPost}) async {
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
      var data = {
        'email': email.text,
        'password': password.text,
      };

      var loginResponse = await LoginService().login(data);

      if (loginResponse['success'] != true && loginResponse['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: loginResponse['message'],
        );
      }
      print(loginResponse);
      print(loginResponse['data']['token']);
      print(loginResponse['data']['user']['fullname']);
      print(loginResponse['data']['user']['roleId']);
      print(loginResponse['data']['user']['id']);
      print(loginResponse['data']['user']['username']);
      print(loginResponse['data']['user']['id'].toString());

      // SAVE DATA USER
      await LocalStorage().setDataUser(dataUser: loginResponse['data']['user']);
      await LocalStorage().setUsername(username: loginResponse['data']['user']['username'] ?? '');
      await LocalStorage().setAccessToken(token: loginResponse['data']['token']);
      await LocalStorage().setFullName(fullName: loginResponse['data']['user']['fullname'] ?? '');
      await LocalStorage().setRoleID(roleID: loginResponse['data']['user']['roleId']);
      await LocalStorage().setUserID(userID: loginResponse['data']['user']['id']);
      await FirebaseMessaging.instance.subscribeToTopic(loginResponse['data']['user']['id'].toString());
      doInPost();
      clear();
    });
    isLoading.value = false;
  }

  clear() {
    email.clear();
    password.clear();
  }

  getUrl() async {
    try {
      var response = await Dio().get('https://77fa-103-19-109-1.ngrok-free.app');
      BaseOptions(headers: {"Content-Type": "application/json"});
      print('respons ' + response.toString());
    } catch (error) {}
  }

  redirectTo() async {
    int? roleId = await LocalStorage().getRoleID();
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

  // loginWithGoogle(BuildContext context, {required Function() doInPost}) async {
  //   isLoading.value = true;
  //   await ErrorConfig.doAndSolveCatchInContext(context, () async {
  //     try {
  //       final GoogleSignIn _googleSignIn = GoogleSignIn();
  //       GoogleSignInAccount? account = await _googleSignIn.signIn();
  //       if (account == null) {
  //         // User canceled the sign-in process.
  //         return;
  //       }

  //       // You can now access user information through the "account" object
  //       print('Display Name: ${account.displayName}');
  //       print('Email: ${account.email}');
  //       print('Photo URL: ${account.photoUrl}');
  //       doInPost();
  //     } catch (error) {
  //       print('error heheh $error');
  //     }
  //   });
  //   isLoading.value = false;
  // }

  // logoutWithGoogle() async {
  //   final _googleSignIn = GoogleSignIn();
  //   GoogleSignInAccount? googleSignInAccount;
  //   googleSignInAccount = await _googleSignIn.signOut();
  //   print("googleSignInAccount ${googleSignInAccount?.id}");
  // }
}
