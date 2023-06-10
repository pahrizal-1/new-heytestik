import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import "package:heystetik_mobileapps/theme/theme.dart";
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class OnboardingChat extends StatelessWidget {
  const OnboardingChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Row(
          children: const [
            Text('Chat'),
          ],
        ),
        actions: [
          Padding(
            padding: lsymetric,
            child: Row(
              children: [
                const Icon(Icons.notifications_outlined),
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  'assets/images/putihgading.png',
                  width: 24,
                ),
              ],
            ),
          )
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 115, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/chat_page.png',
                      width: 260,
                    ),
                    Text(
                      'Kamu belum memiliki konsultasi apapun :(',
                      style: blackTextStyle.copyWith(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonGreenWidget(
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
            ],
          ),
        ),
      ),
    );
  }
}
