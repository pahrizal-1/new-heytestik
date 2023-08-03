// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

import '../../../core/global.dart';
import '../../../models/doctor/profile_model.dart';
import '../../../models/doctor/user_balance_model.dart' as UserBalance;
import '../../../pages/tabbar/tabbar_doctor.dart';
import '../../../service/auth/change_password_service.dart';
import '../../../service/doctor/profile/profile_service.dart';
import '../../../service/doctor/statistic/statistic_service.dart';
import '../../../service/doctor/user_balance/user_balance_service.dart';

class DoctorProfileController extends StateClass {
  RxString selectedDate = ''.obs;
  RxString dateCount = ''.obs;
  RxString startPeriod = ''.obs;
  RxString endPeriod = ''.obs;
  RxString rangeCount = ''.obs;
  RxInt consultation = 0.obs;
  RxInt activeDay = 0.obs;
  RxInt likes = 0.obs;
  RxInt rating = 0.obs;
  RxList filtStatistic = [].obs;
  RxList listReview = [].obs;
  RxList listOverview = [].obs;
  RxList listDetailOverview = [].obs;

  var saldo = UserBalance.Data().obs;
  Rx<ProfileModel> profileData = ProfileModel().obs;
  final TextEditingController pinOldController = TextEditingController();
  final TextEditingController pinNewController = TextEditingController();
  final TextEditingController nama = TextEditingController();
  final TextEditingController spesialisasi = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController noHp = TextEditingController();
  final TextEditingController jenisKelamin = TextEditingController();
  final TextEditingController nomorsip = TextEditingController();
  final TextEditingController nomorstr = TextEditingController();
  final TextEditingController pendidikanAkhir = TextEditingController();
  final TextEditingController tempatpraktek = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int? groupUrutan;
  int? groupRating;
  String? dataUrutan;
  int? dataRating;

  List<String> items = [
    'Laki-laki',
    'Perempuan',
  ];
  RxString dropdownValue = 'Laki-laki'.obs;

  var userBalanceService = UserBalanceService();
  var profileService = ProfileService();
  var changePasswordService = ChangePasswordService();
  String? gender = 'male';
  DateTime? date;
  File? imagePath;
  String? fileImg64;

