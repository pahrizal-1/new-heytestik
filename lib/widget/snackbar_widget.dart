import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class SnackbarWidget {
  static getSuccessSnackbar(
      BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: greenColor,
        duration: Duration(milliseconds: 1300),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  static getErrorSnackbar(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Get.theme.colorScheme.error,
        duration: Duration(milliseconds: 1300),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
