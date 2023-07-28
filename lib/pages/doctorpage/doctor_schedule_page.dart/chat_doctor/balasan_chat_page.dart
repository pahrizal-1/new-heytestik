import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/edit_balasan_chat.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambah_balasan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class BalasanCepatPage extends StatelessWidget {
  const BalasanCepatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Text(
          'Balasan Cepat',
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/search1.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 15, fontFamily: 'ProximaNova'),
                    decoration: InputDecoration(
                      hintText: 'Cari Balasan',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: fromCssColor(
                          '#9B9B9B',
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/alert.png',
                  width: 17,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    'Untuk menggunakan balasan cepat, ketik “/” pada keyboard atau klik tombol balasan cepat',
                    style: TextStyle(color: Color(0Xff9B9B9B)),
                  ),
                ),
              ],
            ),
            const CardTambhan(
              title: 'Definisi Jerawat',
              subTitle:
                  'Jerawat atau disebut juga dengan acne vulgaris (AV) adalah suatu penyakit peradangan kronis dari kelenjar pilosebasea yang ditandai adanya komedo, papul, kista, dan pustul. Bagian tubuh yang kerap ditumbuhi jerawat antara lain daerah wajah, bahu, lengan atas, dada, dan punggung. Biasanya kondisi ini diakibatkan oleh beragam faktor risiko, meliputi:',
            ),
            const CardTambhan(
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
                    builder: (BuildContext context) =>
                        const TambahBalasanPage()),
              );
            },
            backgroundColor: greenColor,
            child: const Icon(
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
        const SizedBox(
          height: 22,
        ),
        const Divider(
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
                    color: const Color(0XffA3A3A3), fontWeight: regular),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
