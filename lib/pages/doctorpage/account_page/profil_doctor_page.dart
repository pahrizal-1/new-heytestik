import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/edit_profile_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/rating_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/pin_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/saldo_profil_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';

class ProfilDoctorPage extends StatefulWidget {
  const ProfilDoctorPage({super.key});

  @override
  State<ProfilDoctorPage> createState() => _ProfilDoctorPageState();
}

class _ProfilDoctorPageState extends State<ProfilDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Akun Saya",
          style: TextStyle(
            fontFamily: "ProximaNova",
            fontWeight: bold,
            color: whiteColor,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: greenColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/doctor1.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "dr. Risty Hafinah, Sp.DV",
                              style: TextStyle(
                                fontWeight: bold,
                                fontFamily: 'ProximaNova',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "Dokter Spesialis Kulit",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfilePage()),
                        );
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/icons/edit.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Statistik Saya",
                        style: TextStyle(
                          fontFamily: "Proximanova",
                          fontSize: 18,
                          letterSpacing: 0.5,
                          fontWeight: bold,
                          color: blackColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            enableDrag: true,
                            builder: (BuildContext context) {
                              return BottomSheetProfile();
                            },
                          );
                        },
                        child: Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.commit_sharp,
                                size: 18,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "ProximaNova",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 65,
                            width: 155,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12, top: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/icons/komen.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "122K",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontWeight: bold,
                                          fontSize: 20,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Konsultasi",
                                        style: TextStyle(
                                            fontFamily: "ProximaNova",
                                            fontSize: 13,
                                            color: fromCssColor("#A3A3A3")),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 65,
                            width: 155,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12, top: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/icons/onoff.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "500",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontWeight: bold,
                                          fontSize: 20,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Hari Aktif",
                                        style: TextStyle(
                                            fontFamily: "ProximaNova",
                                            fontSize: 13,
                                            color: fromCssColor("#A3A3A3")),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 65,
                            width: 155,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12, top: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/icons/love.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "102K",
                                        style: TextStyle(
                                          fontFamily: "ProximaNova",
                                          fontWeight: bold,
                                          fontSize: 20,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Disukai",
                                        style: TextStyle(
                                            fontFamily: "ProximaNova",
                                            fontSize: 13,
                                            color: fromCssColor("#A3A3A3")),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RatingPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 65,
                              width: 155,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, top: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/icons/fav.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "98%",
                                          style: TextStyle(
                                            fontFamily: "ProximaNova",
                                            fontWeight: bold,
                                            fontSize: 20,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Pasien Puas",
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              fontSize: 13,
                                              color: fromCssColor("#A3A3A3")),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SaldoProfilPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenColor,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Saldo Saya",
                              style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontSize: 15,
                                  color: whiteColor),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Rp5.000.000",
                              style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontSize: 20,
                                  fontWeight: bold,
                                  color: whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Keamanan",
                    style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PinPage(),
                          ),
                        );
                      },
                      child: ContainerSettings(
                        title: "Ubah Kata Sandi",
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Aplikasi Heystetik",
                    style: TextStyle(
                      fontFamily: "ProximaNova",
                      fontWeight: bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ContainerSettings(title: "Notifikasi"),
                  SizedBox(
                    height: 10,
                  ),
                  ContainerSettings(title: "Tentang Heystetik"),
                  SizedBox(
                    height: 10,
                  ),
                  ContainerSettings(title: "Update App"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Log-Out",
                            style: TextStyle(
                              fontSize: 15,
                              color: greenColor,
                              letterSpacing: 0.2,
                              fontFamily: "ProximaNova",
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: greenColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetProfile extends StatelessWidget {
  const BottomSheetProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          // color: Colors.lightGreenAccent[100],
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: blackColor,
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Filter Statistik Saya',
                        style: TextStyle(
                          fontFamily: "ProximaNova",
                          fontSize: 20,
                          fontWeight: bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hari Ini (Real Time)',
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 15,
                            fontWeight: bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '16 November (00.00-09.00)',
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 12,
                            fontWeight: bold,
                            color: fromCssColor("#9B9B9B"),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Icon(
                        Icons.circle_outlined,
                        size: 0.2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 22,
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '7 Hari Terakhir',
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 15,
                            fontWeight: bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '09 - 15 Nov 2023',
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 12,
                            fontWeight: bold,
                            color: fromCssColor("#9B9B9B"),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Icon(
                        Icons.circle_outlined,
                        size: 0.2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 22,
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '30 Hari Terakhir',
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 15,
                            fontWeight: bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '17 Okt - 15 Nov 2023',
                          style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontSize: 12,
                            fontWeight: bold,
                            color: fromCssColor("#9B9B9B"),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: Icon(
                        Icons.circle_outlined,
                        size: 0.2,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 22,
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Custom Tanggal',
                      style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontSize: 15,
                        fontWeight: bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.circle_outlined,
                        size: 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.date_range_outlined,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "17 Agu 2023 - 17 Nov 2023",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "ProximaNova",
                            letterSpacing: 0.5,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Jenis Pertanyaan',
                  style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontSize: 15,
                    fontWeight: bold,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardFilter(title: "Chat yang selesai"),
                    CardFilter(title: "Chat yang selesai")
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonGreenWidget(
                  title: "Tampilkan",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
