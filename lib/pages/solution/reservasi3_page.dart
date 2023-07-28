import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/promo_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../widget/show_dialog_sousions_payment.dart';

class Resevasi3Page extends StatefulWidget {
  const Resevasi3Page({super.key});

  @override
  State<Resevasi3Page> createState() => _Resevasi3PageState();
}

class _Resevasi3PageState extends State<Resevasi3Page> {
  int isSelected = 0;
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
              'Lanjutkan Pembayaran',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 25, bottom: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Selesaikan dalam',
                      style: blackHigtTextStyle.copyWith(fontSize: 18),
                    ),
                    const Spacer(),
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/Ipl1.png'))),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Klinik Utama Lithea Jakarta Selatan',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 12, letterSpacing: 0.4),
                        ),
                        Text(
                          'Selasa, 16 Mei 2023',
                          style: subTitleTextStyle.copyWith(
                            fontSize: 12,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(25),
                              topStart: Radius.circular(25),
                            ),
                          ),
                          builder: (context) => OrderanMoreDialog(),
                        );
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const dividergreen(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PromoPage(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 15,
                left: 14,
                right: 14,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/persen_icons.png',
                    width: 25,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kamu bisa hemat Rp 25.000',
                        style: blackTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        '1 voucher dipakai',
                        style: subTitleTextStyle,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          ),
          const dividergreen(),
          Padding(
            padding:
                const EdgeInsets.only(top: 17, left: 25, right: 25, bottom: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Metode Pembayaran',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 27,
                ),
                Text(
                  'Pembayaran Instan',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 17,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = 0;
                    });
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/gopay-blue-icons.png',
                        width: 47,
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gopay',
                            style: blackTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            'Tidak tersedia untuk transaksi ini',
                            style: subTitleTextStyle,
                          )
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        isSelected == 0
                            ? Icons.radio_button_on
                            : Icons.circle_outlined,
                        size: 23,
                        color: isSelected == 0 ? greenColor : blackColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 22),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        isSelected = 1;
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo-bca.png',
                        width: 52,
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BCA Virtual Account',
                            style: blackTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            'Biaya Pembayaran Rp3.000',
                            style: subTitleTextStyle,
                          )
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        isSelected == 1
                            ? Icons.radio_button_on
                            : Icons.circle_outlined,
                        size: 23,
                        color: isSelected == 1 ? greenColor : blackColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = 2;
                    });
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo-bni.png',
                        width: 52,
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BNI Virtual Account',
                            style: blackTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            'Tidak tersedia untuk transaksi ini',
                            style: subTitleTextStyle,
                          )
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        isSelected == 2
                            ? Icons.radio_button_on
                            : Icons.circle_outlined,
                        size: 23,
                        color: isSelected == 2 ? greenColor : blackColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = 3;
                    });
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo-bri.png',
                        width: 52,
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BRI Virtual Account',
                            style: blackTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            'Tidak tersedia untuk transaksi ini',
                            style: subTitleTextStyle,
                          )
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        isSelected == 3
                            ? Icons.radio_button_on
                            : Icons.circle_outlined,
                        size: 23,
                        color: isSelected == 3 ? greenColor : blackColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tranfer Bank (Verifikasi Manual)',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/mandiri-icons.png',
                      color: blackColor,
                      width: 52,
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BRI Virtual Account',
                          style: blackTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Tidak tersedia untuk transaksi ini',
                          style: subTitleTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Pembayaran',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 27,
                ),
                const TextSpaceBetween(
                  title: 'Total Perawatan',
                  title2: 'Rp290.400',
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Biaya Jasa Aplikasi',
                      style: subGreyTextStyle.copyWith(
                          fontSize: 14,
                          color: const Color(0XFF323232),
                          fontWeight: regular),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/icons/alert.png',
                      width: 11,
                    ),
                    const Spacer(),
                    Text(
                      'Rp0',
                      style: subGreyTextStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const TextSpaceBetween(
                  title: 'Biaya Pembayaran',
                  title2: 'Rp3.000',
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
            color: subwhiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Pembayaran',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.circle,
                        size: 7,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(
                      'Hanya berlaku dengan menggunakan akun BCA. Pembayaran dengan akun bank lain tidak akan diproses.',
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.circle,
                        size: 7,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(
                      'Pastikan nomor Virtual Account kamu sesuai dengan instruksi pembayaran.',
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Icon(
                        Icons.circle,
                        size: 7,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        'Pastikan kembali nominal pembayaran sesuai dengan pemesanan yang kamu lakukan.',
                        style: blackRegulerTextStyle.copyWith(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: lsymetric.copyWith(top: 22, bottom: 22),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Dengan menekan tombol bayar, kamu menyetujui',
                    style: greyTextStyle.copyWith(fontSize: 12),
                    children: [
                      TextSpan(
                        text: ' Syarat & Ketentuan',
                        style: grenTextStyle.copyWith(fontSize: 13),
                        children: [
                          TextSpan(
                            text: ' dan',
                            style: greyTextStyle.copyWith(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: ' Kebijakan Privasi',
                                  style: grenTextStyle.copyWith(fontSize: 13),
                                  children: [
                                    TextSpan(
                                      text: ' Heystetik.',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 12),
                                    )
                                  ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 25,
        ),
        height: 149,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Perawatan',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Rp290.400',
                  style: blackHigtTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ButtonGreenWidget(
              title: 'Bayar',
              onPressed: () {
                showModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                  builder: (context) => PesananMoreDialog(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
