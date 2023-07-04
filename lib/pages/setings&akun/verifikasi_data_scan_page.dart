import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/poto_ktp_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/poto_wajah_page.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class VerifikasiDataScan extends StatelessWidget {
  const VerifikasiDataScan({super.key});

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
                  'Verifikasi Data Diri ',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          Center(
            child: Text(
              '2/3',
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
                width: 241,
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
            padding: const EdgeInsets.only(top: 60, left: 81, right: 81),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/sca-poto.png',
                  width: 240,
                  height: 210,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Scan wajah kamu',
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
                  'Kami akan scan wajahmu untuk cocokkan data di KTP. Ikuti instruksi ini:',
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
                      'Jangan pakai aksesoris yang menutupi wajahmu.',
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
                    Expanded(
                      child: Text(
                        'Pastikan wajahmu terkena pencahayaan yang cukup dan terlihat jelas.',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      ),
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
                  title: 'Mulai Verifikasi Wajah ',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PotoWajahPage(),
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
