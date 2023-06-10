import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';
import 'balasan_chat_page.dart';

class EditBalasanChat extends StatelessWidget {
  const EditBalasanChat({super.key});

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
                        hintStyle: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: regular),
                        hintText:
                            'Jerawat atau disebut juga dengan acne vulgaris (AV) adalah suatu penyakit peradangan kronis dari kelenjar pilosebasea yang ditandai adanya komedo, papul, kista, dan pustul. Bagian tubuh yang kerap ditumbuhi jerawat antara lain daerah wajah, bahu, lengan atas, dada, dan punggung.'),
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
