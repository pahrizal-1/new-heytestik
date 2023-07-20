import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/auth/login_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/option_login_page.dart';
import 'package:heystetik_mobileapps/pages/forget_passowrd/forget_password_email_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController state = Get.put(LoginController());
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OptionLoginPage(),
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
              const SizedBox(
                height: 32,
              ),
              Text(
                'Sign In',
                style: blackHigtTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Please complete this form for create account.If you need help please email on pahrizal@mail.com',
                style: subGreyTextStyle,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: state.email,
                focusNode: myFocusNode,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  ),
                  focusColor: greenColor,
                  labelText: 'Email Or Phone Number',
                  labelStyle: TextStyle(
                    color: myFocusNode.hasFocus
                        ? greenColor
                        : const Color(0xff231F20),
                  ),
                ),
              ),
              TextFormField(
                controller: state.password,
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
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => LoadingWidget(
                  isLoading: state.isLoading.value,
                  child: ButtonGreenWidget(
                    title: 'Sign In',
                    onPressed: () async {
                      await state.logIn(context, doInPost: () async {
                        await state.redirectTo();
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordEmailPage(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Forgot Password',
                    style: greyTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
