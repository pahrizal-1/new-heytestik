import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../models/doctor/profile_model.dart';
import '../../../models/doctor/user_balance_model.dart';
import '../../../pages/tabbar/tabbar_doctor.dart';
import '../../../service/auth/change_password_service.dart';
import '../../../service/doctor/profile/profile_service.dart';
import '../../../service/doctor/statistic/statistic_service.dart';
import '../../../service/doctor/user_balance/user_balance_service.dart';

class DoctorProfileController extends StateClass {
  RxString selectedDate = ''.obs;
  RxString dateCount = ''.obs;
  RxString startPeriod = '2023-07-25'.obs;
  RxString endPeriod = '2023-07-29'.obs;
  RxString rangeCount = ''.obs;
  RxInt consultation = 0.obs;
  RxInt activeDay = 0.obs;
  RxInt likes = 0.obs;
  RxInt rating = 0.obs;
  RxList filtStatistic = [].obs;

  var saldo = Data().obs;
  Rx<ProfileModel> profileData = ProfileModel().obs;
  final TextEditingController pinOldController = TextEditingController();
  final TextEditingController pinNewController = TextEditingController();
  final TextEditingController nama = TextEditingController();
  final TextEditingController spesialisasi = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController noHp = TextEditingController();
  final TextEditingController jenisKelamin = TextEditingController();
  var userBalanceService = UserBalanceService();
  var profileService = ProfileService();
  var changePasswordService = ChangePasswordService();
  String? gender = 'male';

  Future getProfile() async {
    isLoading.value = true;
    var response = await profileService.getProfile();
    profileData.value = response;
    print('GetUserInfoDataDompet : ' +
        profileData.value.data!.fullname.toString());

    nama.text = profileData.value.data!.fullname.toString();
    email.text = profileData.value.data!.email.toString();
    noHp.text = profileData.value.data!.noPhone.toString();
    isLoading.value = false;
  }

  Future getUserBalance() async {
    isLoading.value = true;
    var response = await userBalanceService.getUserBalance();
    saldo.value = response;
    print('GetUserInfoDataDompet : ' + saldo.value.balance.toString());

    isLoading.value = false;
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      startPeriod.value =
          '${DateFormat('yyyy/MM/dd').format(args.value.startDate)}';
      endPeriod.value =
          '${DateFormat('yyyy/MM/dd').format(args.value.endDate ?? args.value.startDate)}';

      print('start date ' + startPeriod.toString());
      print('end date ' + endPeriod.toString());
    } else if (args.value is DateTime) {
      selectedDate.value = args.value.toString();
    } else if (args.value is List<DateTime>) {
      dateCount.value = args.value.length.toString();
    } else {
      rangeCount.value = args.value.length.toString();
    }
  }

  Future getFilterStatistic() async {
    isLoading.value = true;
    var response = await StatisticService()
        .getStatistic(startPeriod.value, endPeriod.value);
    // saldo.value = response;
    filtStatistic.add(response);
    for (var i in filtStatistic) {
      consultation.value = i['consultation'];
      activeDay.value = i['active_day'];
      likes.value = i['likes'];
      rating.value = i['rating'];
    }

    print('response' + response.toString());

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
      Get.offAll(() => const LoginPage());
      print('logout dokter');
    });
  }
}
