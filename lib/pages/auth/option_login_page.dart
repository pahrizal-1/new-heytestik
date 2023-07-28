import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/auth_page.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page.dart';
import 'package:heystetik_mobileapps/pages/auth/phone_number_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class OptionLoginPage extends StatelessWidget {
  const OptionLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 29,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Back',
                        style: greyTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    Image.asset(
                      'assets/icons/logo-hestetikc.png',
                      width: 104,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: blackHigtTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
                    style: subGreyTextStyle,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonSignWidget(
                img: 'assets/images/button phone.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
              ButtonSignWidget(
                img: 'assets/images/Frame 29.png',
                onPressed: () {},
              ),
              ButtonSignWidget(
                img: 'assets/images/Frame 28.png',
                onPressed: () {},
              ),
              ButtonSignWidget(
                img: 'assets/images/Frame 26.png',
                onPressed: () {},
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have account? ',
                    style: subGreyTextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneNumberPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
