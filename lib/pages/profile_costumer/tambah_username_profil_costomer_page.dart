import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/button_widget.dart';

class TamBahanUserNameProfilCustomer extends StatefulWidget {
  const TamBahanUserNameProfilCustomer({super.key});

  @override
  State<TamBahanUserNameProfilCustomer> createState() =>
      _TamBahanUserNameProfilCustomerState();
}

class _TamBahanUserNameProfilCustomerState
    extends State<TamBahanUserNameProfilCustomer> {
  final ProfileController state = Get.put(ProfileController());

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
              controller: state.usernameController,
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
                state.updateUsername(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const TambahBioProfikCustomer(),
                //   ),
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}
