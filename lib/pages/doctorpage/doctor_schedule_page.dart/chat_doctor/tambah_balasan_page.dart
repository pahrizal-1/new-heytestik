import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class TambahBalasanPage extends StatelessWidget {
  const TambahBalasanPage({super.key});

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
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  'Tambah Balasan Cepat',
                  style: whiteTextStyle.copyWith(fontSize: 20),
                )
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
