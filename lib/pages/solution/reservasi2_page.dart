import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/solution/reservasi3_page.dart';

import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../theme/theme.dart';

class Reservasi2Page extends StatelessWidget {
  const Reservasi2Page({super.key});

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
              'Selesaikan Pemesananmu',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/Ipl1.png'))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: Text(
                          'Klinik Utama Lithea Jakarta Selatan',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                dividergrey(),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Peeling TCA Ringan',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '1 pax',
                  style: blackRegulerTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 17,
                ),
                dividergrey(),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/call-icons.svg',
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Text(
                        'Klinik akan langsung menghubungi Anda untuk mengkonfirmasi jadwal kedatangan Anda.',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 12, color: blackColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calender-icons.svg',
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Text(
                        'Perubahan terkait jadwal treatment dapat dilakukan dengan langsung menghubungi klinik.',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 12, color: blackColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/clender2.svg',
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Expanded(
                      child: Text(
                        'Tidak bisa refund',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 12, color: blackColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 27, bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Pasien',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  'Nama Pasien',
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Rina Rasmalina',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                dividergrey(),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'No. HP Aktif',
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '085211341755',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                dividergrey(),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: lsymetric.copyWith(top: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal Kedatangan',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/alert.png',
                      width: 15,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Tanggal dan waktu mengikuti zona waktu klinik',
                      style: subTitleTextStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
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
              title: 'Lanjutkan Pembayaran',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Resevasi3Page(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
