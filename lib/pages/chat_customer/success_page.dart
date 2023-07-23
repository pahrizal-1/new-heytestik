// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/onboarding_chat_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/daftar_transaksi_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

import '../../widget/button_widget.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({super.key});
  final ConsultationController state = Get.put(ConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: greenColor,
      //   title: Text(
      //     'Pembayaran berhasil',
      //     style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
      //   ),
      // ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          title: 'Sedang mencari dokter ...',
          child: Center(
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
                  Padding(
                    padding: lsymetric,
                    child: ButtonGreenWidget(
                      title: 'Yuk Konsultasi Chat Docter',
                      onPressed: () async {
                        await state.initiateChat(
                          context,
                          'ccbfafc5-a61d-47d8-95cc-c3e9443cb8b3',
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
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
      ),
    );
  }
}
