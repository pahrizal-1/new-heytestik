import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';
import '../../../service/customer/notification/notification_services.dart';

class NotificationCustomerController extends StateClass {
  Rx<NotificationCustomerModel> data = NotificationCustomerModel().obs;
  RxList<DataNotificationCustomerModel> notifications = List<DataNotificationCustomerModel>.empty(growable: true).obs;

  Future<List<DataNotificationCustomerModel>> getNotification(BuildContext context, int page) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await NotificationCustomerServices().listNotification(page);
      notifications.value.addAll(data.value.data!.data);
    });
    return data.value.data!.data;
  }
}
