import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/ringkasan_pembayaran_page.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';
import '../../widget/more_dialog_bank.dart';

class SelesaiPembayaranPage extends StatelessWidget {
  const SelesaiPembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        centerTitle: false,
        elevation: 0,
        title: Text(
          'BCA Transfer',
          style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RingkasanPembayaranPage(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back)),
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
                    Center(
                      child: Text(
                        'Lihat Cara Pembayaran',
                        style: grenTextStyle.copyWith(fontSize: 15),
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
                      'Setelah pembayaranmu terkonfirmasi, kamu langsung dapat melakukan konsultasi dengan dokter. ',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ButtonGreenWidget(
                      title: 'Saya sudah melakukan pembayaran',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const BankMoreDialog(),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