  Future getProfile(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await profileService.getProfile();
      profileData.value = response;
      print('GetUserInfoDataDompet : ${profileData.value.data!.fullname}');

      nama.text = profileData.value.data!.fullname.toString();
      spesialisasi.text = profileData.value.data!.specialist ?? '';
      email.text = profileData.value.data!.email.toString();
      noHp.text = profileData.value.data!.noPhone.toString();
      nomorsip.text = profileData.value.data!.sip ?? '';
      nomorstr.text = profileData.value.data!.str ?? '';
      dropdownValue.value = profileData.value.data!.gender.toString();
      pendidikanAkhir.text = profileData.value.data!.education ?? '';
      date = profileData.value.data!.dob;
      tempatpraktek.text = profileData.value.data!.practiceLocation ?? '';
    });
    isLoading.value = false;
  }

  Future getUserBalance() async {
    isLoading.value = true;
    var response = await userBalanceService.getUserBalance();
    saldo.value = response;
    print('GetUserInfoDataDompet : ${saldo.value.balance}');

    isLoading.value = false;
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      startPeriod.value =
          '${DateFormat('yyyy/MM/dd').format(args.value.startDate)}';
      endPeriod.value =
          '${DateFormat('yyyy/MM/dd').format(args.value.endDate ?? args.value.startDate)}';

      print('start date $startPeriod');
      print('end date $endPeriod');
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

    print('response$response');

    isLoading.value = false;
  }

  Future getReview(BuildContext context) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (dataUrutan != null && dataRating != null) {
        final params = <String, dynamic>{
          'rating_order': dataUrutan,
          'rating[]': dataRating,
        };
        print('params ' + params.toString());
        var response = await profileService.getReview(params);
        // saldo.value = response;
        print('responseeeeeee' + response.toString());
        listReview.value = response;
        print('response' + listReview.toString());
      } else if (dataUrutan != null) {
        final params = <String, dynamic>{
          'rating_order': dataUrutan,
        };
        print('params ' + params.toString());
        var response = await profileService.getReview(params);
        // saldo.value = response;
        print('responseeeeeee' + response.toString());
        listReview.value = response;
      } else if (dataRating != null) {
        final params = <String, dynamic>{
          'rating[]': dataRating,
        };
        print('params ' + params.toString());
        var response = await profileService.getReview(params);
        // saldo.value = response;
        print('responseeeeeee' + response.toString());
        listReview.value = response;
      } else {
        var response = await profileService.getReviewWithoutParams();
        // saldo.value = response;
        print('responseeeeeee' + response.toString());
        listReview.value = response;
        print('response' + listReview.toString());
      }
    });

    isLoading.value = false;
  }

  Future getOverview(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await profileService.getOverview();
      // saldo.value = response;
      listOverview.add(response);
      print('response' + listReview.toString());
    });
    isLoading.value = false;
  }

  Future getDetailOverview(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await profileService.getDetailOverview();
      // saldo.value = response;
      listDetailOverview.add(response);
      print('overview' + listDetailOverview.toString());
    });
    isLoading.value = false;
  }

  String toTimeAgoLabel(DateTime d, {bool isIntervalNumericVisible = true}) {
    final now = DateTime.now();
    final durationSinceNow = now.difference(d);

    final inDays = durationSinceNow.inDays;
    if (inDays >= 1) {
      return (inDays / 7).floor() >= 1
          ? isIntervalNumericVisible
              ? '1 week ago'
              : 'Last week'
          : inDays >= 2
              ? '$inDays days ago'
              : isIntervalNumericVisible
                  ? '1 day ago'
                  : 'Yesterday';
    }

    final inHours = durationSinceNow.inHours;
    if (inHours >= 1) {
      return inHours >= 2
          ? '$inHours hours ago'
          : isIntervalNumericVisible
              ? '1 hour ago'
              : 'An hour ago';
    }

    final inMinutes = durationSinceNow.inMinutes;
    if (inMinutes >= 2) {
      return inMinutes >= 2
          ? '$inMinutes minutes ago'
          : isIntervalNumericVisible
              ? '1 minute ago'
              : 'A minute ago';
    }

    final inSeconds = durationSinceNow.inSeconds;
    return inSeconds >= 3 ? '$inSeconds seconds ago' : 'Just now';
  }

  dateString() {
    if (date == null) {
      return 'Edit Tanggal Lahir';
    } else {
      return '${date?.year}-${date?.month}-${date?.day}';
    }
  }

  updateProfile(BuildContext context) async {
    isLoading.value = true;

    try {
      var response = await dio.Dio().patch(
        Uri.encodeFull(Global.BASE_API + '/profile/doctor'),
        data: dio.FormData.fromMap({
          'fullname': nama.text,
          'email': email.text,
          'specialist': spesialisasi.text,
          'no_phone': noHp.text,
          'gender': dropdownValue.value,
          'dob': date!.toIso8601String(),
          'sip': nomorsip.text,
          'str': nomorstr.text,
          'education': pendidikanAkhir.text,
          'practice_location': tempatpraktek.text,
          'files': await dio.MultipartFile.fromFile(imagePath!.path),
        }),
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
            'User-Agent': await userAgent(),
          },
          validateStatus: (statusCode) {
            debugPrint('status code $statusCode');
            if (statusCode == null) {
              debugPrint('status code null');
              return false;
            }
            debugPrint('status code statusCode >= 200 && statusCode < 300');
            return statusCode >= 200 && statusCode < 300;
          },
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TabBarDoctor(),
        ),
      );
    } catch (e) {
      print('err ${e}');
    }

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

  postCloseAccount(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      isLoading.value = true;
      var res = await profileService.closedAccount();
      await logout(context);
      isLoading.value = false;
    });
  }

  logout(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      await LocalStorage().removeAccessToken();
      int userID = await LocalStorage().getUserID() ?? 0;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await FirebaseMessaging.instance.unsubscribeFromTopic('all');
        await FirebaseMessaging.instance
            .unsubscribeFromTopic(userID.toString());
      });
      Get.offAll(() => const LoginPage());
      print('logout dokter');
    });
  }
}
