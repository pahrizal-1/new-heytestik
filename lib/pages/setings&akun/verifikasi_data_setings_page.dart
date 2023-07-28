import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/verifikasi_ktp_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class VerifikasiDataSetingsPage extends StatefulWidget {
  const VerifikasiDataSetingsPage({super.key});

  @override
  State<VerifikasiDataSetingsPage> createState() =>
      _VerifikasiDataSetingsPageState();
}

class _VerifikasiDataSetingsPageState extends State<VerifikasiDataSetingsPage> {
  bool isSelected = false;

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
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/rekomendasi1.png',
              width: 213,
              height: 239,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Verifikasi datamu, yuk!',
              style: blackTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              'Upload foto KTP dan wajah biar\nakunmu makin aman',
              style: blackRegulerTextStyle.copyWith(
                  fontSize: 15, color: blackColor),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: 23,
                    padding: const EdgeInsets.all(4),
                    height: 23,
                    decoration: BoxDecoration(
                      color: isSelected ? greenColor : null,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: isSelected ? greenColor : borderColor),
                    ),
                    child: isSelected
                        ? Image.asset('assets/icons/chek_new.png')
                        : null,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text:
                          'Saya setuju untuk bagikan data KTP & foto wajah ke Heystetik sesuai Syarat',
                      style: blackRegulerTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                            text: ' dan',
                            style: greyTextStyle.copyWith(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: ' Syarat dan Ketentuan',
                                  style: grenTextStyle.copyWith(fontSize: 12))
                            ]),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            ButtonGreenWidget(
              title: 'Mulai Verifikasi',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const VerifikasiKtpPage()),
                );
              },
            ),
            const SizedBox(
              height: 36,
            )
          ],
        ),
      ),
    );
  }
}
