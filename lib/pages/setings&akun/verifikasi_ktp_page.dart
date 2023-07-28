import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import 'camera_ktp_setings_page.dart';

class VerifikasiKtpPage extends StatelessWidget {
  const VerifikasiKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: Colors.transparent,
        title: Text(
          'Verifikasi Data Diri ',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
        actions: [
          Center(
            child: Text(
              '1/3',
              style: subTitleTextStyle.copyWith(
                  fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 2,
                width: 148,
                decoration: BoxDecoration(color: greenColor),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(color: borderColor),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 83, right: 83),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: 4,
                      left: 3,
                      child: Image.asset(
                        'assets/icons/ktp.png',
                        width: 224,
                        height: 141,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/kontak.png',
                      width: 230,
                      height: 148,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Foto bagian depan KTP',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 45,
                ),
                Text(
                  'Yuk, ikuti cara berikut:',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 15, color: blackColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Gunakan KTP asli yang masih berlaku .',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: blackColor),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Pastikan foto KTP berada dalam bingkai.',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: blackColor),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'PPastikan foto KTP terlihat terang dan jelas.',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: blackColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/check_button_green.png',
                      width: 15,
                      height: 17,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Heystetik menjamin keamanan datamu',
                      style: blackRegulerTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                ButtonGreenWidget(
                  title: 'Ambil Foto KTP',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraCutomeKTP(),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
