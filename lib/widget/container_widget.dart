// ignore_for_file: non_constant_identifier_names

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

Container ContainerSchedule = Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jane Cooper',
              style: TextStyle(
                  color: fromCssColor('#323232'),
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: fromCssColor('#1ACE42')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '10:00 WIB',
                      style: TextStyle(
                        color: fromCssColor('#6B6B6B'),
                        fontFamily: 'ProximaNova',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Category: Face Concerns',
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 11,
                    color: fromCssColor('#A3A3A3')),
              ),
            ),
            Text(
              'Topic: Acne Scars (Bopeng bekas jerawat)',
              style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 11,
                  color: fromCssColor('#A3A3A3')),
            ),
          ],
        ),
        InkWell(
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenColor,
            ),
            child: Center(
              child: Text(
                'Terima',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  ),
);

Container ContainerDoctor = Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: fromCssColor('#1ACE42')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Jane Cooper',
                  style: TextStyle(
                      color: fromCssColor('#323232'),
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Jadwal: 24 Feb 2023 | 10:00 WIB',
                style: TextStyle(
                  color: fromCssColor('#6B6B6B'),
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Category: Face Concerns',
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 11,
                    color: fromCssColor('#A3A3A3')),
              ),
            ),
            Text(
              'Topic: Acne Scars (Bopeng bekas jerawat)',
              style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 11,
                  color: fromCssColor('#A3A3A3')),
            ),
          ],
        ),
        InkWell(
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: fromCssColor('#6DC0B3'),
            ),
            child: Center(
              child: Text(
                'Terima',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  ),
);

Container WidgetPhoto = Container(
  height: 150,
  width: 150,
  child: InkWell(
    onTap: () {},
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      color: fromCssColor('#CCCCCC'),
      strokeWidth: 1,
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/upload-cam.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 120),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Belum ada foto dari ‘My Journey’',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: fromCssColor('#9B9B9B'),
                      letterSpacing: 0.6,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ),
);

class ContainerSettings extends StatelessWidget {
  final String title;
  final bool isLogout;
  const ContainerSettings({
    Key? key,
    required this.title,
    this.isLogout = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isLogout ? greenColor : null,
                fontSize: 15,
                letterSpacing: 0.2,
                fontFamily: 'ProximaNova',
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: isLogout ? greenColor : null,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerProduk extends StatelessWidget {
  final String imageProduk;
  final String merkProduk;
  final String penggunaanJadwal;
  final String penggunaan;
  final String harga;
  final String stock;
  final String jenisProduk;

  const ContainerProduk({
    Key? key,
    required this.imageProduk,
    required this.merkProduk,
    required this.penggunaanJadwal,
    required this.penggunaan,
    required this.harga,
    required this.stock,
    required this.jenisProduk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: fromCssColor(
            '#D9D9D9',
          ),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 17, right: 5, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SvgPicture.asset(
                'assets/icons/cekbox.svg',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: fromCssColor('#E9E9E9')),
                        image: DecorationImage(
                          image: AssetImage(imageProduk),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 160),
                          child: RichText(
                            text: TextSpan(
                              text: merkProduk,
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: greenColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Penggunaan',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 12,
                                height: 1.3,
                                letterSpacing: 0.5,
                                color: fromCssColor(
                                  '#9B9B9B',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // color: Colors.amberAccent,
                                  constraints:
                                      const BoxConstraints(maxWidth: 80),
                                  child: Text(
                                    penggunaanJadwal,
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 12,
                                      height: 1.3,
                                      letterSpacing: 0.5,
                                      color: fromCssColor(
                                        '#9B9B9B',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  penggunaan,
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 12,
                                    height: 1.3,
                                    letterSpacing: 0.5,
                                    color: fromCssColor(
                                      '#9B9B9B',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              harga,
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: fromCssColor(
                                  '#323232',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/icons/troli.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  stock,
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    color: fromCssColor(
                                      '#323232',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Catatan',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greenColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greenColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: jenisProduk,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        color: fromCssColor('#A3A3A3'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerProdukPenting extends StatelessWidget {
  final String imageProduk;
  final String merkProduk;
  final String penggunaanJadwal;
  final String penggunaan;
  final String harga;
  final String stock;
  final String jenisProduk;

  const ContainerProdukPenting({
    Key? key,
    required this.imageProduk,
    required this.merkProduk,
    required this.penggunaanJadwal,
    required this.penggunaan,
    required this.harga,
    required this.stock,
    required this.jenisProduk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: fromCssColor(
            '#D9D9D9',
          ),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 5, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SvgPicture.asset(
                    'assets/icons/cekbox.svg',
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: fromCssColor('#E9E9E9')),
                            image: DecorationImage(
                              image: AssetImage(
                                imageProduk,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 160),
                              child: RichText(
                                text: TextSpan(
                                  text: merkProduk,
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: greenColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    height: 1.1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Penggunaan',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 12,
                                    height: 1.3,
                                    letterSpacing: 0.5,
                                    color: fromCssColor(
                                      '#9B9B9B',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 80),
                                      child: Text(
                                        penggunaanJadwal,
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      penggunaan,
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 12,
                                        height: 1.3,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#9B9B9B',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  harga,
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 13,
                                    fontWeight: bold,
                                    letterSpacing: 0.5,
                                    color: fromCssColor(
                                      '#323232',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 15,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/icons/troli.png'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      stock,
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 13,
                                        fontWeight: bold,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#323232',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 250,
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Catatan',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greenColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greenColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: jenisProduk,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                            color: fromCssColor('#A3A3A3'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              transform: Matrix4.translationValues(-12, -10, 0),
              width: 82,
              height: 35,
              decoration: const BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage('assets/icons/penting.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
