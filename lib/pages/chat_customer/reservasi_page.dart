import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class ReservasiPage extends StatelessWidget {
  const ReservasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        centerTitle: false,
        elevation: 0,
        title: Text(
          'Pilih Tanggal',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 105,
                      height: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/boking_image.png'))),
                    ),
                    const SizedBox(
                      height: 8,
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
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: RichText(
                          text: TextSpan(
                            text: 'Peeling TCA Ringan',
                            style: blackHigtTextStyle.copyWith(
                              fontSize: 15,
                            ),
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
              height: 30,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: RichText(
                text: TextSpan(
                  text: 'Peeling TCA Ringan',
                  style: blackHigtTextStyle.copyWith(
                      fontSize: 15, fontWeight: regular),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Dapat digunakan pada waktu yang diinginkan',
              style: TextStyle(
                color: Color(0Xff9B9B9B),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Tanggal & waktu yang diinginkan',
                style: blackHigtTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/Icon!.png',
                  width: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Dapat digunakan pada waktu yang diinginkan',
                  style: TextStyle(
                    color: Color(0Xff9B9B9B),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              'Rp363.000',
              style: subGreyTextStyle.copyWith(
                fontSize: 12,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
                color: const Color(0xff9B9B9B),
              ),
            ),
            Text.rich(
              TextSpan(
                text: '20%',
                style: grenTextStyle.copyWith(fontSize: 15),
                children: [
                  TextSpan(
                    text: 'Rp.290.400',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            ButtonGreenWidget(
              title: 'Reservasi',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabBarCustomer(),
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
