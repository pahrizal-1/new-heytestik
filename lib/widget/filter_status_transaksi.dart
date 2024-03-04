// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/filter_radio_button_widget.dart';

import '../theme/theme.dart';
import 'button_widget.dart';

class FilterStatusTransaksi extends StatefulWidget {
  String? val;
  FilterStatusTransaksi({super.key, this.val});

  @override
  State<FilterStatusTransaksi> createState() => _FilterStatusTransaksiState();
}

class _FilterStatusTransaksiState extends State<FilterStatusTransaksi> {
  List data = [
    {"text": "Menunggu Pembayaran", "value": "MENUNGGU_PEMBAYARAN"},
    {"text": "Pesanan Diproses", "value": "PESANAN_DIPROSES"},
    {"text": "Dikirim", "value": "DIKIRIM"},
    {"text": "Terkirim", "value": "TERKIRIM"},
    {
      "text": "Menunggu Konfirmasi Klinik",
      "value": "MENUNGGU_KONFIRMASI_KLINIK"
    },
    {"text": "Klinik Mengkonfirmasi", "value": "KLINIK_MENGKONFIRMASI"},
    {"text": "Ready", "value": "READY"},
    {"text": "Review", "value": "REVIEW"},
    {"text": "Aktif", "value": "AKTIF"},
    {"text": "Selesai", "value": "SELESAI"}
  ];
  String? status;

  @override
  void initState() {
    super.initState();
    status = widget.val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 33, right: 33, bottom: 10),
        height: 50,
        child: ButtonGreenWidget(
          title: 'Tampilkan',
          onPressed: () {
            if (status is String) {
              Navigator.pop(context, status);
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertWidget(
                  subtitle: "Harap pilih status transaksi terlebih dahulu",
                ),
              );
            }
          },
        ),
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 33,
            right: 33,
            top: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/danger-icons.png',
                      width: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Text(
                    'Status Transaksi',
                    style: blackHigtTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 39,
              ),
              ...data.map((e) {
                return filterRadioButtonWidget(
                  onTap: () {
                    status = e['text'];
                    setState(() {});
                  },
                  title: e['text'],
                  isSelected: status == e['text'],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
