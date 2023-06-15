// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/promo_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_transaksi_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../home/home_page.dart';

class RingkasanPembayaranPage extends StatelessWidget {
  const RingkasanPembayaranPage({super.key});

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
              'Ringkasan Pembayaran',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomepageCutomer(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/icon-home-chat.png',
                width: 18,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: lsymetric.copyWith(top: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearPercentIndicator(
                    linearStrokeCap: LinearStrokeCap.butt,
                    animation: true,
                    lineHeight: 6,
                    padding: EdgeInsets.all(1),
                    percent: 1,
                    progressColor: greenColor,
                    backgroundColor: greenColor,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Cek Pesanan',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Terima kasih sudah mengisi data dirimu :)\nSilakan selesaikan pembayaranmu untuk\nmemulai konsultasi dengan Dokter.',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 15,
                        color: Color(0XFF323232),
                        fontWeight: regular),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Divider(
              thickness: 6,
              color: Color(0xffECECEC),
            ),
            Padding(
              padding: lsymetric.copyWith(top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Konsultasi untuk',
                    style: subGreyTextStyle.copyWith(
                        fontSize: 15,
                        color: Color(0XFF323232),
                        fontWeight: regular),
                  ),
                  Text(
                    'Rina Rasmalina',
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: lsymetric.copyWith(top: 18, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Biaya Sesi',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 15,
                            color: Color(0XFF323232),
                            fontWeight: regular),
                      ),
                      Text(
                        ' 30 Menit',
                        style: blackHigtTextStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  Text(
                    'Rp45.000',
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 6,
              color: Color(0xffECECEC),
            ),
            Padding(
              padding: lsymetric.copyWith(top: 18, bottom: 18),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PromoPage(),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: whiteColor,
                    border: Border.all(color: Color(0xffCCCCCC), width: 1),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/persen_icons.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Pakai Voucher',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 6,
              color: Color(0xffECECEC),
            ),
            Padding(
              padding: lsymetric.copyWith(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Metode Pembayaran',
                    style: blackHigtTextStyle.copyWith(fontSize: 18),
                  ),
                  CardBank(),
                  Text(
                    'Total Harga',
                    style: blackTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: medium,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp45.000',
                        style: blackHigtTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_up,
                        size: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonGreenWidget(
                    title: 'Bayar',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        builder: (context) => const TransaksiMoreDialog(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
