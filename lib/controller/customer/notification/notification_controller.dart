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

  Future<bool> postSettingNotif(
      BuildContext context, String type, bool isEnabled) async {
    isLoading.value = true;
    bool isSuccess = false;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "data": [
          {"type": type, "is_enabled": isEnabled}
        ]
      };
      var res = await NotificationService().postSettingNotif(data);
      if (res['success'] != true && res['message'].toString() != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'].toString(),
        );
      }
      isSuccess = res['success'];
      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Notif berhasil di ${isEnabled ? 'aktifkan' : 'non aktifkan'}',
      );
    });
    isLoading.value = false;
    return isSuccess;
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
