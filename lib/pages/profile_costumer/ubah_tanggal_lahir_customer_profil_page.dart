import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../widget/button_widget.dart';

class UbahTanggalLahirProfilCustomer extends StatefulWidget {
  const UbahTanggalLahirProfilCustomer({super.key});

  @override
  State<UbahTanggalLahirProfilCustomer> createState() =>
      _UbahTanggalLahirProfilCustomerState();
}

class _UbahTanggalLahirProfilCustomerState
    extends State<UbahTanggalLahirProfilCustomer> {
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
                'Ubah Tanggal Lahir',
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
              'Pastikan tanggal lahirmu diisi dengan benar ya :)',
              style: blackRegulerTextStyle.copyWith(
                fontSize: 15,
                color: blackColor,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            TextFormField(
              readOnly: true,
              onTap: () {
                _selectDate();
              },
              controller: state.dateController,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: greyColor,
                ),
                labelText: 'Tanggal Lahir',
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
                hintStyle: blackTextStyle.copyWith(fontSize: 13),
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
              height: 38,
            ),
            ButtonGreenWidget(
              title: 'Simpan',
              onPressed: () {
                state.updateDob(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const VerifikasiSetingsPage()));
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        state.dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
