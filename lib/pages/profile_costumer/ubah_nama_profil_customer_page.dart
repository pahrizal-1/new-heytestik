import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/tambah_username_profil_costomer_page.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class UbahNamaProfilCustomer extends StatelessWidget {
  const UbahNamaProfilCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
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
                'Ubah Nama',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: lsymetric.copyWith(top: 10),
        child: Column(
          children: [
            Text(
              'Pakai nama asli untuk memudahkan verifikasi. Nama ini akan tampil di beberapa halaman.',
              style: blackRegulerTextStyle.copyWith(
                  fontSize: 15, color: blackColor),
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Image.asset(
                      'assets/icons/x-circle.png',
                    ),
                  ),
                  labelText: 'Nama',
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
                  hintText: 'Rina Rasmalina',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(
                    color: fromCssColor("#A3A3A3"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            ButtonGreenWidget(
              title: 'Simpan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TamBahanUserNameProfilCustomer(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
