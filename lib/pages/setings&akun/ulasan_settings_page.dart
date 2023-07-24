import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_page.dart';

import 'package:heystetik_mobileapps/widget/daftar_transaksi_widgets.dart';

import '../../theme/theme.dart';
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          decoration: BoxDecoration(
                              color: isSelected == 0
                                  ? subgreenColor.withOpacity(0.1)
                                  : whiteColor,
                              border: Border.all(
                                color:
                                    isSelected == 0 ? greenColor : borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              'Menunggu diulas (10)',
                              style: isSelected == 0
                                  ? grenTextStyle.copyWith(
                                      fontSize: 15,
                                    )
                                  : blackRegulerTextStyle.copyWith(
                                      fontSize: 15),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 1;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          decoration: BoxDecoration(
                              color: isSelected == 0
                                  ? whiteColor
                                  : subgreenColor.withOpacity(0.1),
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
      body: isSelected == 0
          ? Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: ListView(
                children: [
                  UlasanProuduk(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const TulisUlasaPage()));
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
            )
          : SingleChildScrollView(
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
                ],
              ),
            ),
    );
  }
}
