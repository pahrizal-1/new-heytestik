// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/button_widget.dart';

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
              SizedBox(
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
                'Silakan Cek Pesananmu yaa Di Transaksi',
                style: blackRegulerTextStyle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonGreenWidget(
                title: 'Yuk Konsultasi Chat Docter',
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonGreenWidget(
                title: 'Konsultasi Lagi',
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWhiteWidget(
                title: 'Liat Daftar Transaksi',
              )
            ],
          ),
        ),
      ),
    );
  }
}
