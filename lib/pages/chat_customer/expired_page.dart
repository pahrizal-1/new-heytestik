// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/button_widget.dart';

class ExpiredPage extends StatelessWidget {
  String message;
  ExpiredPage({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greenColor,
        title: Text(
          message,
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboardingchat.png',
              width: 259,
              height: 239,
            ),
            Text(
              message,
              style: blackTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(
              height: spaceHeigt,
            ),
            Text(
              'Sesi pembayaran berakhir :)',
              style: blackRegulerTextStyle.copyWith(
                  fontSize: 20, color: blackColor),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: lsymetric,
              child: ButtonGreenWidget(
                title: 'Kembali Ke Home',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabBarCustomer(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
