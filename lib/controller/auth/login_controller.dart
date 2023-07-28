import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_doctor.dart';
import 'package:heystetik_mobileapps/service/auth/login_service.dart';

class LoginController extends StateClass {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

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
      print(loginResponse);
      print(loginResponse['data']['token']);
      print(loginResponse['data']['user']['fullname']);
      print(loginResponse['data']['user']['roleId']);
      print(loginResponse['data']['user']['id']);
      await LocalStorage().setAccessToken(token: loginResponse['data']['token']);
      await LocalStorage().setFullName(fullName: loginResponse['data']['user']['fullname']);
      await LocalStorage().setRoleID(roleID: loginResponse['data']['user']['roleId']);
      await LocalStorage().setUserID(userID: loginResponse['data']['user']['id']);
      doInPost();
      clear();
    });
    isLoading.value = false;
  }

  clear() {
    email.clear();
    password.clear();
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

  loginWithGoogle(BuildContext context, {required Function() doInPost}) async {
    try {
      isLoading.value = true;
      await ErrorConfig.doAndSolveCatchInContext(context, () async {
        const List<String> scopes = <String>[
          'email',
        ];

        GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: scopes,
        );

        print("DISINI");
        await _googleSignIn.signIn();
        // await _googleSignIn.requestScopes(scopes);

        _googleSignIn.onCurrentUserChanged
            .listen((GoogleSignInAccount? account) async {
              print(account);
        });

          print("DISINI");
        print(await _googleSignIn.isSignedIn());

        if (await _googleSignIn.isSignedIn()) {
          final googleAuth = await _googleSignIn.currentUser?.authentication;
          print(googleAuth!.accessToken);
        }

        doInPost();
      });
      isLoading.value = false;
    } catch(error) {
      print(error);
    }
  }
}
