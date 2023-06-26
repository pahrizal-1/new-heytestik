import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi2_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class ReservasiPage extends StatelessWidget {
  const ReservasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Reservasi',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/Ipl1.png'))),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Peeling TCA Ringan',
                          style: blackHigtTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Tindakan menggunakan cairan peeling yang oleskan ke area tertentu. Pemilihan cairan peeling disesuaikan dengan jenis kulit (Berjerawat, flek hitam, bekas jerawat). Berfungsi untuk mengangkat sel-sel kulit mati, mengatasi jerawat, mencerahkan dan meremajakan kulit.',
                        style: TextStyle(
                          color: Color(0Xff9B9B9B),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Klinik Utama Litheas',
                        style: subGreyTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0XFFCCCCCC),
            ),
            const SizedBox(
              height: 21,
            ),
            Text(
              'Jumlah Pengguna',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Pax',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  'Rp290.400',
                  style: grenTextStyle.copyWith(fontSize: 13),
                ),
                const Spacer(),
                Icon(
                  Icons.remove_circle_outline,
                  color: greenColor,
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  '1',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  width: 14,
                ),
                Icon(
                  Icons.add_circle_outline,
                  color: greenColor,
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            dividergrey(),
            const SizedBox(
              height: 21,
            ),
            Row(
              children: [
                Text(
                  'Total Harga',
                  style: blackRegulerTextStyle.copyWith(color: blackColor),
                ),
                const Spacer(),
                Text(
                  'Rp290.400',
                  style: blackTextStyle.copyWith(fontSize: 13),
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            const SizedBox(
              height: 85,
            ),
            ButtonGreenWidget(
              title: 'Pesan',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Reservasi2Page(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
