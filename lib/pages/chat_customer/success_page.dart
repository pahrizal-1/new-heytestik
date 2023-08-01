// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/approve_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/onboarding_chat_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/daftar_transaksi_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_transaksi.dart';

import '../../widget/button_widget.dart';

class SuccessPage extends StatefulWidget {
  bool isNotConsultation;
  String orderId;

  SuccessPage(
      {this.isNotConsultation = false, required this.orderId, super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/rekomendasi1.png',
                  width: 220,
                  height: 220,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Selamat, pembayaranmu berhasil:)',
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: spaceHeigt,
                ),
                Text(
                  'Silakan cek status pesananmu di Daftar Transaksi',
                  style: blackRegulerTextStyle.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                widget.isNotConsultation
                    ? Container()
                    : Padding(
                        padding: lsymetric,
                        child: ButtonGreenWidget(
                          title: 'Yuk Konsultasi Chat Docter',
                          onPressed: () async {
                            Get.to(ApprovePage(
                              orderId: widget.orderId,
                            ));
                          },
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                widget.isNotConsultation
                    ? Container()
                    : Padding(
                        padding: lsymetric,
                        child: ButtonGreenWidget(
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
                  padding: lsymetric,
                  child: ButtonWhiteWidget(
                    title: 'Liat Daftar Transaksi',
                    onPressed: () async {
                      Get.to(DaftarTransaksiPage());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
