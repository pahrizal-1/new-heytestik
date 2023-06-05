import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/option_login_page.dart';
import 'package:heystetik_mobileapps/pages/auth/phone_number_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(left: paddingL, right: paddingL, top: 446),
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
                style: greyTextStyle.copyWith(fontSize: 16, color: blackColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 31,
              ),
              ButtonGreenWidget(
                title: 'Masuk',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OptionLoginPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              ButtonWhiteWidget(
                title: "Daftar",
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
            ],
          ),
        ),
      ),
    );
  }
}
