import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambahan_skin_care_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../../widget/Text_widget.dart';
import '../../../../widget/text_form_widget.dart';

class DetailPasienPage extends StatelessWidget {
  const DetailPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Detail Pasien',
              style: whiteTextStyle.copyWith(fontSize: 20),
            )
          ],
        ),
        backgroundColor: greenColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 25, bottom: 46),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Info Konsultasi',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status Konsultasi',
                      style: subGreyTextStyle,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(42),
                        ),
                        child: Center(
                          child: Text(
                            'Review',
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const TextBoldSpacebetwen(
                  title: 'ID Konsultasi',
                  title2: 'K1Z4DWJST',
                  title1: '',
                ),
                const TextBoldSpacebetwen(
                  title: 'Tanggal',
                  title2: '13 Mei 2023',
                  title1: '',
                ),
                const TextBoldSpacebetwen(
                  title: 'Masa Aktif',
                  title2: 'K1Z4DWJST',
                  title1: '',
                ),
                const SizedBox(
                  height: 46,
                ),
                Text(
                  'Info Pasien',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                const TextBoldSpacebetwen(
                  title: 'Nama Pasien',
                  title2: 'Rina Rasmalina',
                  title1: '',
                ),
                const TextBoldSpacebetwen(
                  title: 'Topik Keluhan',
                  title2: 'Bekas Jerawat',
                  title1: '',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Text(
              'Pre-Assessment',
              style: blackHigtTextStyle.copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Container(
              height: 34,
              width: 1,
              padding: const EdgeInsets.only(
                  top: 8, left: 25, bottom: 11, right: 19),
              decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text(
                'Pertanyaan Umum',
                style: whiteTextStyle.copyWith(fontSize: 16),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PeryataanUmumTextFrom(
                pernyattan:
                    '1 .Menurutmu, kulit wajahmu termasuk tipe yang mana?',
                jawaban: 'Kombinasi',
              ),
              PeryataanUmumTextFrom(
                pernyattan: '2 .Apakah kamu mempunyai kulit yang sensitif?',
                jawaban: 'Kombinasi',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Container(
              height: 34,
              width: 1,
              padding: const EdgeInsets.only(
                  top: 8, left: 25, bottom: 11, right: 19),
              decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text(
                'Riwayat Medis',
                style: whiteTextStyle.copyWith(fontSize: 16),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PeryataanUmumTextFrom(
                pernyattan: '1 .Area mana yang terdapat acne/jerawat?',
                jawaban: 'Dagu, Pipi ',
              ),
              PeryataanUmumTextFrom(
                pernyattan:
                    '2 .Apakah kamu selalu pakai full make up setiap hari?',
                jawaban: 'Ya',
              ),
              PeryataanUmumTextFrom(
                pernyattan: '3 .Seberapa sering beraktifitas dibawah matahari?',
                jawaban: 'Ya',
              ),
              PeryataanUmumTextFrom(
                pernyattan:
                    '4 .Apakah ada produk skincare yang rutin kamu gunakan untuk wajahmu??',
                jawaban: 'Ya',
              ),
              PeryataanUmumTextFrom(
                pernyattan: '5 .Apakah punya riwayat alergi?',
                jawaban: 'Ya, Alergi udang',
              ),
              PeryataanUmumTextFrom(
                pernyattan: '6 .Pilih tipe perawatan yang kamu inginkan',
                jawaban:
                    'Pilihan lengkan & terbaik, hasil cepat terlihat (Rp250.000 - Rp450.000 per 4-5 produk)',
              ),
              PeryataanUmumTextFrom(
                pernyattan:
                    '7 .Apakah ada kondisi medis/penyakit yang kamu miliki?',
                jawaban: 'Tidak',
              ),
              PeryataanUmumTextFrom(
                pernyattan:
                    '8 .Apakah ada obat-obatan yang rutin dikonsumsi saat ini?',
                jawaban: 'Ya',
              ),
              PeryataanUmumTextFrom(
                pernyattan:
                    '9 .Apakah ada obat-obatan yang rutin dikonsumsi saat ini?',
                jawaban: 'Lebih dari 6 bulan',
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foto Kondisi Pasien',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 14,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 110,
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/tampak-depan.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 110,
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/zoom1.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 110,
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kanan1.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 110,
                        width: 80,
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kiri1.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '*Klik foto untuk memperbesar',
                  style: greyTextStyle.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 37,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TambahanSkinCare()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Pre-Assessment Review Selesai',
                        style: whiteTextStyle.copyWith(
                            fontStyle: FontStyle.italic)),
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
