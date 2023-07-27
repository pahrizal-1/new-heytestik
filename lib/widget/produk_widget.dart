import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_obat_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';

import '../theme/theme.dart';

class ProdukKeranjang extends StatelessWidget {
  final String namaBrand;
  final String namaProduk;
  final String diskonProduk;
  final String hargaDiskon;
  final String harga;
  final String urlImg;
  final String rating;
  const ProdukKeranjang({
    super.key,
    required this.namaBrand,
    required this.namaProduk,
    required this.diskonProduk,
    required this.hargaDiskon,
    required this.harga,
    required this.urlImg,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: subwhiteColor, width: 0.6),
      ),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const DetailSkinCarePage(),
          //   ),
          // );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 135,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(urlImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
                padding: const EdgeInsets.only(left: 8, right: 9, bottom: 10),
                constraints: const BoxConstraints(maxWidth: 130),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaBrand,
                      style: blackHigtTextStyle.copyWith(fontSize: 13),
                    ),
                    Text(
                      namaProduk,
                      style: blackHigtTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: const Color.fromRGBO(201, 42, 42, 0.2)),
                          child: Center(
                            child: Text(
                              diskonProduk,
                              style: blackHigtTextStyle.copyWith(
                                  color: redColor, fontSize: 11),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          hargaDiskon,
                          style: subGreyTextStyle.copyWith(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            color: const Color(0xff9B9B9B),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      harga,
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: yellowColor,
                          size: 18,
                        ),
                        Text(
                          rating,
                          style: subGreyTextStyle.copyWith(
                              fontSize: 11, color: const Color(0xff9B9B9B)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 5, top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: greenColor,
                        ),
                        child: Center(
                          child: Text(
                            '+ Keranjang',
                            style: whiteTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class ProdukObat extends StatelessWidget {
  final String namaBrand;

  final String harga;
  final String urlImg;

  const ProdukObat({
    Key? key,
    required this.namaBrand,
    required this.harga,
    required this.urlImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailObatPage()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 0.2),
              borderRadius: BorderRadius.circular(7),
            ),
            width: 164,
            child: Column(
              children: [
                Image.asset(
                  urlImg,
                  width: 164,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 11, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namaBrand,
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        harga,
                        style: blackHigtTextStyle.copyWith(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Per Tube',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 12, color: const Color(0xFF9B9B9B)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Dapat dibeli hingga 20 April 2023',
                        style: grenTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: medium,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 30,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '+ Keranjang',
                              style: whiteTextStyle.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProdukTreatment extends StatelessWidget {
  final String namaKlinik;
  final String namaTreatmen;
  final String lokasiKlinik;
  final String diskonProduk;
  final String hargaDiskon;
  final String harga;
  final String urlImg;
  final String rating;
  final String km;
  const ProdukTreatment({
    Key? key,
    required this.namaKlinik,
    required this.namaTreatmen,
    required this.diskonProduk,
    required this.hargaDiskon,
    required this.harga,
    required this.urlImg,
    required this.rating,
    required this.km,
    required this.lokasiKlinik,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: borderColor, width: 0.2),
        borderRadius: BorderRadius.circular(7),
      ),
      margin: const EdgeInsets.only(right: 7),
      width: 150,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BokingTreatment()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 250),
              height: 107,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                image: DecorationImage(
                    image: AssetImage(urlImg), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              padding: const EdgeInsets.only(left: 11, right: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaKlinik,
                    style: blackHigtTextStyle.copyWith(
                        fontSize: 13, overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    namaTreatmen,
                    style: blackHigtTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: regular,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: const Color.fromRGBO(201, 42, 42, 0.2)),
                        child: Center(
                          child: Text(
                            '$diskonProduk%',
                            style: blackHigtTextStyle.copyWith(
                                color: redColor, fontSize: 11),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rp $hargaDiskon',
                        style: subGreyTextStyle.copyWith(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          color: const Color(0xff9B9B9B),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rp$harga',
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    lokasiKlinik,
                    style: subGreyTextStyle.copyWith(
                      fontSize: 12,
                      color: const Color(0xff9B9B9B),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: yellowColor,
                        size: 18,
                      ),
                      Text(
                        '4.9 (120k)',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        'assets/icons/mapgrey.png',
                        width: 9,
                      ),
                      Text(
                        ' $km Km',
                        style: subGreyTextStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                        child: Text(
                          'Reservasi',
                          style: whiteTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
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
    );
  }
}

Widget buildImg1(String images, int index) => Image.asset(
      images,
      fit: BoxFit.cover,
    );

class DetailProduk extends StatelessWidget {
  final String price;
  final String? priceDiscon;
  final String? discon;
  final String nameProduk;
  final String item;
  final String urlImg;

  const DetailProduk({
    Key? key,
    required this.price,
    required this.nameProduk,
    required this.item,
    required this.urlImg,
    this.priceDiscon = '',
    this.discon = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.only(left: 15, bottom: 15, top: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xffD9D9D9),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            urlImg,
            width: 65,
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameProduk,
                  style: grenTextStyle.copyWith(fontSize: 15),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '$item item',
                  style: blackRegulerTextStyle,
                ),
                const SizedBox(
                  width: 3,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    priceDiscon != ''
                        ? Text(
                            priceDiscon.toString(),
                            style: subGreyTextStyle.copyWith(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                              color: const Color(0xff9B9B9B),
                            ),
                          )
                        : Container(),
                    discon != ''
                        ? Text(
                            discon.toString(),
                            style: grenTextStyle.copyWith(fontSize: 14),
                          )
                        : Container(),
                    Text(
                      'Rp$price',
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
