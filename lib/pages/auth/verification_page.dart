import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:heystetik_mobileapps/pages/auth/personal_data_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/auth/register_controller.dart';
import '../../theme/theme.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: lsymetric,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verifikasi',
              style: grenTextStyle,
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              'Masukkan 6 digit kode yang telah dikirmkan ke nomor',
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              state.phoneNumber.toString(),
              style: blackTextStyle.copyWith(),
            ),
            const SizedBox(
              height: 18,
            ),
            // const OtpWidget(),
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: 60,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                state.code = verificationCode;
              }, // end onSubmit
            ),
            const SizedBox(
              height: 55,
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
              title: 'Konfimasi',
              onPressed: () async {
                await state.verifyPhoneNumber(context, doInPost: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalDataPage(),
                    ),
                  );
                });
              },
            ),
            const SizedBox(
              height: 72,
            )
          ],
        ),
      ),
    );
  }
}
