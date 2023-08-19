import 'dart:developer';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widget/timeline_status_widget.dart';

class DetailStatusPage extends StatelessWidget {
  const DetailStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
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
              Expanded(
                child: Text(
                  'Detail Pesanan',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icons/detail_status1.png',
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/icons/detail_status2.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/icons/detail_status3.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/icons/detail_status4.png',
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Row(
            children: [
              TimeLineStatusWidgets(
                  isFirst: true, isLast: false, isPast: false),
              TimeLineStatusWidgets(
                  isFirst: false, isLast: false, isPast: false),
              TimeLineStatusWidgets(
                  isFirst: false, isLast: false, isPast: true),
              TimeLineStatusWidgets(isFirst: false, isLast: true, isPast: true),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Pesanan Dikirim',
              style: grenTextStyle.copyWith(
                fontSize: 15,
                fontWeight: regular,
              ),
            ),
          ),
          SizedBox(
            height: 51,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Produk',
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
                TimeLineStatusPengrimanWidgets(
                  isFirst: true,
                  isLast: false,
                  isPast: false,
                  colortitle1: greenColor,
                  jam: '15:19 WIB',
                  title1: 'Minggu, 14 Mei 2023',
                  title2: 'Pesanan Dikirim',
                ),
                TimeLineStatusPengrimanWidgets(
                  isFirst: false,
                  isLast: false,
                  isPast: true,
                  colortitle1: blackColor,
                  jam: '15:19 WIB',
                  title1: 'Sabtu, 13 Mei 2023',
                  title2: 'Menunggu Pick Up',
                ),
                TimeLineStatusPengrimanWidgets(
                  isFirst: false,
                  isLast: false,
                  isPast: true,
                  colortitle1: blackColor,
                  jam: '15:19 WIB',
                  title1: 'Sabtu, 13 Mei 2023',
                  title2: 'Pesanan sedang diproses',
                ),
                TimeLineStatusPengrimanWidgets(
                  isFirst: false,
                  isLast: true,
                  isPast: true,
                  colortitle1: blackColor,
                  jam: '15:19 WIB',
                  title1: 'Minggu, 14 Mei 2023',
                  title2:
                      'Pembayaran diverifikasi dan sudah diterima oleh Heystetik.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
