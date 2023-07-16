import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/auth_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/text_form_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/customer/register/register_controller.dart';
import '../../widget/more_dialog_widget.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  bool _obscureText = true;
  bool _isGender = true;
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 42,
                ),
                Text(
                  'Isi data dirimu dulu, ya.',
                  style: blackHigtTextStyle,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Informasi dirimu akan berguna untuk melanjutkan tanya jawab hingga penerimaan rekomendasi skincare dan treatment.',
                  style: greyTextStyle,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Jenis Kelamin',
                  style: blackTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isGender = true;
                            state.gender = 'Laki-laki';
                          });
                        },
                        child: Container(
                          height: 40,
                          // width: MediaQuery.of(context).size.width,
                          decoration: _isGender
                              ? BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(7),
                                )
                              : BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                          child: Center(
                            child: Text('Laki - laki',
                                style: _isGender
                                    ? TextStyle(color: whiteColor, fontSize: 12)
                                    : blackTextStyle),
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
                          setState(() {
                            _isGender = false;
                            state.gender = 'Perempuan';
                          });
                        },
                        child: Container(
                          height: 40,
                          // width: MediaQuery.of(context).size.width,
                          decoration: _isGender
                              ? BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(7),
                                )
                              : BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                          child: Center(
                            child: Text(
                              'Perempuan',
                              style: _isGender
                                  ? blackTextStyle
                                  : TextStyle(color: whiteColor, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormWidget(
                  controller: state.fullName,
                  title: 'Nama Lengkap',
                  hintText: 'Nama Depan',
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: blackTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: state.email,
                      decoration: InputDecoration(
                        fillColor: greenColor,
                        hoverColor: greenColor,
                        suffixIcon: Icon(
                          Icons.email_outlined,
                          color: greyColor,
                        ),
                        hintText: 'Email',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: blackTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: state.password,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        fillColor: greenColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greenColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        hoverColor: greenColor,
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
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormWidget(
                      controller: state.referralCode,
                      title: 'Kode Referral',
                      hintText: 'Kode Referral',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Dengan klik “Daftar”, kamu mnyetujui',
                            style: greyTextStyle.copyWith(fontSize: 12),
                            children: [
                              TextSpan(
                                text: ' kebijakan Privasi',
                                style: grenTextStyle.copyWith(fontSize: 13),
                                children: [
                                  TextSpan(
                                    text: ' dan',
                                    style: greyTextStyle.copyWith(fontSize: 12),
                                    children: [
                                      TextSpan(
                                        text: ' Syarat dan Ketentuan',
                                        style: grenTextStyle.copyWith(
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ButtonGreenWidget(
                          title: 'Daftar',
                          onPressed: () async {
                            await state.register(context, doInPost: () async {
                              showDialog(
                                context: context,
                                builder: (context) => const MoreDialog(),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: greyColor,
                            height: 36,
                          )),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonCostumWidget(
                      img: 'assets/icons/logo-google.png',
                      colors: redColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ButtonCostumWidget(
                      img: 'assets/icons/logo-fb.png',
                      colors: blueColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah Punya Akun?',
                      style: greyTextStyle.copyWith(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ),
                        );
                      },
                      child: Text(
                        '  Masuk',
                        style: grenTextStyle.copyWith(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 61,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
