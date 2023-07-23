// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: greenColor,
      //   title: Text(
      //     'Selamat, pembayaranmu berhasil:)',
      //     style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat, pembayaranmu berhasil:)',
              style: blackRegulerTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(
              height: spaceHeigt,
            ),
            Text(
              'Sesi pembayaran berakhir :)',
              style: blackRegulerTextStyle.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
