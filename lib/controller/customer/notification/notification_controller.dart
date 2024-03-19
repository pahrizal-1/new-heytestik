// ignore_for_file: invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';
import 'package:heystetik_mobileapps/models/customer/setting_notif_model.dart'
    as SettingNotif;
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import '../../../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/detail_pasien_page.dart';
import '../../../service/customer/notification/notification_service.dart';
import '../../../service/doctor/consultation/consultation_service.dart';

class NotificationController extends StateClass {
  Rx<NotificationCustomerModel> data = NotificationCustomerModel().obs;
  RxList<DataNotificationCustomerModel> notifications =
      List<DataNotificationCustomerModel>.empty(growable: true).obs;
  RxList notif = [].obs;

  Future<List<DataNotificationCustomerModel>> getNotification(
      BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await NotificationService().listNotification(page);
      notifications.value.addAll(data.value.data!.data);
    });
    isLoading.value = false;
    return data.value.data!.data;
  }

  Future<List<SettingNotif.Data>> getSettingNotif(BuildContext context) async {
    isLoading.value = true;
    List<SettingNotif.Data>? data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await NotificationService().getSettingNotif();
      data = res.data;
    });
    isLoading.value = false;
    return data ?? [];
  }

  Future<bool> postSettingNotif(BuildContext context,
      {required List data, bool? isEnabled, bool isJeda = false}) async {
    isLoading.value = true;
    bool isSuccess = false;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var req = {"data": data};
      var res = await NotificationService().postSettingNotif(req);
      if (res['success'] != true && res['message'].toString() != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'].toString(),
        );
      }
      isSuccess = res['success'];
      if (isJeda) {
        SnackbarWidget.getSuccessSnackbar(
          context,
          'Berhasil',
          isEnabled == true
              ? 'Jeda semua notifikasi dimatikan'
              : 'Jeda semua notifikasi berhasil',
        );
      } else {
        SnackbarWidget.getSuccessSnackbar(
          context,
          'Berhasil',
          'Notifikasi berhasil di ${isEnabled == true ? 'aktifkan' : 'non aktifkan'}',
        );
      }
    });
    isLoading.value = false;
    return isSuccess;
  }

  void postNotifAcitivityPosts(
      BuildContext context, int userId, bool isEnabled) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List data = [
        {"type": "NOTIF_ACTIVITY_POSTS", "is_enabled": isEnabled}
      ];
      var req = {"data": data};
      var res =
          await NotificationService().postNotifAcitivityPosts(req, userId);
      print(res);
      if (res['success'] && res['message'] == 'Success') {
        SnackbarWidget.getSuccessSnackbar(
          context,
          'Berhasil',
          'Notifikasi aktifitas postingan berhasil di ${isEnabled == true ? 'aktifkan' : 'non aktifkan'}',
        );
      }
    });
    isLoading.value = false;
  }

  Future<List<SettingNotif.Data>> getNotifAcitivityPosts(
      BuildContext context, int userId) async {
    isLoading.value = true;
    List<SettingNotif.Data>? data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await NotificationService().getNotifAcitivityPosts(userId);
      data = res.data;
    });
    isLoading.value = false;
    return data ?? [];
  }

  Future getNotificationDoctor(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      print('masuk sini');
      var dataD = await NotificationService().listNotificationDoctor(page);
      notif.value = [];
      notif.value = dataD;
    });
    isLoading.value = false;
  }

  postApprove(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await ConsultationDoctorScheduleServices().postApprove(id);
      print('res' + res.toString());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPasienPage(id: id),
        ),
      );
    });
    isLoading.value = false;
  }
}
