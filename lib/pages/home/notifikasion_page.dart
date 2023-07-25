import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';

class NotifikasionPage extends StatelessWidget {
  const NotifikasionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XfFFFFFFf),
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Text(
          'Notifikasi',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/alert-new.png',
                    color: greenColor,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Info',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    '1 jam lalu',
                    style: subTitleTextStyle.copyWith(fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Dokter mengirim pesan untukmu! 📨',
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Yuk! Baca sekarang :)',
                style: subTitleTextStyle.copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 22,
              ),
              dividergrey(),
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/alert-new.png',
                    color: greenColor,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Info',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    '1 jam lalu',
                    style: subTitleTextStyle.copyWith(fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Yeay, Transkasimu berhasil! 🎉🎉',
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Sekarang kamu bisa konsultasi dengan Dokter melalui chat room yang tersedia',
                style: subTitleTextStyle.copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                decoration: BoxDecoration(
                    color: greenColor, borderRadius: BorderRadius.circular(7)),
                child: Text(
                  'Chat Dokter',
                  style: whiteTextStyle.copyWith(fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
