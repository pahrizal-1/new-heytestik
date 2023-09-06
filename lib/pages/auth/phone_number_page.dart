import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/register/register_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/verification_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
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
              'Nomor Handphone',
              style: blackTextStyle,
            ),
            const SizedBox(
              height: 6,
            ),
            IntlPhoneField(
              initialCountryCode: 'ID',
              showCursor: false,
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(
                Icons.keyboard_arrow_down,
                color: blackColor,
              ),
              disableLengthCheck: true,
              onChanged: (value) {
                state.phoneNumber = "${value.countryCode}${value.number}";
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 15),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greyColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greyColor),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: greyColor),
                ),
                focusColor: greenColor,
                hintText: 'Nomor Ponsel',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            ),
            const Spacer(),
            Obx(
              () => LoadingWidget(
                isLoading: state.isLoading.value,
                child: ButtonGreenWidget(
                  title: 'Kirim Kode Verifikasi',
                  onPressed: () async {
                    await state.registerPhoneNumber(context,
                        doInPost: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerificationPage(),
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
