// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/cara_pembayaran_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/selesai_pembayaran_konsultasi_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/success_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/detail_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/solution/obat_solutions_page.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_skincare_page.dart';
import 'package:heystetik_mobileapps/pages/solution/solutions_treatment1_Page.dart';
import '../pages/setings&akun/ulasan_settings_page.dart';
import '../theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import 'package:heystetik_mobileapps/models/customer/treatmet_model.dart'
    as Treatment;

class TransaksiKonsultan extends StatelessWidget {
  final String namaDokter;
  final String tanggal;
  final String pesanan;
  final String progres;
  final String img;
  final String keluhan;
  final int harga;
  final String expireDate;
  bool doneReview;
  final String orderId;
  final int paymentMethodId;
  final String vaNumber;
  TransaksiKonsultan({
    super.key,
    required this.namaDokter,
    required this.tanggal,
    required this.pesanan,
    required this.progres,
    this.keluhan = '',
    required this.harga,
    required this.img,
    this.expireDate = '',
    this.doneReview = false,
    required this.orderId,
    required this.paymentMethodId,
    required this.vaNumber,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (progres == 'Menunggu Pembayaran') {
          Get.to(() => SelesaikanPembayaranKonsultasiPage(
                isWillPop: false,
                orderId: orderId,
                expireTime: '',
                paymentMethodId: paymentMethodId,
              ));
        }

        if (progres == 'Ready') {
          Get.to(() => SuccessPage(
                isNotConsultation: false,
                orderId: orderId,
                isWillPop: false,
              ));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600, spreadRadius: 0.5, blurRadius: 1)
            ]),
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
                                        ? const Color.fromARGB(
                                            255, 255, 204, 170)
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
                      img == '-' || img == ''
                          ? Container()
                          : Container(
                              height: 37,
                              width: 37,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                    image: NetworkImage(img),
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
                      CurrencyFormat.convertToIdr(harga, 0),
                      style: blackHigtTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const Spacer(),
                progres == 'Selesai'
                    ? doneReview
                        ? Container()
                        : InkWell(
                            onTap: () {
                              Get.to(() => UlasanSetingsPage());
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
                            () => const SelectConditionsPage(),
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
                          Get.to(() => CaraPembayaranPage(
                                id: paymentMethodId,
                                orderId: orderId,
                                totalPaid: harga,
                                // vaNumber: vaNumber,
                                transactionType: 'Konsultasi',
                              ));
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
      ),
    );
  }
}

