import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page_new.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_doctor.dart';
import 'package:heystetik_mobileapps/service/auth/change_password_service.dart';
import 'package:heystetik_mobileapps/service/auth/login_service.dart';

class LoginController extends StateClass {
  TextEditingController email = TextEditingController();
  TextEditingController resetEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  final emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  logIn(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (email.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Email atau Nomor Handphone harus diisi',
        );
      }
      // if (emailValid.hasMatch(email.text) == false) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Format email salah',
      //   );
      // }
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

      if (loginResponse['success'] != true &&
          loginResponse['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: loginResponse['message'],
        );
      }
      print(loginResponse);
      print(loginResponse['data']['token']);
      print(loginResponse['data']['user']['roleId']);
      print(loginResponse['data']['user']['id']);
      print(loginResponse['data']['user']['id'].toString());

      // SAVE DATA USER
      await LocalStorage().setDataUser(dataUser: loginResponse['data']['user']);
      await LocalStorage()
          .setAccessToken(token: loginResponse['data']['token']);
      await LocalStorage()
          .setRoleID(roleID: loginResponse['data']['user']['roleId']);
      await LocalStorage()
          .setUserID(userID: loginResponse['data']['user']['id']);
      await FirebaseMessaging.instance.unsubscribeFromTopic('all');
      await FirebaseMessaging.instance
          .subscribeToTopic(loginResponse['data']['user']['id'].toString());
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
      var response =
          await Dio().get('https://77fa-103-19-109-1.ngrok-free.app');
      BaseOptions(headers: {"Content-Type": "application/json"});
      print('respons ' + response.toString());
    } catch (error) {}
  }

  redirectTo() async {
    int? roleId = await LocalStorage().getRoleID();
    if (roleId == 2) {
      print('masuk ke doctor');
      Get.offAll(() => const TabBarDoctor());
    } else if (roleId == 3) {
      print('masuk ke customer');
      Get.offAll(() => const TabBarCustomer());
    }
  }

  loginWithGoogle(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        final GoogleSignIn _googleSignIn = GoogleSignIn();
        GoogleSignInAccount? account = await _googleSignIn.signIn();

        // User canceled the sign-in process.
        if (account == null) return;

        _googleSignIn.signIn().then((result) {
          result?.authentication.then((googleKey) async {
            print("accessToken " + googleKey.accessToken.toString());
            print("displayName " +
                _googleSignIn.currentUser!.displayName.toString());

            var data = {
              'token': googleKey.accessToken.toString(),
            };

            var loginResponse = await LoginService().loginWithGoogle(data);

            if (loginResponse['success'] != true &&
                loginResponse['message'] != 'Success') {
              throw ErrorConfig(
                cause: ErrorConfig.anotherUnknow,
                message: loginResponse['message'],
              );
            }
            print(loginResponse);
            print(loginResponse['data']['token']);
            print(loginResponse['data']['user']['roleId']);
            print(loginResponse['data']['user']['id']);
            print(loginResponse['data']['user']['id'].toString());

            print("loginResponse   print(loginResponse);");
            // SAVE DATA USER
            await LocalStorage()
                .setDataUser(dataUser: loginResponse['data']['user']);
            await LocalStorage()
                .setAccessToken(token: loginResponse['data']['token']);
            await LocalStorage()
                .setRoleID(roleID: loginResponse['data']['user']['roleId']);
            await LocalStorage()
                .setUserID(userID: loginResponse['data']['user']['id']);
            await FirebaseMessaging.instance.unsubscribeFromTopic('all');
            await FirebaseMessaging.instance.subscribeToTopic(
                loginResponse['data']['user']['id'].toString());

            doInPost();

            clear();
          }).catchError((err) {
            print('inner error');
          });
        }).catchError((err) {
          print('error occured');
        });
      } catch (error) {
        print('error heheh $error');
      }
    });
    isLoading.value = false;
  }

  logoutWithGoogle() async {
    final _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount;
    googleSignInAccount = await _googleSignIn.signOut();
    print("googleSignInAccount ${googleSignInAccount?.id}");
    print("logout google");
  }

  Future signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      print("result heheh $result");
    } catch (e) {
      print('error hahah $e');
    }
  }

  logoutWithFacebook() async {
    await FacebookAuth.instance.logOut();
    print("logout facebook");
  }

  forgotPassword(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'email': resetEmail.text,
      };

      var loginResponse = await ChangePasswordService().resetPassword(data);
      doInPost();
      resetEmail.clear();

      if (loginResponse['success'] != true &&
          loginResponse['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: loginResponse['message'],
        );
      }
    });
    isLoading.value = false;
  }

  backTo(int index) async {
    if (index == 1) {
      Get.offAll(() => const LoginPageNew());
    } else if (index == 2) {
      Get.back();
      Get.back();
    }
  }
}
