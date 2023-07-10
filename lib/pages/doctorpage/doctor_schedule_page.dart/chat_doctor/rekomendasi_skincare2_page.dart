import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/rekomendasi_skin3_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../../../widget/Text_widget.dart';
import '../../../../widget/show_dialog_sousions_payment.dart';
import '../../../solution/selesai_pembayaran_solustion_page.dart';

class RekomendasiSkincare2Page extends StatelessWidget {
  const RekomendasiSkincare2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Tambah Template Skincare',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            InkWell(
              child: Text(
                'SIMPAN',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProximaNova',
                  fontWeight: bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Judul Resep',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 14,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w400,
                  color: fromCssColor('#A3A3A3'),
                ),
              ),
              SizedBox(
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 16,
                    fontWeight: bold,
                    letterSpacing: 0.2,
                    color: fromCssColor(
                        '#323232'), // Ubah dengan warna teks yang diinginkan
                  ),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: fromCssColor('#A3A3A3'),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Resep Rekomendasi',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 14,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w400,
                  color: fromCssColor('#A3A3A3'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonGreenWidget(
                title: '+ Tambah Skincare',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(25),
                        topStart: Radius.circular(25),
                      ),
                    ),
                    builder: (context) => Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 36, bottom: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/danger-icons.png',
                                    width: 14,
                                  ),
                                  const SizedBox(
                                    width: 19,
                                  ),
                                  Text(
                                    'Daftar Skincare',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Jerawat',
                                    style: blackHigtTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
