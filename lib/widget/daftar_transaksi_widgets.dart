import 'package:flutter/material.dart';

import '../theme/theme.dart';

class DaftarTransaksiProduk extends StatelessWidget {
  final String nameProduk;
  final String tanggal;
  final String pesanan;
  final String progres;
  final String img;
  final String jumlahBarang;
  final String? produkLainnya;
  final String totalBelanjaan;
  final String harga;
  final String titleButton;
  final Color colorTittleProgres;
  final Color colortittleBg;
  const DaftarTransaksiProduk({
    super.key,
    required this.nameProduk,
    required this.tanggal,
    required this.pesanan,
    required this.progres,
    required this.jumlahBarang,
    this.produkLainnya = '',
    required this.totalBelanjaan,
    required this.harga,
    required this.titleButton,
    required this.colorTittleProgres,
    required this.colortittleBg,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: blackColor,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pesanan,
                    style: blackHigtTextStyle.copyWith(fontSize: 15),
                  ),
                  Text(
                    tanggal,
                    style: blackRegulerTextStyle.copyWith(fontSize: 10),
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: colortittleBg,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  progres,
                  style: grenTextStyle.copyWith(
                      fontSize: 10, color: colorTittleProgres),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Container(
                height: 37,
                width: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameProduk,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    '$jumlahBarang barang',
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          produkLainnya != ''
              ? Text(
                  produkLainnya.toString(),
                  style: blackRegulerTextStyle.copyWith(color: blackColor),
                )
              : Container(),
          const SizedBox(
            height: 14,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    totalBelanjaan,
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    harga,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    'Ulas',
                    style: whiteTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: greenColor),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    titleButton,
                    style: grenTextStyle.copyWith(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UlasanProuduk extends StatelessWidget {
  final String nameProduk;
  final String tanggal;
  final VoidCallback? onPressed;
  final String img;
  final String namabrand;
  final String titleButton;
  const UlasanProuduk({
    super.key,
    required this.nameProduk,
    required this.tanggal,
    required this.namabrand,
    required this.titleButton,
    required this.img,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: blackColor,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                tanggal,
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 12, color: blackColor),
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/check-green.png',
                width: 13,
                height: 13,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameProduk,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    namabrand,
                    style: blackRegulerTextStyle.copyWith(
                        fontSize: 13, color: blackColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: onPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Tulis Ulasan',
                          style: grenTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
