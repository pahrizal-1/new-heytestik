import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:heystetik_mobileapps/controller/customer/register/register_controller.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

class VerificasionEmailPage extends StatelessWidget {
  const VerificasionEmailPage({super.key});

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
              'Verifikasi Email',
              style: grenTextStyle,
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
              state.email.text,
              style: blackTextStyle.copyWith(),
            ),
            const SizedBox(
              height: 18,
            ),
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: 50,
              borderColor: greenColor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                print('code otp $code');
              },
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
                GestureDetector(
                  onTap: () async {
                    await state.resendCodeEmail(context, doInPost: () async {
                      showDialog(
                        context: context,
                        builder: (context) => const TextMoreDialog(),
                      );
                    });
                  },
                  child: Text(
                    ' Kirim Ulang',
                    style: grenTextStyle.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ButtonGreenWidget(
              title: 'Konfimasi',
              onPressed: () async {
                await state.verifyEmail(context, doInPost: () async {
                  showDialog(
                    context: context,
                    builder: (context) => const TextMoreDialog(),
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
