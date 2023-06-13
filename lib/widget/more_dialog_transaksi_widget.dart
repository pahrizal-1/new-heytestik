// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/selesai_pembayaran_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'Text_widget.dart';

class TransaksiMoreDialog extends StatefulWidget {
  const TransaksiMoreDialog({super.key});

  @override
  State<TransaksiMoreDialog> createState() => _TransaksiMoreDialogState();
}

class _TransaksiMoreDialogState extends State<TransaksiMoreDialog> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 2),
  //     () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => const SelesaiPembayaranPage(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        height: 280,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SelesaiPembayaranPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/icons/danger-icons.png',
                      width: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Detail Pembayaran',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 29,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Metode Pembayaran',
                    style: greyTextStyle.copyWith(fontSize: 15),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Metode Pembayaran',
                    style: greyTextStyle.copyWith(fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 11,
            ),
            TextBoldSpacebetwen(
              title: 'Biaya Sesi',
              title2: 'Rp45.000',
              title1: ' 30 Menit',
            ),
            SizedBox(
              height: 18,
            ),
            TextBoldSpacebetwen(
              title: 'Diskon Voucher',
              title2: 'Rp25.000',
              title1: '',
            ),
            SizedBox(
              height: 18,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 18,
            ),
            TextBoldSpacebetwen(
              title: 'Total Tagihan',
              title2: 'Rp20.000',
              title1: '',
            ),
          ],
        ),
      ),
    );
  }
}

class PlihPengirimMoreDialog extends StatefulWidget {
  const PlihPengirimMoreDialog({super.key});

  @override
  State<PlihPengirimMoreDialog> createState() => _PlihPengirimMoreDialogState();
}

class _PlihPengirimMoreDialogState extends State<PlihPengirimMoreDialog> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 2),
  //     () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => const SelesaiPembayaranPage(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        height: 335,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/danger-icons.png',
                      width: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Pilih Pengiriman',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instant (Rp22.500)',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Selesaikan transaksi sebelum 15:00 WIB (2-3 jam)',
                    style: subTitleTextStyle,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Same Day (Rp10.000)',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Estimasi tiba hari ini - besok (6-8 Jam)',
                    style: subTitleTextStyle,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reguler (Rp6.000)',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Estimasi tiba hari ini - besok (6-8 Jam)',
                    style: subTitleTextStyle,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
