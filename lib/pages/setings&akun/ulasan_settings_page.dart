import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_page.dart';
import 'package:heystetik_mobileapps/widget/daftar_transaksi_widgets.dart';

import '../../theme/theme.dart';

class UlasanSetingsPage extends StatefulWidget {
  const UlasanSetingsPage({super.key});

  @override
  State<UlasanSetingsPage> createState() => _UlasanSetingsPageState();
}

class _UlasanSetingsPageState extends State<UlasanSetingsPage> {
  int isSelected = 0;
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
              Text(
                'Ulasan',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(39.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 25, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 0;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          width: 160,
                          decoration: BoxDecoration(
                              color: subgreenColor.withOpacity(0.1),
                              border: Border.all(
                                color:
                                    isSelected == 0 ? greenColor : borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              'Menunggu diulas (3)',
                              style: isSelected == 0
                                  ? grenTextStyle.copyWith(
                                      fontSize: 15,
                                    )
                                  : blackRegulerTextStyle.copyWith(
                                      fontSize: 15),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 1;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          width: 93,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(
                                  color: isSelected == 1
                                      ? greenColor
                                      : borderColor,
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              'Riwayat',
                              style: isSelected == 1
                                  ? grenTextStyle.copyWith(
                                      fontSize: 15,
                                    )
                                  : blackRegulerTextStyle.copyWith(
                                      fontSize: 15),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
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
            UlasanProuduk(
              nameProduk: 'Peeling TCA Ringan',
              tanggal: '12 Jun 2023',
              titleButton: 'Beli Lagi',
              img: 'assets/images/treat1.png',
              namabrand: 'Klinik Utama Lithea',
            ),
            UlasanProuduk(
              nameProduk: 'dr. Risty Hafinah, Sp.DV',
              tanggal: '12 Jun 20023',
              titleButton: 'Beli Lagi',
              img: 'assets/images/doctor-img.png',
              namabrand: 'Konsultasi',
            ),
          ],
        ),
      ),
    );
  }
}
