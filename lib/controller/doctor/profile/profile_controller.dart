import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page.dart';

import '../../../models/doctor/profile_model.dart';
import '../../../models/doctor/user_balance_model.dart';
import '../../../pages/tabbar/tabbar_doctor.dart';
import '../../../service/auth/change_password_service.dart';
import '../../../service/doctor/profile/profile_service.dart';
import '../../../service/doctor/user_balance/user_balance_service.dart';

class DoctorProfileController extends StateClass {
  var saldo = Data().obs;
  Rx<ProfileModel> profileData = ProfileModel().obs;
  final TextEditingController pinOldController = TextEditingController();
  final TextEditingController pinNewController = TextEditingController();
  var userBalanceService = UserBalanceService();
  var profileService = ProfileService();
  var changePasswordService = ChangePasswordService();

  Future getProfile() async {
    isLoading.value = true;
    var response = await profileService.getProfile();
    profileData.value = response;
    print('GetUserInfoDataDompet : ' + profileData.value.data!.fullname.toString());

    isLoading.value = false;
  }

  Future getUserBalance() async {
    isLoading.value = true;
    var response = await userBalanceService.getUserBalance();
    saldo.value = response;
    print('GetUserInfoDataDompet : ' + saldo.value.balance.toString());

    isLoading.value = false;
  }

  updatePassword(BuildContext context, String oldpin, String newpin) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'old_password': oldpin,
        'new_password': newpin,
      };

      var response = await changePasswordService.changePassword(data);
      Get.off(() => TabBarDoctor());
      print(response);

    });
    isLoading.value = false;
  }

  logout(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      await LocalStorage().removeAccessToken();
      Get.off(() => const LoginPage());
      print('logout dokter');
    });
  }
}
