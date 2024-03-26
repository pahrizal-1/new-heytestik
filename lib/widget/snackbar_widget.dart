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

  static getBlockSnackbar(BuildContext context, String title, String username) {
    final snackBar = SnackBar(
      backgroundColor: blackColor,
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/centang22.png',
              width: 24,
            ),
            Text('$title @$username berhasil')
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
