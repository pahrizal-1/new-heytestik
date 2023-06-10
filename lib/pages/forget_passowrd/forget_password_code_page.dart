import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/forget_passowrd/forget_password_code_password_page.dart';
import 'package:heystetik_mobileapps/widget/otp_widget.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class ForgetPasswordCodePage extends StatelessWidget {
  const ForgetPasswordCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 31),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
              const SizedBox(
                height: 32,
              ),
              Text(
                "Forgot Password",
                style: blackHigtTextStyle,
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    width: 5,
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4)),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Code Verification was sent on your email",
                        style: subGreyTextStyle,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "muhyiabdulbasith@basiht.com",
                        style: blackHigtTextStyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 30,
              ),
              const OtpWidget(),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mendapatkan kode?',
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    ' Kirim Ulang',
                    style: grenTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
              const Spacer(),
              ButtonGreenWidget(
                title: 'Send Verification',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPassworPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
