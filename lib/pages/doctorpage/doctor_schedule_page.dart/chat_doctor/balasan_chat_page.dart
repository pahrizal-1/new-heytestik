import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/edit_balasan_chat.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambah_balasan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../../widget/text_form_widget.dart';

class BalasanCepatPage extends StatelessWidget {
  const BalasanCepatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: const Text('Balasan Chat'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(
              title: 'Cari Balasan ',
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/alert.png',
                  width: 17,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Untuk menggunakan balasan cepat, ketik “/” pada keyboard atau klik tombol balasan cepat',
                    style: TextStyle(color: const Color(0Xff9B9B9B)),
                  ),
                ),
              ],
            ),
            CardTambhan(
              title: 'Definisi Jerawat',
              subTitle:
                  'Jerawat atau disebut juga dengan acne vulgaris (AV) adalah suatu penyakit peradangan kronis dari kelenjar pilosebasea yang ditandai adanya komedo, papul, kista, dan pustul. Bagian tubuh yang kerap ditumbuhi jerawat antara lain daerah wajah, bahu, lengan atas, dada, dan punggung. Biasanya kondisi ini diakibatkan oleh beragam faktor risiko, meliputi:',
            ),
            CardTambhan(
              title: 'Faktor Penyebab Jerawat',
              subTitle:
                  'Biasanya kondisi ini diakibatkan oleh beragam faktor risiko, meliputi: Faktor genetik. Faktor lingkungan.',
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TambahBalasanPage()),
              );
            },
            backgroundColor: greenColor,
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class CardTambhan extends StatelessWidget {
  final String title;
  final String subTitle;

  const CardTambhan({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 22,
        ),
        Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 22,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditBalasanChat(),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                subTitle,
                style: blackTextStyle.copyWith(
                    color: Color(0XffA3A3A3), fontWeight: regular),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
