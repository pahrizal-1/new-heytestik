import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../theme/theme.dart';
import '../setings&akun/verifikasi_setings_page.dart';

class UbahNomorCustomerProfilPage extends StatefulWidget {
  const UbahNomorCustomerProfilPage({super.key});

  @override
  State<UbahNomorCustomerProfilPage> createState() => _UbahNomorCustomerProfilPageState();
}

class _UbahNomorCustomerProfilPageState extends State<UbahNomorCustomerProfilPage> {
  final ProfileController state = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                  state.nomorHpController.text = '';
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
              Text(
                'Ubah Nomor HP',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/more-six.png',
            width: 15,
            height: 15,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
        child: Column(
          children: [
            Text(
              'Pakai nama asli untuk memudahkan verifikasi. Nama ini akan tampil di beberapa halaman.',
              style: blackRegulerTextStyle.copyWith(
                fontSize: 15,
                color: blackColor,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                controller: state.nomorHpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    child: Image.asset(
                      'assets/icons/x-circle.png',
                    ),
                  ),
                  labelText: 'Nomor Telepon',
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
                  hintText: 'Masukan Nomor Telepon Baru',
                  hintStyle: blackRegulerTextStyle.copyWith(
                    fontSize: 13,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: fromCssColor('#A3A3A3'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            ButtonGreenWidget(
              title: 'Lanjut',
              onPressed: () {
                // state.verifyCode(context);
                if (state.nomorHpController.text.length != 0) {
                  state.verifyCodeWA(context, state.nomorHpController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifikasiSetingsPage()));
                } else {
                  showDialog(
                    context: Get.context!,
                    builder: (context) => AlertWidget(subtitle: 'Tolong Lengkapi No Telepon Anda Terlebih Dahulu'),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
