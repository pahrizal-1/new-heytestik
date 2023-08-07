import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/cutome_poto_journey.dart';
import 'package:heystetik_mobileapps/pages/myJourney/pilih_skin_goals.dart';
import 'package:heystetik_mobileapps/pages/myJourney/galery_my_journey.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';
import 'package:image_picker/image_picker.dart';

import '../../widget/button_widget.dart';
import 'hasil_kosultasi_page.dart';

class HomeMyjourney extends StatefulWidget {
  const HomeMyjourney({super.key});

  @override
  State<HomeMyjourney> createState() => _HomeMyjourneyState();
}

File? imagePath;

class _HomeMyjourneyState extends State<HomeMyjourney> {
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
                'My Journey',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 25,
              right: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skin Goal',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(PilihSkinGoals());
                  },
                  child: Row(
                    children: [
                      Text(
                        'Pilih Skin Goal kamu',
                        style: subTitleTextStyle,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                        color: greenColor,
                      ),
                    ],
                  ),
                ),
                dividergrey(),
                const SizedBox(
                  height: 39,
                ),
                InkWell(
                    onTap: () {
                      customeshomodal(
                          context,
                          Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CustomeCameaJorney(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Kamera',
                                        style: blackRegulerTextStyle.copyWith(
                                            fontSize: 15, color: blackColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 21,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _pickImageFromGalery();
                                        });
                                      },
                                      child: Text(
                                        'Dari galeri',
                                        style: blackRegulerTextStyle.copyWith(
                                            fontSize: 15, color: blackColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 21,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'CANCEL',
                                            style:
                                                blackRegulerTextStyle.copyWith(
                                                    fontSize: 15,
                                                    color: blackColor),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ));
                    },
                    child: Image.asset('assets/images/ambil-poto.png')),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/ambil-poto-kosong.png',
                      width: 103,
                      height: 104,
                    ),
                    Image.asset(
                      'assets/images/ambil-poto-kosong.png',
                      width: 103,
                      height: 104,
                    ),
                    Image.asset(
                      'assets/images/ambil-poto-kosong.png',
                      width: 103,
                      height: 104,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                ButtonWhiteWidget(
                  title: 'Lihat Journey-mu',
                  onPressed: () {
                    Get.to(GaleryMyJourney());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          const dividergreen(),
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 25, right: 25, bottom: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Riwayat hasil konsultasi',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  'Catatan dokter terkait skingoal kamu',
                  style: subTitleTextStyle.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 13,
                ),
                //// Sebelum Customer Docter ///////////////////////////
                InkWell(
                  onTap: () {
                    Get.to(SelectConditionsPage());
                  },
                  child: Container(
                    height: 95,
                    width: 340,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 30),
                    decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Catatan dokter terkait skingoal kamu',
                          style: subTitleTextStyle,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Chat Doctor',
                            style: grenTextStyle.copyWith(fontSize: 15),
                            children: [
                              TextSpan(
                                  text: ' Sekarang, yuk!',
                                  style: blackRegulerTextStyle)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //// Sesudah Customer Docter ///////////////////////////
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Konsultasi dengan',
                            style: blackTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 36,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/doctor1.png')),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'dr. Risty Hafinah, Sp.DV',
                                    style: subTitleTextStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    'Kamu akan konsultasi lagi: Sel,\n12 Mar 2023; 17:30 WIB',
                                    style: grenTextStyle.copyWith(fontSize: 11),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: 25,
                            width: 74,
                            child: Center(
                              child: Text(
                                'Terjadwal',
                                style: whiteTextStyle.copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(color: greenColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: 25,
                            width: 74,
                            child: Center(
                              child: Text(
                                'Ingatkan Saya',
                                style: grenTextStyle.copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(HasilKosultasiPage());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Konsultasi dengan',
                              style: blackTextStyle.copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 35,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/doctor1.png')),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'dr. Risty Hafinah, Sp.DV',
                                      style: subTitleTextStyle.copyWith(
                                        fontSize: 13,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    Text(
                                      '12 Feb 2023; 17:30 WIB',
                                      style: subTitleTextStyle.copyWith(
                                          fontSize: 11),
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Image.asset(
                                      'assets/icons/plus-icosn.png',
                                      width: 24,
                                      height: 24,
                                      color: Color(0xfff9B9B9B),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffCCCCCC),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              height: 25,
                              width: 74,
                              child: Center(
                                child: Text(
                                  'Selesai',
                                  style: whiteTextStyle.copyWith(fontSize: 10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: greenColor),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              height: 25,
                              width: 74,
                              child: Center(
                                child: Text(
                                  'Chat Ulang',
                                  style: grenTextStyle.copyWith(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 25, right: 25, bottom: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal treatment kamu',
                  style: blackTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  height: 95,
                  width: 340,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Catatan dokter terkait skingoal kamu',
                        style: subTitleTextStyle,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'ChatDoctor',
                          style: grenTextStyle.copyWith(fontSize: 15),
                          children: [
                            TextSpan(
                              text: ' Sekarang, yuk!',
                              style: blackRegulerTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Konsultasi dengan',
                            style: blackTextStyle.copyWith(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: 36,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/lheatea1.png',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Peeling TCA Ringan',
                                    style: blackTextStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    'Klinik Utama Lithea',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    'Sel, 12 Mar 2023 17:30 WIB',
                                    style: grenTextStyle.copyWith(fontSize: 11),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffCCCCCC),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: 25,
                            width: 74,
                            child: Center(
                              child: Text(
                                'Selesai',
                                style: whiteTextStyle.copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(color: greenColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: 25,
                            width: 74,
                            child: Center(
                              child: Text(
                                'Chat Ulang',
                                style: grenTextStyle.copyWith(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const dividergreen(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Artikel ini mungkin relate buat kamu',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Liat Semua',
                      style: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: greenColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home3.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home3.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home3.png'))),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Atasi Kebotakan Karena Alopecia Androgenetik',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'ProximaNova',
                              ),
                              strutStyle: StrutStyle(
                                height: 0.5,
                                leading: 0.7,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  '22 Februari 2023',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/icons/dot.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Steffana Dewi',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGalery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    imagePath = File(returnedImage.path);
  }
}
