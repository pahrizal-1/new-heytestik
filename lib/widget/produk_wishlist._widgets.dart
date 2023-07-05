import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ProdukWitlist extends StatelessWidget {
  final String namaBrand;
  final String namaProduk;
  final String diskonProduk;
  final String hargaDiskon;
  final String kota;

  final String harga;
  final String urlImg;
  final String rating;
  const ProdukWitlist(
      {super.key,
      required this.namaBrand,
      required this.namaProduk,
      required this.diskonProduk,
      required this.hargaDiskon,
      required this.kota,
      required this.harga,
      required this.urlImg,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 0.2),
            borderRadius: BorderRadius.circular(7),
          ),
          width: 164,
          child: Column(
            children: [
              Container(
                height: 135,
                width: 164,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(urlImg))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaBrand,
                      style: blackTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      namaProduk,
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 13, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 4,
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
                          width: 4,
                        ),
                        Text(
                          'Rp$hargaDiskon',
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
                      height: 3,
                    ),
                    Text(kota, style: subTitleTextStyle),
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
                      height: 12,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                              child: Image.asset(
                            'assets/icons/more-horizontal.png',
                            width: 12,
                          )),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: greenColor),
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                '+ Keranjang',
                                style: grenTextStyle.copyWith(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
