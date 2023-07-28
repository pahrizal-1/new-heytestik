// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:heystetik_mobileapps/pages/doctorpage/doctor_schedule_page.dart/chat_doctor/detail_pasien_page.dart';
import 'package:heystetik_mobileapps/widget/chat_widget.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/rekomedasi_chat_widget.dart';
import '../../../../widget/text_button_vaigator.dart';

class ChatDoctorPage extends StatefulWidget {
  const ChatDoctorPage({super.key});

  @override
  State<ChatDoctorPage> createState() => _ChatDoctorPageState();
}

class _ChatDoctorPageState extends State<ChatDoctorPage> {
  bool isVisibeliti = true;
  bool clik = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          preferredSize: Size.fromHeight(55.0),
          child: Container(
            height: 55.0,
            color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      const SizedBox(
                        width: 21,
                      ),
                      Text(
                        'Rina Rasmalina',
                        style: blackTextStyle.copyWith(fontSize: 18),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailPasienPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 25,
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              'Detail Pasien',
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
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
                padding:
                    EdgeInsets.only(left: 18, right: 18, top: 11, bottom: 11),
                width: MediaQuery.of(context).size.width,
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
                      'Hai Dokter !',
                      style: blackHigtTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Untuk memaksimalkan solusi yang akan diberikan buat pasien, mohon dibaca dan dipahami dulu pre-assessment yang telah diisi oleh pasienya ya, dok :)',
                      style: subGreyTextStyle.copyWith(fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Silakan klik "',
                          style: subGreyTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          'Detail Pesanan',
                          style: grenTextStyle.copyWith(fontSize: 15),
                        ),
                        Text(
                          '" Di atas.',
                          style: subGreyTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Terima Kasih\nSelamat bertugas Dokter! 🥰',
                      style: subGreyTextStyle.copyWith(
                        fontSize: 15,
                      ),
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
              ChatRight(
                  imgUser: 'assets/images/doctor-img.png',
                  nameUser: 'dr. Risty Hafinah, Sp.DV',
                  timetitle: '10:90',
                  color: subgreenColor,
                  title:
                      'Halo, Rina. Terima kasih sudah menunggu :)Saya dr. Risty Hafinah, Sp.DV yang akan membantu mengatasi keluhan kamu. Ada yang bisa saya bantu, kak?'),
              ChatLeft(
                imgDoctor: 'assets/icons/logo.png',
                nameDoctor: 'Rina Rasmalina',
                timetitle: '18:50',
                color: subwhiteColor,
                title:
                    'Halo, Rina. Terima kasih sudah menunggu :) Saya dr. Risty Hafinah, Sp.DV yang akan membantu mengatasi keluhan kamu. Ada yang bisa saya bantu, kak?',
              ),
              TextChat(
                  timetitle: ' 10:90',
                  color: subwhiteColor,
                  title:
                      'Boleh dong minta sarannya dok. Tolong pilihin rangaian produk biar kulit muka aku mulus lagi dan glowing?'),
              ChatRight(
                  imgUser: 'assets/images/doctor-img.png',
                  nameUser: 'dr. Risty Hafinah, Sp.DV',
                  timetitle: '10:90',
                  color: subgreenColor,
                  title:
                      'Halo, Rina. Terima kasih sudah menunggu :)Saya dr. Risty Hafinah, Sp.DV yang akan membantu mengatasi keluhan kamu. Ada yang bisa saya bantu, kak?'),
              TextChat(
                timetitle: ' 10:90',
                color: subgreenColor,
                title:
                    'Untuk mengetahui lebih jelas, apakah setelah menggunakan produk tersebut, malam harinya rajin double cleansing?',
              ),
              RekomendasiDokterWidget(),
              TextChat(
                timetitle: ' 10:90',
                color: subgreenColor,
                title:
                    'Silakan dicek dulu ya :) Kalau masih bingung, langsung ditanyain aja ☺️',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChatBottomNavigator(),
    );
  }
}
