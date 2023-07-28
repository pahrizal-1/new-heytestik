// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/pages/chat_customer/selesai_pembayaran_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/tab_bar_page.dart';

import '../../theme/theme.dart';
import '../../widget/chat_widget.dart';
import '../../widget/rekomedasi_chat_widget.dart';
import '../../widget/text_button_vaigator.dart';

class ChatCostomerPage extends StatefulWidget {
  const ChatCostomerPage({super.key});

  @override
  State<ChatCostomerPage> createState() => _ChatCostomerPageState();
}

class _ChatCostomerPageState extends State<ChatCostomerPage> {
  bool clik = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: clik
            ? Image.asset(
                'assets/icons/logoheystetik.png',
                width: 108,
              )
            : Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    child: Text(
                      'Search',
                      style: blackTextStyle.copyWith(
                          fontSize: 17, fontWeight: regular),
                    ),
                  )
                ],
              ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                clik = !clik;
              });
            },
            child: Padding(
              padding: lsymetric,
              child: clik
                  ? Icon(
                      Icons.search,
                      size: 30,
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                    ),
            ),
          )
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            height: 80.0,
            color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, bottom: 10, top: 10),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelesaiPembayaranPage(),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 21,
                      ),
                      Text('#K1Z4DWJST'),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TabBarChat(),
                            ),
                          );
                        },
                        child: Container(
                          width: 135,
                          height: 25,
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              'Detail Perawatan',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 31,
                  color: Color(0xFFFFE2C1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rekomendasi Dokter sudah siap. Klik',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      ),
                      Text(
                        "'Detail Perawatan’",
                        style: blackHigtTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'ya :)',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: regular),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 17),
          child: Column(
            children: [
              Container(
                height: 20,
                width: 62,
                decoration: BoxDecoration(
                    color: subwhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'Hari Ini',
                    style: blackTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                padding: EdgeInsets.only(left: 18, right: 18, top: 11),
                width: MediaQuery.of(context).size.width,
                height: 233,
                decoration: BoxDecoration(
                  color: Color(
                    0XFFF1F1F1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat datang di chatroom\nkonsultasi Heystetik.',
                      style: blackHigtTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Monon tunggu Sebentar y kak.\nDokter Sedang membaca Dan memahami\npre-assesstment-mu dulu:)',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Jangan khawatir, kami akan mengirimkan\nnotifikasi setiap ada pesan baru dari dokter.\nTerima kasih sudah bersabar :)',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '08:15',
                          style: greyTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ChatLeft(
                imgDoctor: 'assets/images/doctor-img.png',
                nameDoctor: 'dr. Risty Hafinah, Sp.DV',
                timetitle: '18:80',
                color: subwhiteColor,
                title:
                    'Halo, Rina. Terima kasih sudah menunggu :) Saya dr. Risty Hafinah, Sp.DV yang akan membantu mengatasi keluhan kamu. Ada yang bisa saya bantu, kak?',
              ),
              ChatRight(
                  color: subgreenColor,
                  imgUser: 'assets/icons/logo.png',
                  nameUser: 'Rina Romandi',
                  timetitle: '10:90',
                  title:
                      'Halo dok selamat siang..aku mau bertanya ni aku cocok nya skincarenya gimana, akhir² ini aku hanya memakai kelly saja, tidak memakai apa apa sehabis mandi kecuali kelly.. tapi 2 hari sebelum ini aku makai sunscreen YOU Spf 50+ PA ++++, eh tp sunscreen nya malah bikin kulit aku abu abu, kesel sih tapi tetep kupake karna kukira ngaruh, tapi kayanya ngga:(disini aku pengen jerawat, beruntusan, komedo, bekas jerawat hilang semua dan paling terutama kulit aku putih. kulit aku tipenya berminyak sekitaran hidung dan komedonya banyak banget apalagi di bawah bibir banyak.. mohon bantuannya dok'),
              ChatLeft(
                imgDoctor: 'assets/images/doctor-img.png',
                nameDoctor: 'dr. Risty Hafinah, Sp.DV',
                timetitle: '18:80',
                color: subwhiteColor,
                title:
                    'Jerawat disebabkan produksi kelenjar minyak dan sel2 kulit mati berlebih terjadi sumbatan disertai peradangan bakteri P. acnes disebabkan banyak pencetus \n\nPencetus jerawat multifaktor yaitu genetik, stres psikis, hormon, makanan manis, indeks glikemik tinggi, dairy product, tidur larut malam, lembab keringat, debu, skincare, dan kosmetik.',
              ),
              TextChat(
                timetitle: ' 10:90',
                color: subwhiteColor,
                title:
                    'Untuk mengetahui lebih jelas, apakah setelah menggunakan produk tersebut, malam harinya rajin double cleansing?',
              ),
              ChatRight(
                  color: subgreenColor,
                  imgUser: 'assets/icons/logo.png',
                  nameUser: 'Rina Romandi',
                  timetitle: '10:90',
                  title: 'Mmmm...Double cleansing itu apa sih, dok?'),
              RekomendasiDokterWidget(),
              TextChat(
                timetitle: ' 10:90',
                color: subwhiteColor,
                title:
                    'Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
              ),
              ChatRight(
                  color: subgreenColor,
                  imgUser: 'assets/icons/logo.png',
                  nameUser: 'Rina Romandi',
                  timetitle: '10:90',
                  title: 'Oke dokter Terima kasih ☺️'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChatBottomCostomer(),
    );
  }
}
