import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heystetik_mobileapps/controller/auth/login_controller.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class ForgetPasswordEmailPage extends StatefulWidget {
  final int redirectTo;

  const ForgetPasswordEmailPage({super.key, required this.redirectTo});

  @override
  State<ForgetPasswordEmailPage> createState() =>
      _ForgetPasswordEmailPageState();
}

class _ForgetPasswordEmailPageState extends State<ForgetPasswordEmailPage> {
  bool _obscureText = true;
  FocusNode myFocusNode = FocusNode();
  final LoginController state = Get.put(LoginController());

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
                controller: state.resetEmail,
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
                  state.forgotPassword(context, doInPost: () async {
                    print(widget.redirectTo);
                    // Navigator.pop(context);
                    state.backTo(widget.redirectTo);
                    SnackbarWidget.getSuccessSnackbar(
                      context,
                      'Info',
                      'Harap cek email kamu ya',
                    );
                  });
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
