import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/doctor/profile/profile_controller.dart';

import 'package:heystetik_mobileapps/pages/doctorpage/account_page/edit_profile_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/pin_page_lama.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/rating_page.dart';
import 'package:heystetik_mobileapps/pages/doctorpage/account_page/saldo_profil_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/card_widget.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';

class ProfilDoctorPage extends StatefulWidget {
  const ProfilDoctorPage({super.key});

  @override
  State<ProfilDoctorPage> createState() => _ProfilDoctorPageState();
}

class _ProfilDoctorPageState extends State<ProfilDoctorPage> {
  final DoctorProfileController state = Get.put(DoctorProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Akun Saya',
          style: TextStyle(
            fontFamily: 'ProximaNova',
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
                                AssetImage('assets/images/doctor1.png'),
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
                              'dr. Risty Hafinah, Sp.DV',
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
                              'Dokter Spesialis Kulit',
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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icons/edit.png',
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
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Statistik Saya',
                        style: TextStyle(
                          fontFamily: 'Proximanova',
                          fontSize: 18,
                          letterSpacing: 0.5,
                          fontWeight: bold,
                          color: blackColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          customeshomodal(context, BottomSheetProfile());
                        },
                        child: Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.commit_sharp,
                                size: 18,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                                  offset: const Offset(0, 0),
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
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/komen.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '122K',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontWeight: bold,
                                          fontSize: 20,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Konsultasi',
                                        style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 13,
                                            color: fromCssColor('#A3A3A3')),
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
                                  offset: const Offset(0, 0),
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
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/onoff.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '500',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontWeight: bold,
                                          fontSize: 20,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Hari Aktif',
                                        style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 13,
                                            color: fromCssColor('#A3A3A3')),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
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
                                  offset: const Offset(0, 0),
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
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/love.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '102K',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontWeight: bold,
                                          fontSize: 20,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Disukai',
                                        style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontSize: 13,
                                            color: fromCssColor('#A3A3A3')),
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
                                    offset: const Offset(0, 0),
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
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/icons/fav.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '98%',
                                          style: TextStyle(
                                            fontFamily: 'ProximaNova',
                                            fontWeight: bold,
                                            fontSize: 20,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'Pasien Puas',
                                          style: TextStyle(
                                              fontFamily: 'ProximaNova',
                                              fontSize: 13,
                                              color: fromCssColor('#A3A3A3')),
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
                  const SizedBox(
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
                              'Saldo Saya',
                              style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 15,
                                  color: whiteColor),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Rp5.000.000',
                              style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 20,
                                  fontWeight: bold,
                                  color: whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Keamanan',
                    style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontWeight: bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PinPageLamaDoctor(),
                          ),
                        );
                      },
                      child: const ContainerSettings(
                        title: 'Ubah Kata Sandi',
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Aplikasi Heystetik',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontWeight: bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerSettings(title: 'Notifikasi'),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerSettings(title: 'Tentang Heystetik'),
                  const SizedBox(
                    height: 10,
                  ),
                  const ContainerSettings(title: 'Update App'),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      await state.logout(context);
                    },
                    child: const ContainerSettings(
                      title: 'Log-Out',
                      isLogout: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetProfile extends StatefulWidget {
  const BottomSheetProfile({super.key});

  @override
  State<BottomSheetProfile> createState() => _BottomSheetProfileState();
}

class _BottomSheetProfileState extends State<BottomSheetProfile> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 30),
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Filter Statistik Saya',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 20,
                        fontWeight: bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 0;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hari Ini (Real Time)',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
                            fontWeight: bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '16 November (00.00-09.00)',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 12,
                            fontWeight: bold,
                            color: fromCssColor('#9B9B9B'),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      isSelected == 0
                          ? Icons.radio_button_on
                          : Icons.circle_outlined,
                      color: isSelected == 0 ? greenColor : blackColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
                child: Divider(
                  thickness: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 1;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '7 Hari Terakhir',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
                            fontWeight: bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '09 - 15 Nov 2023',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 12,
                            fontWeight: bold,
                            color: fromCssColor('#9B9B9B'),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      isSelected == 1
                          ? Icons.radio_button_on
                          : Icons.circle_outlined,
                      color: isSelected == 1 ? greenColor : blackColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
                child: Divider(
                  thickness: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = 2;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '30 Hari Terakhir',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 15,
                            fontWeight: bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '17 Okt - 15 Nov 2023',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 12,
                            fontWeight: bold,
                            color: fromCssColor('#9B9B9B'),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      isSelected == 2
                          ? Icons.radio_button_on
                          : Icons.circle_outlined,
                      color: isSelected == 2 ? greenColor : blackColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
                      fontFamily: 'ProximaNova',
                      fontSize: 15,
                      fontWeight: bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Icon(
                    Icons.circle_outlined,
                    size: 0.2,
                  ),
                ],
              ),
              const SizedBox(
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
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range_outlined,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '17 Agu 2023 - 17 Nov 2023',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'ProximaNova',
                          letterSpacing: 0.5,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Jenis Pertanyaan',
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 15,
                  fontWeight: bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardFilter(title: 'Chat yang selesai'),
                  CardFilter(title: 'Chat yang selesai')
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonGreenWidget(
                title: 'Tampilkan',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
