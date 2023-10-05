import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page_new.dart';
import 'package:heystetik_mobileapps/pages/auth/phone_number_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 25, right: 25, top: 380),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Auth-screen.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Selamat Datang \ndi Heystetik!',
                      style: TextStyle(
                        color: greenColor,
                        fontWeight: bold,
                        fontSize: 40,
                        fontFamily: 'Proxima Nova',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Platform direktori informasi tips kecantikan, perawatan, skincare & tanya jawab dengan dokter spesialis kulit.',
                      style: TextStyle(fontSize: 16, color: blackColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    ButtonGreenWidget(
                      title: 'MASUK',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPageNew(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ButtonWhiteWidget(
                      title: 'DAFTAR',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhoneNumberPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text.rich(
                      TextSpan(
                        text:
                            'Dengan ‘Masuk’ atau ‘Daftar’, kamu setuju dengan',
                        style: greyTextStyle.copyWith(fontSize: 13),
                        children: [
                          TextSpan(
                            text: " Kebijakan Privasi",
                            style: grenTextStyle.copyWith(
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                  text: " dan",
                                  style: greyTextStyle.copyWith(fontSize: 13),
                                  children: [
                                    TextSpan(
                                        text: " Syarat dan Ketentuan",
                                        style: grenTextStyle.copyWith(
                                            fontSize: 13))
                                  ]),
                            ],
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
