// ignore_for_file: prefer_const_constructors

import "dart:async";

import "package:flutter/material.dart";

import "../pages/auth/auth_page.dart";
import "../pages/chat_customer/selesai_pembayaran_page.dart";
import "../theme/theme.dart";
import 'Text_widget.dart';

class TransaksiMoreDialog extends StatefulWidget {
  const TransaksiMoreDialog({super.key});

  @override
  State<TransaksiMoreDialog> createState() => _TransaksiMoreDialogState();
}

class _TransaksiMoreDialogState extends State<TransaksiMoreDialog> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const SelesaiPembayaranPage(),
        ),
      ),
    );
  }

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
