import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/cara_pembayaran_page.dart';

import '../../theme/theme.dart';

class MenungguPemayaranPage extends StatelessWidget {
  const MenungguPemayaranPage({super.key});

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
                  'Menunggu Pembayaran',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: blackColor,
                    blurRadius: 0.5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pesan Obat & Skincare',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            '12 Jun 2023',
                            style: blackRegulerTextStyle.copyWith(fontSize: 10),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Bayar Sebelum',
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 12, color: blackColor),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/clock.png',
                                width: 10,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '14 Jun, 14:55',
                                style: blackTextStyle.copyWith(
                                    color: const Color(0xffF76707)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/logo-bca.png'),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BCA Virtual Account',
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            '8521123456789',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: blackRegulerTextStyle.copyWith(fontSize: 13),
                          ),
                          Text(
                            'Rp915.000',
                            style: blackHigtTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CaraPembyaranPage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 5),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: greenColor)),
                          child: Center(
                            child: Text(
                              'Lihat Cara Bayar',
                              style: grenTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
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
