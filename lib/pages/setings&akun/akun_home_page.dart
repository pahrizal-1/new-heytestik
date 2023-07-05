import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/daftar_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/setings_akun_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/wishlist_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';
import '../tabbar/tabbar_customer.dart';

class AkunHomePage extends StatelessWidget {
  const AkunHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                  child: Image.asset(
                    'assets/icons/danger-icons.png',
                    width: 14,
                  )),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Menu Utama',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 14, bottom: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profiledummy.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/medal1.png',
                              width: 12,
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Text(
                              'Rina Rasmalina',
                              style: blackHigtTextStyle.copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/saldo-icons.svg'),
                            const SizedBox(
                              width: 9,
                            ),
                            Text(
                              'Rp20.000',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetingsAkunPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/icons/setings-icons.png',
                        width: 18,
                        height: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: const Color(0xFFCCCCCC))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Journey',
                        style: blackHigtTextStyle.copyWith(fontSize: 15),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabBarCustomer(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icon_home1.svg',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          'Kembali ke Beranda',
                          style: blackRegulerTextStyle.copyWith(
                              fontSize: 15, color: blackColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                dividergrey(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Aktivitas saya',
                  style: blackHigtTextStyle.copyWith(
                      fontSize: 15, color: blackColor),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/chat.png',
                          width: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aktif',
                              style: grenTextStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              'Konsultasi Bekas Jerawat',
                              style: blackHigtTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/penting1.png',
                          width: 59,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Diproses',
                              style: grenTextStyle.copyWith(fontSize: 12),
                            ),
                            Text(
                              'Teenderm Hydra 40ml',
                              style: blackHigtTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: lsymetric,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DaftarTransaksiPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/daftar-transaksi-icons.png',
                        width: 16,
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Text(
                        'Daftar Transaksi',
                        style: blackRegulerTextStyle.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WishListPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/love-grey.png',
                        width: 18,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Wishlist',
                        style: blackRegulerTextStyle.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/stars-grey.png',
                      width: 18,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Ulasan',
                      style: blackRegulerTextStyle.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                dividergrey(),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/minhey.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Bantuan',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          ' MinHey',
                          style: blackHigtTextStyle.copyWith(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
