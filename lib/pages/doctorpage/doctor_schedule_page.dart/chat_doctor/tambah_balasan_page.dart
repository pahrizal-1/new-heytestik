import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/balasan_chat_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class TambahBalasanPage extends StatelessWidget {
  const TambahBalasanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Tambah Balasan Cepat'),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BalasanCepatPage()),
                );
              },
              child: Text(
                'Simpan',
                style: whiteTextStyle.copyWith(fontSize: 15),
              ),
            )
          ],
        ),
        backgroundColor: greenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 19, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shortcut',
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Definisi Jerawat',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            const Divider(
              thickness: 2,
            ),
            Text(
              'Kata-kata yang akan mengambil balasan ini',
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 58,
            ),
            Text(
              'Pesan Balasan',
              style: subTitleTextStyle,
            ),
            Row(
              children: [
                Container(
                  width: 284,
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 1,
                    decoration: InputDecoration(
                      focusColor: greenColor,
                      fillColor: greenColor,
                      hoverColor: greenColor,
                    ),
                    style: blackTextStyle.copyWith(
                        fontSize: 15,
                        color: Color(0Xff323232),
                        fontWeight: regular),
                  ),
                ),
                Spacer(),
                Image.asset(
                  'assets/icons/onlyCamaera.png',
                  width: 22,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Masukkan teks atau pilih media',
              style: subTitleTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
