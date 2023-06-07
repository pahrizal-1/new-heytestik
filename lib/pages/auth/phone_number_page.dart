import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/controller/auth/register_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Membuat Akun Baru',
                style: grenTextStyle,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Center(
              child: Text(
                'Jadilah bagian dari Heystetik sekarang!',
                style: greyTextStyle,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              'Nomer Telepon',
              style: blackTextStyle,
            ),
            const SizedBox(
              height: 6,
            ),
            IntlPhoneField(
              disableLengthCheck: true,
              onChanged: (value) {
                state.phoneNumber = "${value.countryCode}${value.number}";
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusColor: greenColor,
                labelText: 'Nomor Telepon',
              ),
            ),
            const Spacer(),
            ButtonGreenWidget(
              title: 'Kirim Kode Verifikasi',
              onPressed: () async {
                if (state.phoneNumber != null) {
                  await state.registerPhoneNumber(context, doInPost: () async {
                    print("INI KESINI BISA HARUSNYA");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerificationPage(),
                      ),
                    );
                  });
                }
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
