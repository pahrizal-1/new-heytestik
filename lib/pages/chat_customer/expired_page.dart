// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/onboarding_chat_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/button_widget.dart';

class ExpiredPage extends StatelessWidget {
  String message;
  ExpiredPage({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                'Sesi pembayaran habis, silahkan beli konsultasi lagi',
                textAlign: TextAlign.center,
                style: blackRegulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: lsymetric,
                child: ButtonWhiteWidget(
                  title: 'Konsultasi Lagi',
                  onPressed: () async {
                    Get.to(const OnboardingChat());
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: lsymetric.copyWith(bottom: 40),
                child: ButtonGreenWidget(
                  title: 'Kembali Ke Home',
                  onPressed: () {
                    Get.offAll(const TabBarCustomer());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
