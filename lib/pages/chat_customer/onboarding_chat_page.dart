import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import "package:heystetik_mobileapps/theme/theme.dart";
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class OnboardingChat extends StatelessWidget {
  const OnboardingChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 90,
              color: greenColor,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Chat',
                            style: whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Image.asset(
                              'assets/icons/icon-home.png',
                              width: 20,
                              color: whiteColor,
                            )),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/profiledummy.png')),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ),
            SizedBox(
              height: 113,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 239,
                    width: 259,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboardingchat.png'))),
                  ),
                  Text(
                    'Kamu belum memiliki konsultasi\napapun :(',
                    style: blackTextStyle.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: lsymetric,
              child: ButtonGreenWidget(
                title: 'Mulai Konsultasi',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectConditionsPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
