import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/forget_passowrd/forget_password_code_page.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class ForgetPasswordEmailPage extends StatefulWidget {
  const ForgetPasswordEmailPage({super.key});

  @override
  State<ForgetPasswordEmailPage> createState() =>
      _ForgetPasswordEmailPageState();
}

class _ForgetPasswordEmailPageState extends State<ForgetPasswordEmailPage> {
  FocusNode myFocusNode = FocusNode();
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
                height: 8,
              ),
              Text(
                "Please complete this form for create account.If you need help please email on pahrizal@mail.com",
                style: subGreyTextStyle,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                focusNode: myFocusNode,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  ),
                  focusColor: greenColor,
                  labelText: 'Your Email',
                  labelStyle: TextStyle(
                    color: myFocusNode.hasFocus
                        ? greenColor
                        : const Color(0xff231F20),
                  ),
                ),
              ),
              const Spacer(),
              ButtonGreenWidget(
                title: 'Send Verification',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordCodePage(),
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
