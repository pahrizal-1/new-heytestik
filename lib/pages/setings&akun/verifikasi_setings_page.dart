import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class VerifikasiSetingsPage extends StatefulWidget {
  const VerifikasiSetingsPage({super.key});

  @override
  State<VerifikasiSetingsPage> createState() => _VerifikasiSetingsPageState();
}

class _VerifikasiSetingsPageState extends State<VerifikasiSetingsPage> {
  final ProfileController state = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (BuildContext context) =>
              //           VerifikasiDataSetingsPage()),
              // );
            },
            child: Image.asset(
              'assets/icons/more-six.png',
              width: 15,
              height: 15,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verifikasi Code',
                style: grenTextStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Masukkan 6 digit kode yang telah dikirmkan ke Whatsapp',
                style: greyTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '****-****-*645',
                style: blackTextStyle.copyWith(),
              ),
              const SizedBox(
                height: 18,
              ),
              OtpTextField(
                focusedBorderColor: greenColor,
                disabledBorderColor: borderColor,
                enabledBorderColor: borderColor,
                numberOfFields: 5,
                fieldWidth: 50,
                borderColor: greenColor,
                showFieldAsBox: true,
                onSubmit: (String verifCode) {
                  print(verifCode);
                  setState(() {
                    state.otp.value = verifCode;
                  });
                  print(state.otp.value);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '00:20',
                        style: subTitleTextStyle,
                      ))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonGreenWidget(
                title: 'Simpan',
                onPressed: () {
                  state.updatePhone(context);
                  // state.verifyCode(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mendapatkan kode?',
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      state.verifyCode(
                          context, 'WHATSAPP', 'CHANGE_PHONE_NUMBER');
                    },
                    child: Text(
                      ' Kirim Ulang',
                      style: grenTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifikasiEmailSetingsPage extends StatefulWidget {
  const VerifikasiEmailSetingsPage({super.key});

  @override
  State<VerifikasiEmailSetingsPage> createState() => _VerifikasiEmailSetingsPageState();
}

class _VerifikasiEmailSetingsPageState extends State<VerifikasiEmailSetingsPage> {
  final ProfileController state = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (BuildContext context) =>
              //           VerifikasiDataSetingsPage()),
              // );
            },
            child: Image.asset(
              'assets/icons/more-six.png',
              width: 15,
              height: 15,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verifikasi Code',
                style: grenTextStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Masukkan 6 digit kode yang telah dikirmkan ke Email',
                style: greyTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '*******@gmail.com',
                style: blackTextStyle.copyWith(),
              ),
              const SizedBox(
                height: 18,
              ),
              OtpTextField(
                focusedBorderColor: greenColor,
                disabledBorderColor: borderColor,
                enabledBorderColor: borderColor,
                numberOfFields: 5,
                fieldWidth: 50,
                borderColor: greenColor,
                showFieldAsBox: true,
                onSubmit: (String verifCode) {
                  print(verifCode);
                  setState(() {
                    state.otp.value = verifCode;
                  });
                  print(state.otp.value);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '00:20',
                        style: subTitleTextStyle,
                      ))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonGreenWidget(
                title: 'Simpan',
                onPressed: () {
                  state.updateEmail(context);
                  // state.verifyCode(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mendapatkan kode?',
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      state.verifyCode(
                          context, 'WHATSAPP', 'CHANGE_PHONE_NUMBER');
                    },
                    child: Text(
                      ' Kirim Ulang',
                      style: grenTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
