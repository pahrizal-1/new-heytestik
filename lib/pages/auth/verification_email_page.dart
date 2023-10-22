// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/register/register_controller.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/snackbar_widget.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              focusedBorderColor: greenColor,
              disabledBorderColor: borderColor,
              enabledBorderColor: borderColor,
              numberOfFields: 5,
              fieldWidth: 50,
              borderColor: greenColor,
              showFieldAsBox: true,
              borderRadius: BorderRadius.circular(7),
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
                    await state.registerEmail(context, doInPost: () async {
                      SnackbarWidget.getSuccessSnackbar(
                        context,
                        'Info',
                        'OTP Berhasil Dikirim',
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
            Obx(
              () => LoadingWidget(
                isLoading: state.isLoading.value,
                child: ButtonGreenWidget(
                  title: 'Konfimasi',
                  onPressed: () async {
                    await state.verifyEmail(context, doInPost: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => TextMoreDialog(
                          email: state.email.text,
                        ),
                      );
                    });
                  },
                ),
              ),
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
