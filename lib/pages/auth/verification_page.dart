// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/customer/register/register_controller.dart';
import '../../theme/theme.dart';
import '../../widget/more_dialog_widget.dart';
import '../../widget/snackbar_widget.dart';

class VerificationPage extends StatelessWidget {
  bool isCompleteProfile = false;
  VerificationPage({this.isCompleteProfile = false, super.key});

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
              '+62${state.phoneNumber.toString()}',
              // state.phoneNumber.toString(),
              style: blackTextStyle.copyWith(),
            ),
            const SizedBox(
              height: 18,
            ),
            // const OtpWidget(),
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
                state.codePhoneNumber = verificationCode;
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
                    await state.registerPhoneNumber(context,
                        doInPost: () async {
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
                    await state.verifyPhoneNumber(context,
                        isCompleteProfile: isCompleteProfile, doInPost: () async {
                      if (isCompleteProfile) {
                        Get
                          ..back(result: true)
                          ..back(result: true);
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return MoreDialog();
                          },
                        );
                      }
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
