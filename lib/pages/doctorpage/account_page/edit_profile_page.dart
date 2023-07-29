import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../widget/text_form_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isSelected = false;
  final DoctorProfileController state = Get.put(DoctorProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    state.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fromCssColor('#ECECEC'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Ubah Profile',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    color: whiteColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 65,
                      width: 65,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/doctor1.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ubah Foto Profil',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 13,
                        fontWeight: bold,
                        color: greenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 17, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Pribadi',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontWeight: bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TetxFromProfilEdit(
                      title1: 'Nama Lengkap',
                      controller: state.nama,
                      icon: Icons.person,
                    ),
                    TetxFromProfilEdit(
                      title1: 'Spesialisasi',
                      controller: state.spesialisasi,
                      icon: Icons.edit,
                    ),
                    TetxFromProfilEdit(
                      title1: 'email',
                      controller: state.email,
                      icon: Icons.email,
                    ),
                    TetxFromProfilEdit(
                      title1: 'No. Handphone',
                      controller: state.noHp,
                      icon: Icons.call,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Text(
                            'Jenis kelamin',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 13,
                              letterSpacing: 0.5,
                              color: fromCssColor('#999999'),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 170),
                          child: RichText(
                            text: TextSpan(
                              text: 'Wanita',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: fromCssColor('#323232'),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                      child: Center(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 130,
                              child: Text(
                                'Tanggal Lahir',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 13,
                                  letterSpacing: 0.5,
                                  color: fromCssColor('#999999'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              child: RichText(
                                text: TextSpan(
                                  text: '17 Agustus 1980',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: fromCssColor('#323232'),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.date_range_outlined,
                          color: fromCssColor('#999999'),
                          size: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 17, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Pribadi',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontWeight: bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Nomor SIP',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 13,
                              letterSpacing: 0.5,
                              color: fromCssColor('#999999'),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 170),
                          child: RichText(
                            text: TextSpan(
                              text: '123/ABC/456/2022',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: fromCssColor('#323232'),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                      child: Center(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Nomor STR',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 13,
                              letterSpacing: 0.5,
                              color: fromCssColor('#999999'),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 170),
                          child: RichText(
                            text: TextSpan(
                              text: '1234567890123456',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: fromCssColor('#323232'),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                      child: Center(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Pendidikan Terakhir',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 13,
                              letterSpacing: 0.5,
                              color: fromCssColor('#999999'),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 170),
                          child: RichText(
                            text: TextSpan(
                              text: 'PPDS Universitas Indonesia',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: fromCssColor('#323232'),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                      child: Center(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Tempat Praktek',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 13,
                              height: 1.2,
                              letterSpacing: 0.5,
                              color: fromCssColor('#999999'),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 170),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  '• Klinik Erha Mampang \n• Klinik Evitderma Jakarta',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                height: 1.2,
                                color: fromCssColor('#323232'),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.white,
                height: 60,
                child: Center(
                  child: Text(
                    'Simpan Data',
                    style: TextStyle(
                      color: greenColor,
                      fontFamily: 'ProximaNova',
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.white,
                height: 60,
                child: Center(
                  child: Text(
                    'Tutup Akun',
                    style: TextStyle(
                      color: greenColor,
                      fontFamily: 'ProximaNova',
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
