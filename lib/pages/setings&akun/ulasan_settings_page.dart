import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_page.dart';

import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/ulasan_riwayat_widgets.dart';
import '../../widget/ulasan_widgets.dart';
import 'detail_ulasan_page.dart';

class UlasanSetingsPage extends StatefulWidget {
  const UlasanSetingsPage({super.key});

  @override
  State<UlasanSetingsPage> createState() => _UlasanSetingsPageState();
}

class _UlasanSetingsPageState extends State<UlasanSetingsPage> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          titleSpacing: 0,
          iconTheme: iconthemeblack(),
          backgroundColor: whiteColor,
          title: Text(
            'Ulasan',
            style: blackTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(39.0),
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 10, left: 25, top: 10),
          //     child: Column(
          //       children: [
          //         Row(
          //           children: [
          //             InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   isSelected = 0;
          //                 });
          //               },
          //               child: Container(
          //                   padding: const EdgeInsets.symmetric(
          //                       vertical: 2, horizontal: 10),
          //                   decoration: BoxDecoration(
          //                       color: isSelected == 0
          //                           ? subgreenColor.withOpacity(0.1)
          //                           : whiteColor,
          //                       border: Border.all(
          //                         color: isSelected == 0
          //                             ? greenColor
          //                             : borderColor,
          //                       ),
          //                       borderRadius: BorderRadius.circular(7)),
          //                   child: Center(
          //                     child: Text(
          //                       'Menunggu diulas (10)',
          //                       style: isSelected == 0
          //                           ? grenTextStyle.copyWith(
          //                               fontSize: 15,
          //                             )
          //                           : blackRegulerTextStyle.copyWith(
          //                               fontSize: 15),
          //                     ),
          //                   )),
          //             ),
          //             const SizedBox(
          //               width: 9,
          //             ),
          //             InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   isSelected = 1;
          //                 });
          //               },
          //               child: Container(
          //                   padding: const EdgeInsets.symmetric(
          //                       vertical: 2, horizontal: 10),
          //                   decoration: BoxDecoration(
          //                       color: isSelected == 0
          //                           ? whiteColor
          //                           : subgreenColor.withOpacity(0.1),
          //                       border: Border.all(
          //                           color: isSelected == 1
          //                               ? greenColor
          //                               : borderColor,
          //                           width: 1.5),
          //                       borderRadius: BorderRadius.circular(7)),
          //                   child: Center(
          //                     child: Text(
          //                       'Riwayat',
          //                       style: isSelected == 1
          //                           ? grenTextStyle.copyWith(
          //                               fontSize: 15,
          //                             )
          //                           : blackRegulerTextStyle.copyWith(
          //                               fontSize: 15),
          //                     ),
          //                   )),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  labelColor: greenColor,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  unselectedLabelColor: subTitleColor,
                  labelStyle: blackHigtTextStyle.copyWith(
                    fontSize: 15,
                    color: const Color(0XFF9B9B9B),
                  ),
                  indicator: BoxDecoration(
                    border: Border.all(
                      color: greenColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  tabs: const [
                    Tab(
                      text: 'Menunggu diulas (3)',
                    ),
                    Tab(
                      text: 'Riwayat',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            dividergreen(),
            Expanded(
              child: TabBarView(
                children: [
                  MenungguUlasan(),
                  RiwayatUlasan(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RiwayatUlasan extends StatelessWidget {
  const RiwayatUlasan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextUlasanRiwayat(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailPageUlasan()));
            },
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bulan lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
          const TextUlasanRiwayat(
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bulan lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
          const TextUlasanRiwayat(
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bul an lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
          const TextUlasanRiwayat(
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bulan lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
        ],
      ),
    );
  }
}

class MenungguUlasan extends StatelessWidget {
  const MenungguUlasan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: ListView(
        children: [
          UlasanProuduk(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TulisUlasaPage()));
            },
            nameProduk: 'ISISPHARMA',
            tanggal: '12 Jun 2023',
            titleButton: 'Beli Lagi',
            img: 'assets/images/penting1.png',
            namabrand: 'Teenderm Hydra 40ml',
          ),
          const UlasanProuduk(
            nameProduk: 'Peeling TCA Ringan',
            tanggal: '12 Jun 2023',
            titleButton: 'Beli Lagi',
            img: 'assets/images/treat1.png',
            namabrand: 'Klinik Utama Lithea',
          ),
          const UlasanProuduk(
            nameProduk: 'dr. Risty Hafinah, Sp.DV',
            tanggal: '12 Jun 20023',
            titleButton: 'Beli Lagi',
            img: 'assets/images/doctor-img.png',
            namabrand: 'Konsultasi',
          ),
          const UlasanProuduk(
            nameProduk: 'dr. Risty Hafinah, Sp.DV',
            tanggal: '12 Jun 20023',
            titleButton: 'Beli Lagi',
            img: 'assets/images/doctor-img.png',
            namabrand: 'Konsultasi',
          ),
          const UlasanProuduk(
            nameProduk: 'dr. Risty Hafinah, Sp.DV',
            tanggal: '12 Jun 20023',
            titleButton: 'Beli Lagi',
            img: 'assets/images/doctor-img.png',
            namabrand: 'Konsultasi',
          ),
        ],
      ),
    );
  }
}
