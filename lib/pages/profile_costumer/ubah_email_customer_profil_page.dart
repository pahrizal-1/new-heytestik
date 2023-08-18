import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/verifikasi_setings_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../theme/theme.dart';

class UbahEmailCostumerProfilPage extends StatefulWidget {
  const UbahEmailCostumerProfilPage({super.key});

  @override
  State<UbahEmailCostumerProfilPage> createState() => _UbahEmailCostumerProfilPageState();
}

class _UbahEmailCostumerProfilPageState extends State<UbahEmailCostumerProfilPage> {
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
              Text(
                'Ubah Email',
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
        padding: lsymetric.copyWith(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Biar akunmu aman, pastikan e-mail kamu aktif.',
              style: blackRegulerTextStyle.copyWith(
                  fontSize: 15, color: blackColor),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              readOnly: true,
              controller: state.emailController,
              decoration: InputDecoration(
                labelText: 'Email Terdaftar',
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
                hintText: 'rasmalina.rina@gmail.com',
                hintStyle: blackRegulerTextStyle.copyWith(
                    fontSize: 13, color: blackColor),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                  color: fromCssColor('#A3A3A3'),
                ),
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            TextFormField(
              controller: state.emailBaruController,
              decoration: InputDecoration(
                labelText: 'Email Baru',
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
                hintText: 'Masukan Email Baru',
                hintStyle: blackRegulerTextStyle.copyWith(
                  fontSize: 13,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                  color: fromCssColor('#A3A3A3'),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Kami akan kirim kode verifikasi ke e-mail ini.',
              style: blackRegulerTextStyle.copyWith(
                  color: blackColor, fontSize: 13),
            ),
            const SizedBox(
              height: 28,
            ),
            ButtonGreenWidget(
              title: 'Lanjut',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifikasiEmailSetingsPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
