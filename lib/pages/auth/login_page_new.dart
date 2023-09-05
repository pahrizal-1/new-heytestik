import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/auth/login_facebook_page.dart';
import 'package:heystetik_mobileapps/pages/auth/login_google_page.dart';

import 'package:heystetik_mobileapps/pages/auth/phone_number_page.dart';
import 'package:heystetik_mobileapps/pages/auth/pin_customer_page.dart';
import 'package:heystetik_mobileapps/pages/bantuan_mihey/home_bantuan_minhey_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/auth/login_controller.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/button_widget.dart';
import '../../widget/snackbar_widget.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({super.key});

  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  final LoginController state = Get.put(LoginController());
  bool usernameIsFilled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Masuk Ke',
                  style: blackHigtTextStyle.copyWith(fontSize: 24),
                  children: [
                    TextSpan(
                      text: ' Heystetik',
                      style: grenTextStyle.copyWith(fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: state.email,
                decoration: InputDecoration(
                  labelText: 'Email atau Nomor Handphone',
                  labelStyle: blackTextStyle.copyWith(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              ' Contoh: 085211233456',
              style: subTitleTextStyle.copyWith(fontSize: 13),
            ),
            SizedBox(
              height: 2,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                  context: context,
                  builder: (context) => Container(
                    height: 246,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 33, top: 47, right: 45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lupa Kata Sandi?',
                            style: blackTextStyle.copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Text(
                            'Kami akan kirimkan Kata Sandi Anda\nke email yang terdaftar di akun Heystetik.',
                            style: blackHigtTextStyle.copyWith(
                                fontWeight: regular, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(color: greenColor),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Batal',
                                        style: TextStyle(
                                          color: greenColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Lanjut',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lupa Kata Sandi',
                    style: grenTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ButtonGreenWidget(
              onPressed: () async {
                if (state.email.value.text != "") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PinPageCustomer(),
                    ),
                  );
                } else {
                  SnackbarWidget.getErrorSnackbar(
                    context,
                    'Info',
                    'Email Tidak Boleh Kosong',
                  );
                }
              },
              title: 'Selanjutnya',
            ),
            SizedBox(
              height: 33,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: greyColor,
                      height: 36,
                    ),
                  ),
                ),
                Text(
                  'atau daftar dengan',
                  style: greyTextStyle,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: greyColor,
                      height: 36,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 23,
            ),
            InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginGooglePage(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/Frame 70.png',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => LoginFacebookPage(),
                //   ),
                // );
                Uri _url = Uri.parse("${Global.BASE_API}/auth/facebook/login");
                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              },
              child: InkWell(
                child: Image.asset(
                  'assets/icons/Frame 71.png',
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              child: Image.asset(
                'assets/icons/Frame 72.png',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun Heystetik?',
                  style: greyTextStyle.copyWith(fontSize: 14),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneNumberPage(),
                      ),
                    );
                  },
                  child: Text(
                    ' Daftar',
                    style: grenTextStyle.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Butuh bantuan? ',
                  style: greyTextStyle.copyWith(fontSize: 14),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeMinheyPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Hubungi Minhey',
                    style: grenTextStyle.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
