import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/controller/auth/login_controller.dart';
import 'package:heystetik_mobileapps/controller/auth/register_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_page.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';
import '../../widget/otp_widget.dart';

class VerificasionEmailPage extends StatelessWidget {
  const VerificasionEmailPage({super.key});

  get blackColor => null;

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
            const OtpWidget(),
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const TextMoreDialog(),
                );
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
