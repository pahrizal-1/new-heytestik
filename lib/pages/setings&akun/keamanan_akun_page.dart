import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/metode_veifikasi_page.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Keamanan Akun',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
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
          Text(
            'Ubah Kata Sandi',
            style: blackHigtTextStyle.copyWith(fontSize: 15),
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
                      builder: (context) => const MetodeVerifikasiPage()));
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
