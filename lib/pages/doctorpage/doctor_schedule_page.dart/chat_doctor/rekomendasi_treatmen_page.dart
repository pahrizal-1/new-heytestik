import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambah_treatment.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

class RekomendasiTreatmen2Page extends StatelessWidget {
  const RekomendasiTreatmen2Page({super.key});

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
                    child: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Tambah Template Treatmen',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ProximaNova',
                      fontWeight: bold,
                      fontSize: 18,
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
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                ButtonGreenWidget(
                  title: '+ Tambah Skincare',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TambahTreatment(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
