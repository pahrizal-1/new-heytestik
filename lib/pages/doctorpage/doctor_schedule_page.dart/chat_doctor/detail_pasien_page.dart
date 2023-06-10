import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/tambahan_skin_care_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../../widget/Text_widget.dart';

class DetailPasienPage extends StatelessWidget {
  const DetailPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 21, bottom: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Info Konsultasi',
                style: blackHigtTextStyle.copyWith(fontSize: 15),
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
              const SizedBox(
                height: 46,
              ),
              Text(
                'Pre-Assessment',
                style: blackHigtTextStyle.copyWith(fontSize: 15),
              ),
              const TextBoldSpacebetwen(
                title: 'Tipe Kulit Wajah',
                title2: 'Kombinasi',
                title1: '',
              ),
              const TextBoldSpacebetwen(
                title: 'Kulit Sensitif ',
                title2: 'Tidak Tahu',
                title1: '',
              ),
              const TextBoldSpacebetwen(
                title: 'Jenis Bekas Jerawat',
                title2: 'Bekas jerawat\nkehitaman',
                title1: '',
              ),
              const TextBoldSpacebetwen(
                title: 'Produk skincare yang\ndigunakan',
                title2: 'Sering',
                title1: '',
              ),
              const TextBoldSpacebetwen(
                title: 'Aktivitas dibawah sinar\nmatahari',
                title2: 'Sering',
                title1: '',
              ),
              const TextBoldSpacebetwen(
                title: 'Produk skincare yang\ndigunakan',
                title2:
                    'Ya, saat ini saya sedang\nmemakai produk\nskincare yang dibeli\n bebas di pasaran',
                title1: '',
              ),
              const TextBoldSpacebetwen(
                title: 'Riwayat alergi',
                title2: 'Tidak',
                title1: '',
              ),
              const TextBoldSpacebetwen(
                title: 'Riwayat kondisi/penyakit',
                title2: 'Ya',
                title1: '',
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                height: 61,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: whiteColor,
                  border: Border.all(color: Color(0xffCCCCCC), width: 1),
                ),
                child: Text(
                  'Maag, Covid 19, Hipertensi ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              const TextBoldSpacebetwen(
                title: 'Obat-obatan konsumsi rutin',
                title2: 'Ya',
                title1: '',
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                height: 61,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: whiteColor,
                  border: Border.all(color: Color(0xffCCCCCC), width: 1),
                ),
                child: Text(
                  'Amplodipine Besylate 5mg, Candesartan 8mg',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
              ),
              SizedBox(
                height: 47,
              ),
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
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/tampak-depan.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 110,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/zoom1.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 110,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/kanan1.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: 110,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
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
                            builder: (context) => TambahanSkinCare()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Pre-Assessment Review Selesai',
                      style:
                          whiteTextStyle.copyWith(fontStyle: FontStyle.italic)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
