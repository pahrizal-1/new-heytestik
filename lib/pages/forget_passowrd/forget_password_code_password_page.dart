import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class ForgetPassworPage extends StatefulWidget {
  const ForgetPassworPage({super.key});

  @override
  State<ForgetPassworPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPassworPage> {
  bool _obscureText = true;
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
                "Create New Password",
                style: blackHigtTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Code Verification was sent on your email",
                style: subGreyTextStyle,
                textAlign: TextAlign.left,
              ),
              Text(
                "LoremIpsum@mail.com",
                style: blackTextStyle,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  ),
                  focusColor: greenColor,
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          _obscureText = !_obscureText;
                        },
                      );
                    },
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: greyColor,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: myFocusNode.hasFocus
                        ? greenColor
                        : const Color(0xff231F20),
                  ),
                ),
              ),
              const Spacer(),
              ButtonGreenWidget(
                title: 'Save',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
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
