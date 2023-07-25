import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/cara_pembayaran_page.dart';

import '../theme/theme.dart';

class TransaksiKonsultan extends StatelessWidget {
  final String nameProduk;
  final String tanggal;
  final String pesanan;
  final String progres;
  final String img;
  final String jumlahBarang;

  final String harga;

  final bool isConsultation;
  const TransaksiKonsultan({
    super.key,
    required this.nameProduk,
    required this.tanggal,
    required this.pesanan,
    required this.progres,
    this.jumlahBarang = '',
    required this.harga,
    required this.img,
    this.isConsultation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
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
                    color: progres == 'Menunggu Pembayaran'
                        ? const Color.fromARGB(255, 255, 204, 170)
                        : progres == 'Review'
                            ? const Color.fromARGB(255, 255, 204, 170)
                            : progres == 'Aktif'
                                ? subgreenColor
                                : progres == 'Selesai'
                                    ? subgreenColor
                                    : subgreenColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  progres,
                  style: grenTextStyle.copyWith(
                    fontSize: 10,
                    color: progres == 'Menunggu Pembayaran'
                        ? const Color.fromARGB(255, 255, 102, 0)
                        : progres == 'Review'
                            ? const Color.fromARGB(255, 255, 102, 0)
                            : progres == 'Aktif'
                                ? greenColor
                                : progres == 'Selesai'
                                    ? greenColor
                                    : greenColor,
                  ),
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
                    jumlahBarang,
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
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
                    'Total Harga',
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    harga,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              progres == 'Aktif' || progres == 'Selesai'
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 5),
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
                    )
                  : Container(),
              const SizedBox(
                width: 5,
              ),
              progres == 'Aktif' || progres == 'Selesai'
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Konsultasi lagi',
                          style: grenTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    )
                  : Container(),
              progres == 'Menunggu Pembayaran'
                  ? InkWell(
                      onTap: () {
                        Get.to(const CaraPembyaranPage());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            'Lihat cara bayar',
                            style: grenTextStyle.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}

class TransaksiProduk extends StatelessWidget {
  final String nameProduk;
  final String tanggal;
  final String pesanan;
  final String progres;
  final String img;
  final String keluhan;
  final String? produkLainnya;
  final String harga;
  final bool isConsultation;
  const TransaksiProduk({
    super.key,
    required this.nameProduk,
    required this.tanggal,
    required this.pesanan,
    required this.progres,
    this.keluhan = '',
    this.produkLainnya = '',
    required this.harga,
    required this.img,
    this.isConsultation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
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
                    color: progres == 'Menunggu Pembayaran'
                        ? const Color.fromARGB(255, 255, 204, 170)
                        : progres == 'Review'
                            ? const Color.fromARGB(255, 255, 204, 170)
                            : progres == 'Aktif'
                                ? subgreenColor
                                : progres == 'Selesai'
                                    ? subgreenColor
                                    : subgreenColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  progres,
                  style: grenTextStyle.copyWith(
                    fontSize: 10,
                    color: progres == 'Menunggu Pembayaran'
                        ? const Color.fromARGB(255, 255, 102, 0)
                        : progres == 'Review'
                            ? const Color.fromARGB(255, 255, 102, 0)
                            : progres == 'Aktif'
                                ? greenColor
                                : progres == 'Selesai'
                                    ? greenColor
                                    : greenColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          progres == 'Menunggu Pembayaran'
              ? Container()
              : Row(
                  children: [
                    Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            image: AssetImage(img), fit: BoxFit.cover),
                      ),
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
                          keluhan,
                          style: blackRegulerTextStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
          isConsultation
              ? Container()
              : produkLainnya != ''
                  ? const SizedBox(
                      height: 7,
                    )
                  : Container(),
          isConsultation
              ? Container()
              : produkLainnya != ''
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
                    'Total Belanja',
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    harga,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              progres == 'Aktif' || progres == 'Selesai'
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 5),
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
                    )
                  : Container(),
              const SizedBox(
                width: 5,
              ),
              progres == 'Aktif' || progres == 'Selesai'
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Beli Lagi',
                          style: grenTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    )
                  : Container(),
              progres == 'Menunggu Pembayaran'
                  ? InkWell(
                      onTap: () {
                        Get.to(const CaraPembyaranPage());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            'Lihat cara bayar',
                            style: grenTextStyle.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}

class TransaksiTreatment extends StatelessWidget {
  final String nameProduk;
  final String tanggal;
  final String pesanan;
  final String progres;
  final String img;
  final String namaKlink;

  final String harga;

  final bool isConsultation;
  const TransaksiTreatment({
    super.key,
    required this.nameProduk,
    required this.tanggal,
    required this.pesanan,
    required this.progres,
    this.namaKlink = '',
    required this.harga,
    required this.img,
    this.isConsultation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
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
                    color: progres == 'Menunggu Pembayaran'
                        ? const Color.fromARGB(255, 255, 204, 170)
                        : progres == 'Review'
                            ? const Color.fromARGB(255, 255, 204, 170)
                            : progres == 'Aktif'
                                ? subgreenColor
                                : progres == 'Selesai'
                                    ? subgreenColor
                                    : subgreenColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  progres,
                  style: grenTextStyle.copyWith(
                    fontSize: 10,
                    color: progres == 'Menunggu Pembayaran'
                        ? const Color.fromARGB(255, 255, 102, 0)
                        : progres == 'Review'
                            ? const Color.fromARGB(255, 255, 102, 0)
                            : progres == 'Aktif'
                                ? greenColor
                                : progres == 'Selesai'
                                    ? greenColor
                                    : greenColor,
                  ),
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
                    namaKlink,
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
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
                    'Total Harga',
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    harga,
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              progres == 'Aktif' || progres == 'Selesai'
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 5),
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
                    )
                  : Container(),
              const SizedBox(
                width: 5,
              ),
              progres == 'Aktif' || progres == 'Selesai'
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: greenColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Reservasi lagi',
                          style: grenTextStyle.copyWith(fontSize: 13),
                        ),
                      ),
                    )
                  : Container(),
              progres == 'Menunggu Pembayaran'
                  ? InkWell(
                      onTap: () {
                        Get.to(const CaraPembyaranPage());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            'Lihat cara bayar',
                            style: grenTextStyle.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
