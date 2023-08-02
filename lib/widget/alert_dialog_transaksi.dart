import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/daftar_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';

import '../theme/theme.dart';
import 'button_widget.dart';

class AlertDialogTransaksi extends StatelessWidget {
  const AlertDialogTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0),
      content: Container(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        height: 210,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonGreenWidget(
              title: 'Kembali ke home',
              onPressed: () {
                Get.offAll(const TabBarCustomer());
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonWhiteWidget(
                title: 'Lihat daftar transaksi',
                onPressed: () {
                  Get.offAll(DaftarTransaksiPage());
                }),
          ],
        ),
      ),
    );
  }
}