class TransaksiProduk extends StatelessWidget {
  Detail? product;
  String orderId;
  TransaksiProduk({
    super.key,
    required this.orderId,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product?.status.toString() == 'MENUNGGU_PEMBAYARAN') {
          Get.to(() => SelesaikanPembayaranProdukPage(
                isWillPop: false,
                orderId: orderId,
                expireTime: '',
                paymentMethodId: product!.paymentMethodId!,
              ));
        }
        if (product?.status.toString() == 'SELESAI') {
          Get.to(() => DetailTransaksiPage());
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600, spreadRadius: 0.5, blurRadius: 1)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Produk',
                      style: blackHigtTextStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      ConvertDate.defaultDate(product!.createdAt.toString()),
                      style: blackRegulerTextStyle.copyWith(fontSize: 10),
                    )
                  ],
                ),
                const Spacer(),
                product?.status.toString() == 'MENUNGGU_PEMBAYARAN'
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Bayar Sebelum'),
                          Text(
                            product!.paymentExpiryTime == null
                                ? ''
                                : ConvertDate.payBefore(
                                    product!.paymentExpiryTime ?? '-'),
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
                            color: product?.status.toString() ==
                                    'MENUNGGU_PEMBAYARAN'
                                ? const Color.fromARGB(255, 255, 204, 170)
                                : product?.status.toString() ==
                                        'PESANAN_DIPROSES'
                                    ? const Color.fromARGB(255, 255, 204, 170)
                                    : product?.status.toString() == 'DIKIRIM'
                                        ? subgreenColor
                                        : product?.status.toString() ==
                                                'TERKIRIM'
                                            ? subgreenColor
                                            : product?.status.toString() ==
                                                    'SELESAI'
                                                ? subgreenColor
                                                : subgreenColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          product?.status.toString() == 'MENUNGGU_PEMBAYARAN'
                              ? 'Menunggu Pembayaran'
                              : product?.status.toString() == 'PESANAN_DIPROSES'
                                  ? 'Pesanan Diproses'
                                  : product?.status.toString() == 'DIKIRIM'
                                      ? 'Dikirim'
                                      : product?.status.toString() == 'TERKIRIM'
                                          ? 'Terkirim'
                                          : product?.status.toString() ==
                                                  'SELESAI'
                                              ? 'Selesai'
                                              : 'Selesai',
                          style: grenTextStyle.copyWith(
                            fontSize: 10,
                            color: product?.status.toString() ==
                                    'MENUNGGU_PEMBAYARAN'
                                ? const Color.fromARGB(255, 255, 102, 0)
                                : product?.status.toString() ==
                                        'PESANAN_DIPROSES'
                                    ? const Color.fromARGB(255, 255, 102, 0)
                                    : product?.status.toString() == 'DIKIRIM'
                                        ? greenColor
                                        : product?.status.toString() ==
                                                'TERKIRIM'
                                            ? subgreenColor
                                            : product?.status.toString() ==
                                                    'SELESAI'
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
            Column(
              children: [
                for (int i = 0;
                    i < product!.transactionProductItems!.length;
                    i++)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 37,
                          width: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${Global.FILE}/${product!.transactionProductItems?[i].product!.mediaProducts?[0].media?.path}'),
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
                              product!.transactionProductItems?[i].product
                                      ?.name ??
                                  '-',
                              style: blackHigtTextStyle.copyWith(fontSize: 13),
                            ),
                            Text(
                              product!.transactionProductItems?[i].product
                                      ?.type ??
                                  '-',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                      'Total Belanja',
                      style: blackRegulerTextStyle.copyWith(fontSize: 13),
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(product?.totalPaid, 0),
                      style: blackHigtTextStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const Spacer(),
                product?.status.toString() == 'SELESAI'
                    ? product!.transactionProductItems![0].productReview == null
                        ? InkWell(
                            onTap: () {
                              Get.to(() => UlasanSetingsPage());
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
                        : Container()
                    : Container(),
                const SizedBox(
                  width: 5,
                ),
                product?.status.toString() == 'SELESAI'
                    ? InkWell(
                        onTap: () {
                          if (product!
                                  .transactionProductItems?[0].product?.type ==
                              'DRUGS') {
                            Get.to(() => const ObatSolutionsPage());
                          }
                          if (product!
                                  .transactionProductItems?[0].product?.type ==
                              'SKINCARE') {
                            Get.to(() => const SolutionSkincare1Page());
                          }
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
                              'Beli Lagi',
                              style: grenTextStyle.copyWith(fontSize: 13),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                product?.status.toString() == 'MENUNGGU_PEMBAYARAN'
                    ? InkWell(
                        onTap: () {
                          Get.to(() => CaraPembayaranPage(
                                id: product!.paymentMethodId!,
                                orderId: orderId,
                                totalPaid: product!.totalPaid!,
                                transactionType: 'Produk',
                              ));
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
      ),
    );
  }
}

class TransaksiTreatment extends StatelessWidget {
  List<TransactionTreatmentItems>? item;
  // final String nameProduk;
  final String orderId;
  final String tanggal;
  final String expireDate;
  final String pesanan;
  final String progres;
  // final String img;
  // final String namaKlink;
  bool doneReview;
  final int harga;
  // final Data2 treatment;
  final bool isConsultation;
  final int paymentMethodId;
  final String vaNumber;
  TransaksiTreatment({
    super.key,
    required this.item,
    required this.orderId,
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
    this.doneReview = false,
    required this.paymentMethodId,
    required this.vaNumber,
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
                color: Colors.grey.shade600, spreadRadius: 0.5, blurRadius: 1)
          ]),
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
          for (int i = 0; i < item!.length; i++)
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
                            '${Global.FILE}/${item?[i].treatment!.mediaTreatments?[0].media?.path}',
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
                        item![i].treatment!.name ?? '-',
                        style: blackHigtTextStyle.copyWith(fontSize: 13),
                      ),
                      Text(
                        item?[i].treatment?.clinic!.name ?? '-',
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
                    CurrencyFormat.convertToIdr(harga, 0),
                    style: blackHigtTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              progres == 'Selesai'
                  ? doneReview
                      ? Container()
                      : InkWell(
                          onTap: () {
                            Get.to(() => UlasanSetingsPage());
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
                        Get.to(() => SolutionsTreatment1Page());
                        // Get.to(()=>BokingTreatment(
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
                        Get.to(() => CaraPembayaranPage(
                              id: paymentMethodId,
                              orderId: orderId,
                              totalPaid: harga,
                              // vaNumber: vaNumber,
                              transactionType: 'Treatment',
                              treatment: Treatment.Data2.fromJson(
                                jsonDecode(
                                  jsonEncode(item![0].treatment),
                                ),
                              ),
                              pax: item?[0].pax,
                            ));
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
