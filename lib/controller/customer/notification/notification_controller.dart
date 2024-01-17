// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';
import '../../../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/detail_pasien_page.dart';
import '../../../service/customer/notification/notification_services.dart';
import '../../../service/doctor/consultation/consultation_service.dart';

class NotificationCustomerController extends StateClass {
  Rx<NotificationCustomerModel> data = NotificationCustomerModel().obs;
  RxList<DataNotificationCustomerModel> notifications =
      List<DataNotificationCustomerModel>.empty(growable: true).obs;
  RxList notif = [].obs;

  Future<List<DataNotificationCustomerModel>> getNotification(
      BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await NotificationCustomerServices().listNotification(page);
      notifications.value.addAll(data.value.data!.data);
    });
    isLoading.value = false;
    return data.value.data!.data;
  }

  Future getNotificationDoctor(BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      print('masuk sini');
      var dataD =
          await NotificationCustomerServices().listNotificationDoctor(page);
      notif.value = [];
      notif.value = dataD;
    });
    isLoading.value = false;
    // return data.value.data!.data;
  }

  postApprove(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await ConsultationDoctorScheduleServices().postApprove(id);
      print('res' + res.toString());
      // Navigator.pop(context);
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
