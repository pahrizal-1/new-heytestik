import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';

class InvoiceHeystetikPage extends StatelessWidget {
  const InvoiceHeystetikPage({super.key});

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
              onTap: () {},
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/logo-hestetikc.png',
                      width: 113,
                      height: 27,
                    ),
                    Text(
                      'INVOICE',
                      style: blackHigtTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Invoice Konsultasi',
                  style: blackTextStyle.copyWith(fontSize: 9.24),
                ),
                Text(
                  'Invoice ini merupakan bukti pembayaran yang sah.',
                  style: blackTextStyle.copyWith(fontSize: 8),
                ),
                const SizedBox(height: 15),
                Text(
                  'dr. Risty Hafinah, Sp.DV\nNPWP: 54.929.137.5-414.000',
                  style: blackHigtTextStyle.copyWith(fontSize: 8),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Alamat',
                  style: blackRegulerTextStyle.copyWith(fontSize: 8),
                ),
                Text(
                  'Jalan Raya PKP No. 24 Kelapa Dua Wetan, Ciracas, jakarta TImur',
                  style: blackTextStyle.copyWith(fontSize: 8),
                ),
              ],
            ),
          ),
          dividergrey(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 24, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Untuk',
                        style: blackRegulerTextStyle.copyWith(
                          fontSize: 8,
                          color: blackColor,
                        ),
                        children: [
                          TextSpan(
                            text: ' Rina Rasmalina',
                            style: blackHigtTextStyle.copyWith(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 132,
                    ),
                    Text(
                      'INV/20230513/KD',
                      style: blackTextStyle.copyWith(fontSize: 8),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Untuk',
                        style: blackRegulerTextStyle.copyWith(
                          fontSize: 8,
                          color: blackColor,
                        ),
                        children: [
                          TextSpan(
                            text: ' 00.000.000.0-0.000',
                            style: blackHigtTextStyle.copyWith(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: borderColor)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 7, top: 7, bottom: 7, right: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'ID Konsultasi',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 8,
                                  color: blackColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' K1Z4DWJST',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Tanggal Konsultasi',
                                style: blackRegulerTextStyle.copyWith(
                                  fontSize: 8,
                                  color: blackColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' 12 Juni 2023',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                dividergrey(),
                const SizedBox(
                  height: 12,
                ),
                dividergrey(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DETAIL TRANSAKSI',
                      style: blackTextStyle.copyWith(fontSize: 7.872),
                    ),
                    Text(
                      'TOTAL',
                      style: blackTextStyle.copyWith(fontSize: 7.872),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                dividergrey(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Konsultasi dengan dr. Risty Hafinah, Sp.DV\nSIP No.503/053/DPMPTSP/DU/2020',
                      style: blackRegulerTextStyle.copyWith(fontSize: 7.872),
                    ),
                    Text(
                      'Rp25.000',
                      style: blackRegulerTextStyle.copyWith(fontSize: 7.872),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Subtotal\nDiskon',
                      style: blackRegulerTextStyle.copyWith(fontSize: 7.872),
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    Text(
                      'Rp25.000\nRp0',
                      style: blackRegulerTextStyle.copyWith(fontSize: 7.872),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 23,
                  padding: const EdgeInsets.only(right: 8),
                  color: const Color(0xffF1F1F1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total',
                        style: blackTextStyle.copyWith(
                          fontSize: 8,
                        ),
                      ),
                      const SizedBox(
                        width: 34,
                      ),
                      Text(
                        'Rp25.000',
                        style: blackRegulerTextStyle.copyWith(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Invoice ini tidak membutuhkan stempel atau tanda tangan basah dan dibuat pada 12 Juni 2023 pukul 14:30',
                  style: blackRegulerTextStyle.copyWith(
                      fontSize: 8, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 23,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Butuh bantuan? Hubungi kami di',
                        style: blackRegulerTextStyle.copyWith(fontSize: 8),
                        children: [
                          TextSpan(
                              text: ' info@heystetik.com',
                              style: grenTextStyle.copyWith(
                                  fontSize: 8, fontWeight: regular))
                        ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
