import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class ResepDigitalPage extends StatelessWidget {
  const ResepDigitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
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
                'Invoice Heystetik',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
              onTap: () async {},
              child: Image.asset(
                'assets/icons/download-icons.png',
                width: 24,
                height: 24,
              )),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 25, right: 6, top: 7, bottom: 7),
            color: Color(0xffFFE2C1),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/alert-new.png',
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Resep digital ini berlaku sampai 12 Agustus 2023 dan\nhanya dapat ditebus 1 kali.',
                  style: subTitleTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/logo-hestetikc.png',
                      width: 120,
                    ),
                    Text(
                      '12 Juni 2023',
                      style: blackTextStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'dr. Risty Hafinah, Sp.DV',
                      style: blackTextStyle,
                    ),
                    Text(
                      'Dermatologist\nSIP No.503/053/DPMPTSP/DU/2020',
                      style: blackRegulerTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          dividergrey(),
          SizedBox(
            height: 18,
          ),
          Text(
            'Resep Digital',
            style: blackHigtTextStyle.copyWith(fontSize: 13),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Jika kamu mengalami gejala berat atau tidak membaik, kunjungi fasilitas kesehatan terdekat.',
            style: subTitleTextStyle.copyWith(fontSize: 8),
          ),
          SizedBox(
            height: 4,
          ),
          RichText(
            text: TextSpan(
              text: ' Nama Pasien: Rina Rasmalina - ',
              style: blackTextStyle,
              children: [
                TextSpan(text: 'Perempuan, 20 tahun', style: subTitleTextStyle)
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          dividergrey(),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'R/  Cefila 200 Cefixime',
                      style: blackTextStyle.copyWith(fontSize: 10),
                    ),
                    Spacer(),
                    Text(
                      '1 Per Strip',
                      style: subGreyTextStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  '2 X 1 Tablet per hari',
                  style: subGreyTextStyle.copyWith(fontSize: 10),
                ),
                dividergrey(),
              ],
            ),
          ),
          Spacer(),
          Text(
            'Resep digital ini hanya dapat ditebus melalui aplikasi Heystetik',
            style: subGreyTextStyle.copyWith(fontSize: 10),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
