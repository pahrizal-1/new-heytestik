import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/auth_page.dart';
import 'package:heystetik_mobileapps/pages/auth/info_personal_page.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_account_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/timeline_widget.dart';
import 'package:provider/provider.dart';

import '../controller/auth/register_controller.dart';

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        height: 310,
        width: 400,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/danger-icons.png',
                        width: 17,
                      )),
                ],
              ),
            ),
            Text(
              'Status Akun',
              style: blackHigtTextStyle.copyWith(fontSize: 24),
            ),
            Text(
              'Yuk, lengkapi profil Heystetik-mu :)',
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeMoreDialogPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: "assets/images/iphone1.png",
                  width: 18,
                  iconimg: 'assets/images/check.png',
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Email',
                  img: 'assets/icons/email-icons.png',
                  width: 30,
                  iconimg: "assets/images/Vector.png",
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Info Personal',
                  img: "assets/images/iphone1.png",
                  width: 20,
                  iconimg: "assets/images/Vector.png",
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Beauty Profile',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: "assets/images/Vector.png",
                ),
                TimeMoreDialogPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: true,
                  title: 'Skin Goals',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonGreenWidget(
              title: 'Lengkapi Profil',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerificationAcooutPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TextMoreDialog extends StatelessWidget {
  const TextMoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      content: Container(
        padding: EdgeInsets.only(left: 39, right: 39, top: 39),
        height: 210,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verifikasi Berhasil',
              style: blackHigtTextStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Yey! Email ${state.email.text} telah berhasil terverifikasi.',
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoPersonalPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lanjut',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilMoreDialog extends StatefulWidget {
  const ProfilMoreDialog({super.key});

  @override
  State<ProfilMoreDialog> createState() => _ProfilMoreDialogState();
}

class _ProfilMoreDialogState extends State<ProfilMoreDialog> {
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const AuthPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(1),
      content: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profilelengkap.png',
              width: 170,
            ),
            Text(
              'Yeaay!',
              style: blackHigtTextStyle.copyWith(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Akun Profilmu Sudah lengkap',
              style: greyTextStyle.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
