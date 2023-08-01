// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/onboarding_chat_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_transaksi.dart';

import '../../widget/button_widget.dart';

class ExpiredPage extends StatefulWidget {
  bool isNotConsultation;
  String message;
  ExpiredPage(
      {this.isNotConsultation = false, required this.message, super.key});

  @override
  State<ExpiredPage> createState() => _ExpiredPageState();
}

class _ExpiredPageState extends State<ExpiredPage> {
  Future<bool> onWillPop() async {
    showDialog(
      context: context,
      builder: (context) => const AlertDialogTransaksi(),
    );
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
                  widget.message,
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
                widget.isNotConsultation
                    ? Container()
                    : Padding(
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
      ),
    );
  }
}
