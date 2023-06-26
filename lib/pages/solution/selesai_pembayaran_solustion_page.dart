import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi2_page.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi3_page.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';
import '../../widget/more_dialog_bank.dart';
import '../chat_customer/cara_pembayaran_page.dart';

class SelesaiPembayaranSolusionPage extends StatelessWidget {
  const SelesaiPembayaranSolusionPage({super.key});

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
              'BCA Transfer',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Selesaikan Pembayaran',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: lsymetric,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextSpaceBetween(
                          title: 'Batas Akhir Pembayaran',
                          title2: '',
                        ),
                        Text(
                          'Sabtu, 13 Mei 2023  17:12 WIB',
                          style: blackTextStyle.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 105,
                      height: 23,
                      decoration: BoxDecoration(
                        color: const Color(0xffA72424),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/logojam.png',
                            width: 10,
                            color: whiteColor,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '17 : 12 : 00',
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Divider(
                thickness: 7,
                color: Color(0xffECECEC),
              ),
              Padding(
                padding: lsymetric.copyWith(top: 18, bottom: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BCA Virtual Account',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        Image.asset(
                          'assets/images/logo-bca.png',
                          width: 62,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextSpaceBetween(
                                  title: 'Nomor Virtual Account',
                                  title2: '',
                                ),
                                Text(
                                  '1234567890123456',
                                  style: blackTextStyle.copyWith(fontSize: 15),
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'Salin',
                              style: grenTextStyle.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              'assets/icons/salin_icons.png',
                              width: 14,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextSpaceBetween(
                                  title: 'Total Pembayaran',
                                  title2: '',
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Rp20.000',
                                      style:
                                          blackTextStyle.copyWith(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                      'assets/icons/salin_icons.png',
                                      width: 14,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'Lihat Detail',
                              style: grenTextStyle.copyWith(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CaraPembyaranPage(),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Lihat Cara Pembayaran',
                          style: grenTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 7,
                color: Color(0xffECECEC),
              ),
              Padding(
                padding: lsymetric.copyWith(top: 18),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Sudah melakukan pembayaran?',
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Setelah pembayaranmu terkonfirmasi,pihak klinik akan segera menghubungi kamu.Pastikan nomer HP-mu aktif ya :)',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ButtonGreenWidget(
                      title: 'Saya sudah melakukan pembayaran',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TabBarCustomer(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(8)),
                      width: MediaQuery.of(context).size.width,
                      height: 51,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Resevasi3Page(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: whiteColor,
                        ),
                        child: Text(
                          'Ganti metode pembayaran',
                          style: TextStyle(
                            fontSize: 16,
                            color: blackColor,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
