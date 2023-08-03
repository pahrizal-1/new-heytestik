// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/cara_pembayaran_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solutions_treatment1_Page.dart';
import '../pages/setings&akun/ulasan_settings_page.dart';
import '../theme/theme.dart';

class TransaksiKonsultan extends StatelessWidget {
  final String namaDokter;
  final String tanggal;
  final String pesanan;
  final String progres;
  final String img;
  final String keluhan;
  final String harga;
  final String expireDate;
  const TransaksiKonsultan({
    super.key,
    required this.namaDokter,
    required this.tanggal,
    required this.pesanan,
    required this.progres,
    this.keluhan = '',
    required this.harga,
    required this.img,
    this.expireDate = '',
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
              progres == 'Menunggu Pembayaran'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Bayar Sebelum'),
                        Text(
                          expireDate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 102, 0),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                          color: progres == 'Menunggu Pembayaran'
                              ? const Color.fromARGB(255, 255, 204, 170)
                              : progres == 'Ready'
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
                              : progres == 'Ready'
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
          progres == 'Menunggu Pembayaran' || progres == 'Ready'
              ? Text(
                  keluhan,
                  style: blackRegulerTextStyle.copyWith(fontSize: 13),
                )
              : Row(
                  children: [
                    Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaDokter,
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
              progres == 'Selesai'
                  ? InkWell(
                      onTap: () {
                        Get.to(UlasanSetingsPage());
                      },
                      child: Container(
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
                      ),
                    )
                  : Container(),
              const SizedBox(
                width: 5,
              ),
              progres == 'Aktif' || progres == 'Selesai'
                  ? InkWell(
                      onTap: () {
                        Get.to(
                          const SelectConditionsPage(),
                        );
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
                            'Konsultasi lagi',
                            style: grenTextStyle.copyWith(fontSize: 13),
                          ),
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
  dynamic item;
  // final String nameProduk;
  final String tanggal;
  final String expireDate;
  final String pesanan;
  final String progres;
  // final String img;
  // final String namaKlink;

  final String harga;
  // final Data2 treatment;
  final bool isConsultation;
  TransaksiTreatment({
    super.key,
    required this.item,
    // required this.nameProduk,
    required this.tanggal,
    this.expireDate = '',
    required this.pesanan,
    required this.progres,
    // required this.namaKlink,
    required this.harga,
    // required this.treatment,
    // required this.img,
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
              progres == 'Menunggu Pembayaran'
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Bayar Sebelum'),
                        Text(
                          expireDate,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 102, 0),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                          color: progres == 'Menunggu Pembayaran'
                              ? const Color.fromARGB(255, 255, 204, 170)
                              : progres == 'Menunggu Konfirmasi Klinik'
                                  ? const Color.fromARGB(255, 255, 204, 170)
                                  : progres == 'Klinik Mengkonfirmasi'
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
                              : progres == 'Menunggu Konfirmasi Klinik'
                                  ? const Color.fromARGB(255, 255, 102, 0)
                                  : progres == 'Klinik Mengkonfirmasi'
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
          for (int i = 0; i < item.length; i++)
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: NetworkImage(
                            '${Global.FILE}/${item[i].treatment.mediaTreatments[0].media.path}',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item[i].treatment.name,
                        style: blackHigtTextStyle.copyWith(fontSize: 13),
                      ),
                      Text(
                        item[i].treatment.clinic.name,
                        style: blackRegulerTextStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
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
              progres == 'Selesai'
                  ? InkWell(
                      onTap: () {
                        Get.to(UlasanSetingsPage());
                      },
                      child: Container(
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
                      ),
                    )
                  : Container(),
              const SizedBox(
                width: 5,
              ),
              progres == 'Klinik Mengkonfirmasi' || progres == 'Selesai'
                  ? InkWell(
                      onTap: () {
                        Get.to(SolutionsTreatment1Page());
                        // Get.to(BokingTreatment(
                        //   treatment: item[0].treatment as Data2,
                        // ));
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
                            'Reservasi lagi',
                            style: grenTextStyle.copyWith(fontSize: 13),
                          ),
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
