import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';
import '../../widget/Text_widget.dart';

class HasilKosultasiPage extends StatelessWidget {
  const HasilKosultasiPage({super.key});

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
                'Hasil Consutasi',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 23,
            ),
            child: Image.asset(
              'assets/icons/download-icons.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 24,
              bottom: 21,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Rina Rasmalina',
                      style: blackTextStyle.copyWith(fontSize: 15),
                      children: [
                        TextSpan(
                          text: '- 22 tahun',
                          style: blackRegulerTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 38,
                ),
                Text(
                  'Gejala',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  'Konsultasi, kulit abu-abu, dan timbul jerawat akibat penggunaan kosmetik.',
                  style: blackRegulerTextStyle.copyWith(
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
                dividergrey(),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  'Kemungkinan Diagnosis',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  'Acne',
                  style: blackRegulerTextStyle.copyWith(
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
                dividergrey(),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  'Saran',
                  style: blackHigtTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  'Rajin cuci muka setelah berkegiatan diluar, kalau bisa lakukan exfoliasi min.2-3 kali seminggu. Rutin minum obat, pakai skincare dan lakukan treatment yang telah diresepkan/direkomendasikan.',
                  style: blackRegulerTextStyle.copyWith(
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
                dividergrey(),
              ],
            ),
          ),
          const dividergreen(),
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Text(
              'Resep Dokter',
              style: blackTextStyle.copyWith(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Container(
              width: 105,
              height: 28,
              padding: EdgeInsets.symmetric(horizontal: 38, vertical: 6),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(27),
                  bottomRight: Radius.circular(27),
                ),
              ),
              child: Text(
                'Obat',
                style: whiteTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          HasilKonsultasiWidgets(
            namaObat: 'Cefila® 200 Cefixime',
            berapaBayak: '1 Strip (10 tablet)',
          ),
          SizedBox(
            height: 18,
          ),
          const dividergreen(),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 260),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 38, vertical: 6),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(27),
                  bottomRight: Radius.circular(27),
                ),
              ),
              child: Text(
                'Skincare',
                style: whiteTextStyle.copyWith(fontSize: 13),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          HasilKonsultasiWidgets(
            namaObat: 'Cefila® 200 Cefixime',
            berapaBayak: '1 botol',
          ),
          HasilKonsultasiWidgets(
            namaObat: 'Teenderm Aqua 200ml',
            berapaBayak: '1 botol',
          ),
          HasilKonsultasiWidgets(
            namaObat: 'Teenderm Aqua 200ml',
            berapaBayak: '1 botol',
          ),
          HasilKonsultasiWidgets(
            namaObat: 'Teenderm Alpha Pure 30ml',
            berapaBayak: '1 botol',
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Container(
              width: 105,
              height: 28,
              padding: EdgeInsets.symmetric(horizontal: 38, vertical: 6),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(27),
                  bottomRight: Radius.circular(27),
                ),
              ),
              child: Text(
                'Treatment',
                style: whiteTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 10, top: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'R/',
                      style: blackRegulerTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Acne Peeling',
                            style: grenTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            'Sudah direservasi di Klinik Utama Lithea Min, 12 Jun 2023',
                            style: blackRegulerTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                dividergrey(),
              ],
            ),
          ),
          HasilKonsultasiWidgets(
            namaObat: 'Acne Facial',
          ),
          HasilKonsultasiWidgets(
            namaObat: 'Acne Facial',
          ),
        ],
      ),
    );
  }
}
