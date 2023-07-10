import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/tambah_bio_profik_customer_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/button_widget.dart';

class TamBahanUserNameProfilCustomer extends StatelessWidget {
  const TamBahanUserNameProfilCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                'Tambah Username',
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
            SizedBox(
              height: 15,
            ),
            TextFormField(
              maxLength: 30,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.check,
                  size: 24,
                  color: greenColor,
                ),
                labelText: 'Username',
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
                hintText: '@rinarasmalina',
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
              height: 18,
            ),
            ButtonGreenWidget(
              title: 'Simpan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TambahBioProfikCustomer(),
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
