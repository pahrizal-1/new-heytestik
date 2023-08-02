import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/metode_veifikasi_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/verifikasi_data_setings_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class KeamananAkunPage extends StatelessWidget {
  const KeamananAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: Colors.transparent,
        title: Text(
          'Keamanan Akun',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/alert-new.png',
            width: 22,
            height: 22,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 19),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MetodeVerifikasiPage()));
            },
            child: Text(
              'Ubah Kata Sandi',
              style: blackHigtTextStyle.copyWith(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          dividergrey(),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerifikasiDataSetingsPage()));
            },
            child: Text(
              'Verifikasi Data Diri',
              style: blackHigtTextStyle.copyWith(fontSize: 15),
            ),
          ),
          const Spacer(),
          const ButtonGreenWidget(title: 'Tambah Rekening Lain'),
          const SizedBox(
            height: 36,
          )
        ]),
      ),
    );
  }
}
